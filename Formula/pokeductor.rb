# Written by pokeductor's release workflow for v0.6.0. Edits here are
# overwritten by the next release.
class Pokeductor < Formula
  desc "Terminal Pokedex and evolution analyzer"
  homepage "https://github.com/Huseynteymurzade28/pokeductor"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Huseynteymurzade28/pokeductor/releases/download/v0.6.0/pokeductor-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "4e2745a4e0f191d585a328029511933eaf2c0555855591bd71198880ceba3815"
    end
    on_intel do
      url "https://github.com/Huseynteymurzade28/pokeductor/releases/download/v0.6.0/pokeductor-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "5516a92aaa6910eef20072c8ca4edb2ed59e94c047e07560dfeba02d2f764dd2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Huseynteymurzade28/pokeductor/releases/download/v0.6.0/pokeductor-v0.6.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "dcf6fa86a28a93481b96909aecce1a8be4ec0a2e6c94917e317903b1f8edac01"
    end
    on_intel do
      url "https://github.com/Huseynteymurzade28/pokeductor/releases/download/v0.6.0/pokeductor-v0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "dc032ad7c44d459237275273421f4b7c568478c43dc18422bf3168092b60a8a6"
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
