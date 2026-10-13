class Tuiba < Formula
  desc "Game Boy Advance emulator running in your terminal"
  homepage "https://github.com/Huseynteymurzade28/tuiba"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.14.0/tuiba-v0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "2ce27cf01c872daf09a95a7170bc2a14e9af19823497415c9a07362df019cc8f"
    end
    on_intel do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.14.0/tuiba-v0.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "2012faeb8a7f3539cd50ab2105224cb9058a135c9b1824164d0c5c3335b77ccf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.14.0/tuiba-v0.14.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8e677d65fdd7f99c556925804b8b340ceb41b2991e5e4f3dd56f6923bdf4da7e"
    end
    on_intel do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.14.0/tuiba-v0.14.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "65b81e49763e5e6c9a1528ca9eee9aec414dbf335367a6b6cc0224f77825dd62"
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
