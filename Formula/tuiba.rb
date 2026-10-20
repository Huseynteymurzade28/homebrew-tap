class Tuiba < Formula
  desc "Game Boy Advance emulator running in your terminal"
  homepage "https://github.com/Huseynteymurzade28/tuiba"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.16.0/tuiba-v0.16.0-aarch64-apple-darwin.tar.gz"
      sha256 "3963853342f64dc43c6fa84590df82bd490c0749d82613253a6257722615f0a2"
    end
    on_intel do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.16.0/tuiba-v0.16.0-x86_64-apple-darwin.tar.gz"
      sha256 "c0bc00e9735fea97610d52cbdb367f0d2f64851861340ed7d304f26647efc62f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.16.0/tuiba-v0.16.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1c93bef04cc07d9be0cf57a5ee160c5ef7bfb351dccefc33d41ae9f1170515ed"
    end
    on_intel do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.16.0/tuiba-v0.16.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c760a7792bb60d40f242c9194ee846f6fe29edeae2106c7f5252644f6a2df7b"
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
