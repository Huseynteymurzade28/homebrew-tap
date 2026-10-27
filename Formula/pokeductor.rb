# Written by pokeductor's release workflow for v0.8.0. Edits here are
# overwritten by the next release.
class Pokeductor < Formula
  desc "Terminal Pokedex and evolution analyzer"
  homepage "https://github.com/Huseynteymurzade28/pokeductor"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Huseynteymurzade28/pokeductor/releases/download/v0.8.0/pokeductor-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "ef965762a240cece9c5bb7758c53c0c1bb605e4a2c71dd20660aa05dd289648f"
    end
    on_intel do
      url "https://github.com/Huseynteymurzade28/pokeductor/releases/download/v0.8.0/pokeductor-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "432839002d09fa551947afe888f71a87b4d339be60d3f0c8594e5c11a4aa694d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Huseynteymurzade28/pokeductor/releases/download/v0.8.0/pokeductor-v0.8.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b4c95a101c2c36e9b06bfd966314e0fb1361a6fb3c92e5cc0468456140d84ddf"
    end
    on_intel do
      url "https://github.com/Huseynteymurzade28/pokeductor/releases/download/v0.8.0/pokeductor-v0.8.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2bb5bdffdbd7fcbd88e83eef25ca024bbfeaba7c98344bf3dbd7d90c933b3b69"
    end
  end

  def install
    bin.install "pokeductor"
    bash_completion.install "completions/pokeductor.bash" => "pokeductor"
    zsh_completion.install "completions/_pokeductor"
    fish_completion.install "completions/pokeductor.fish"
    man1.install "man/pokeductor.1"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pokeductor --version")
    assert_match "pokeductor", shell_output("#{bin}/pokeductor --cache-dir")
  end
end
