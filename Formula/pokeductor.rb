# Written by pokeductor's release workflow for v0.7.0. Edits here are
# overwritten by the next release.
class Pokeductor < Formula
  desc "Terminal Pokedex and evolution analyzer"
  homepage "https://github.com/Huseynteymurzade28/pokeductor"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Huseynteymurzade28/pokeductor/releases/download/v0.7.0/pokeductor-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "8d610fef12ee10de34820fddcb44b903ea2d0b3cc731e2c160ecbcdd11c37141"
    end
    on_intel do
      url "https://github.com/Huseynteymurzade28/pokeductor/releases/download/v0.7.0/pokeductor-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "bf7976c5c8aec485995ee14f300420c5764b16b48bf628d4f6d62beaa5bbc4cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Huseynteymurzade28/pokeductor/releases/download/v0.7.0/pokeductor-v0.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "564bd168a304527749f1c06480cbdcf90484fbfa15bdcdad437d25fea2cafdf8"
    end
    on_intel do
      url "https://github.com/Huseynteymurzade28/pokeductor/releases/download/v0.7.0/pokeductor-v0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d5823d38ed6e17261a82604b4c993cb6967973f9aede99a73c82a5a73fa43384"
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
