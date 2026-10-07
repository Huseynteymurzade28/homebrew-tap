class Tuiba < Formula
  desc "Game Boy Advance emulator running in your terminal"
  homepage "https://github.com/Huseynteymurzade28/tuiba"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.11.0/tuiba-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "b82868a240493d05bc89b96f88d39982d465a7c2168f2d673285023649bf662e"
    end
    on_intel do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.11.0/tuiba-v0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "500937950bc81cc2e9a8b6d55bca80be44798d1728c028f23da6c30bc2b329d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.11.0/tuiba-v0.11.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bc18ba44e6fd30441e556c321e4e0957c17ccba5d93a24e6e5560cf4c486603d"
    end
    on_intel do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.11.0/tuiba-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c66eee32892d0fcdead018918e111767284754e3e3b631b7cc133f522c5f88aa"
    end

    # The Linux build links ALSA for sound and libudev for gamepads.
    depends_on "alsa-lib"
    depends_on "systemd"
  end

  def install
    bin.install "tuiba"
  end

  test do
    assert_match "usage: tuiba", shell_output("#{bin}/tuiba --help")
  end
end
