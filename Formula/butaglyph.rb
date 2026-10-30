class Butaglyph < Formula
  desc "Fast, shell-agnostic prompt for bash, zsh, fish and PowerShell"
  homepage "https://github.com/Huseynteymurzade28/butaglyph"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Huseynteymurzade28/butaglyph/releases/download/v0.5.0/buta-v0.5.0-aarch64-macos.tar.gz"
      sha256 "efc59b00621007854413ba43057272423e68690a9009654cb5b6c88b776dd9ea"
    end
    on_intel do
      url "https://github.com/Huseynteymurzade28/butaglyph/releases/download/v0.5.0/buta-v0.5.0-x86_64-macos.tar.gz"
      sha256 "966a1ad010e6735cc3a81f1ca2eb93b6c9ec6ab4296f2f966e30a986659787db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Huseynteymurzade28/butaglyph/releases/download/v0.5.0/buta-v0.5.0-aarch64-linux.tar.gz"
      sha256 "9fe0e178a807e32b583338ad4e08d2a98103d70e0f08b4cef87dfc6a7d9eaa66"
    end
    on_intel do
      url "https://github.com/Huseynteymurzade28/butaglyph/releases/download/v0.5.0/buta-v0.5.0-x86_64-linux.tar.gz"
      sha256 "b17ae6fba57810dabf8b5341f7d03a9223d3cf4c35b0c3f22fe4b47ad53abb74"
    end
  end

  def install
    bin.install "buta"
  end

  def caveats
    <<~EOS
      The command is `buta`. Add one line to your shell's startup file:
        bash:  eval "$(buta init bash)"
        zsh:   eval "$(buta init zsh)"
        fish:  buta init fish | source
    EOS
  end

  test do
    assert_match "buta #{version}", shell_output("#{bin}/buta --version")
  end
end
