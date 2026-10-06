# homebrew-tap

Homebrew formulae for my terminal tools, for macOS and Linux.

```bash
brew tap huseynteymurzade28/tap
brew install pokeductor
```

or in one step, `brew install huseynteymurzade28/tap/<formula>`.

| Formula | What it is | Installs |
|---|---|---|
| [`pokeductor`](https://github.com/Huseynteymurzade28/pokeductor) | Terminal Pokedex and evolution analyzer | Prebuilt binary, completions, man page |
| [`tuiba`](https://github.com/Huseynteymurzade28/tuiba) | Game Boy Advance emulator in the terminal | Prebuilt binary |
| [`flerp`](https://github.com/Huseynteymurzade28/flerp) | TUI for exploring and analyzing text, PDFs and images | Built from source with Rust |
| [`kizamu`](https://github.com/Huseynteymurzade28/Kizamu) | Terminal typing test: WPM and accuracy | Built from source with Zig 0.16 |

Nothing here is bumped by hand. `pokeductor` is written by its own release
workflow on every tagged release. For the others, the Bump workflow checks
once a day for a new release (a new tag, for flerp), rewrites the formula's
URLs and checksums, and installs, tests and audits it on macOS and Linux. It
pushes only the formulae that pass. A failure, or a Kizamu release that needs
a Zig package the formula does not pin yet, fails the run and is left for a
look. Every formula is also tested the same way on each pull request.
