# Written by pokeductor's release workflow for v0.7.1. Edits here are
# overwritten by the next release.
class Pokeductor < Formula
  desc "Terminal Pokedex and evolution analyzer"
  homepage "https://github.com/Huseynteymurzade28/pokeductor"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Huseynteymurzade28/pokeductor/releases/download/v0.7.1/pokeductor-v0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "3026e847b839cd00148be2a4bd69f99feac41203ce3a57c35bcc901d690b1a8e"
    end
    on_intel do
      url "https://github.com/Huseynteymurzade28/pokeductor/releases/download/v0.7.1/pokeductor-v0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "5e3fd96c3b57b37959494ddf7f00f58e71f99e4e8626cf023273a63dfcc9d442"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Huseynteymurzade28/pokeductor/releases/download/v0.7.1/pokeductor-v0.7.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7df0e2c39668c9901bf3965a3c3ef38ec47d4d33b6cb659400df9ed00832ebf2"
    end
    on_intel do
      url "https://github.com/Huseynteymurzade28/pokeductor/releases/download/v0.7.1/pokeductor-v0.7.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "63994fe48924c93a94d064ce1a2cce01dfd67e06d9ef045c6990c6d84771c87e"
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
