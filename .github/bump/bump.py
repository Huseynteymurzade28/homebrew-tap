#!/usr/bin/env python3
"""Moves hand-maintained formulae to their project's newest version.

    bump.py                 check every formula in FORMULAE, rewrite the stale ones
    bump.py --only tuiba    just one

Writes the changed formulae in place and, under GitHub Actions, two outputs:
`formulae`, a JSON list of the ones rewritten, and `manual`, a JSON list of
the ones that have a new version this script cannot take on its own.

pokeductor is not here: its own release workflow writes its formula.
"""

import hashlib
import json
import os
import re
import subprocess
import sys
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
OWNER = "Huseynteymurzade28"

# formula -> (repository, where its versions come from).
#
# "release" for anything installed from release assets, or that publishes
# releases at all: a tag is pushed before its release workflow has uploaded
# anything, and a formula pointing at assets that do not exist yet would fail
# to install. flerp has tags and no releases, so tags are all there is.
FORMULAE = {
    "tuiba": ("tuiba", "release"),
    "flerp": ("flerp", "tag"),
    "kizamu": ("Kizamu", "release"),
    "pomtex": ("pomtex", "release"),
}

SEMVER_TAG = re.compile(r"^v(\d+)\.(\d+)\.(\d+)$")


def gh_api(path):
    out = subprocess.run(
        ["gh", "api", path], check=True, capture_output=True, text=True
    ).stdout
    return json.loads(out)


def latest_version(repo, source):
    if source == "release":
        tag = gh_api(f"repos/{OWNER}/{repo}/releases/latest")["tag_name"]
    else:
        tags = [t["name"] for t in gh_api(f"repos/{OWNER}/{repo}/tags?per_page=100")]
        versions = [m.groups() for m in map(SEMVER_TAG.match, tags) if m]
        tag = "v" + ".".join(max(versions, key=lambda v: tuple(map(int, v))))
    match = SEMVER_TAG.match(tag)
    if not match:
        raise SystemExit(f"{repo}: latest {source} {tag!r} is not a vX.Y.Z tag")
    return tag[1:]


def sha256_of(url):
    digest = hashlib.sha256()
    request = urllib.request.Request(url, headers={"User-Agent": "homebrew-tap bump"})
    with urllib.request.urlopen(request) as response:
        for chunk in iter(lambda: response.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def project_urls(text, repo):
    """The `url` lines that point at the project itself, as (index, url).
    Resource URLs (Kizamu's Zig packages) point elsewhere and are left alone."""
    prefix = f"https://github.com/{OWNER}/{repo}/"
    return [
        (i, m.group(1))
        for i, line in enumerate(text.splitlines())
        if (m := re.match(r'\s*url "([^"]+)"', line)) and m.group(1).startswith(prefix)
    ]


def current_version(text, repo):
    _, url = project_urls(text, repo)[0]
    match = re.search(r"/v(\d+\.\d+\.\d+)[/.]", url)
    if not match:
        raise SystemExit(f"{repo}: no version in {url}")
    return match.group(1)


def zig_dependencies_changed(repo, version, text):
    """Whether the new tag's build.zig.zon names a package hash the formula has
    no resource for. Kizamu's packages are pinned as resources named by their
    hash, and a new hash means a new resource with a checksum of its own, which
    is a change worth looking at rather than guessing."""
    url = f"https://raw.githubusercontent.com/{OWNER}/{repo}/v{version}/build.zig.zon"
    with urllib.request.urlopen(url) as response:
        zon = response.read().decode()
    wanted = set(re.findall(r'\.hash\s*=\s*"([^"]+)"', zon))
    pinned = set(re.findall(r'resource "([^"]+)"', text))
    return sorted(wanted - pinned)


def bump(name, repo, source):
    path = ROOT / "Formula" / f"{name}.rb"
    text = path.read_text()
    old = current_version(text, repo)
    new = latest_version(repo, source)
    if tuple(map(int, new.split("."))) <= tuple(map(int, old.split("."))):
        print(f"{name}: {old} is current")
        return None

    if re.search(r'^\s*resource "', text, re.M):
        missing = zig_dependencies_changed(repo, new, text)
        if missing:
            print(f"::error::{name} {new} needs packages the formula does not pin: "
                  f"{', '.join(missing)}. Add them as resources by hand.")
            return "manual"

    lines = text.splitlines(keepends=True)
    for index, url in project_urls(text, repo):
        new_url = url.replace(f"v{old}", f"v{new}")
        lines[index] = lines[index].replace(url, new_url)
        # The checksum is the first sha256 line after its url.
        sha_index = next(
            i for i in range(index + 1, len(lines)) if re.match(r'\s*sha256 "', lines[i])
        )
        lines[sha_index] = re.sub(r'"[0-9a-f]{64}"', f'"{sha256_of(new_url)}"', lines[sha_index])
    path.write_text("".join(lines))
    print(f"{name}: {old} -> {new}")
    return "bumped"


def main():
    only = sys.argv[sys.argv.index("--only") + 1] if "--only" in sys.argv else None
    bumped, manual = [], []
    for name, (repo, source) in FORMULAE.items():
        if only and name != only:
            continue
        result = bump(name, repo, source)
        if result == "bumped":
            bumped.append(name)
        elif result == "manual":
            manual.append(name)

    if "GITHUB_OUTPUT" in os.environ:
        with open(os.environ["GITHUB_OUTPUT"], "a") as out:
            out.write(f"formulae={json.dumps(bumped)}\n")
            out.write(f"manual={json.dumps(manual)}\n")


if __name__ == "__main__":
    main()
