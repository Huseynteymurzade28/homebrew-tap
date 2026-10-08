class Tuiba < Formula
  desc "Game Boy Advance emulator running in your terminal"
  homepage "https://github.com/Huseynteymurzade28/tuiba"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.12.0/tuiba-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "5486dbfe9d9548f0f543ca9fcaa8df78b566a022b0a9e42a19826898e205e277"
    end
    on_intel do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.12.0/tuiba-v0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "288512ca93ccbde9c0135b6a093d5f8a9c1d4fd2c6bee9d2273bc311764cd883"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.12.0/tuiba-v0.12.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a9dc62ec3284c2a95381c7502b3e84312f0f5a31c028bc031dff8c8420d3e82f"
    end
    on_intel do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.12.0/tuiba-v0.12.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "43e49101244109aab59b228e15b7f1949a65a9de610b98e64de23583ce20ffbd"
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
