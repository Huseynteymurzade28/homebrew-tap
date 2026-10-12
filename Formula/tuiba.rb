class Tuiba < Formula
  desc "Game Boy Advance emulator running in your terminal"
  homepage "https://github.com/Huseynteymurzade28/tuiba"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.13.0/tuiba-v0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "9e7942236c36812dc502cf29aa00b98e8a69103cb4e169a1f312e21082b727fd"
    end
    on_intel do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.13.0/tuiba-v0.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "86f63d59cc921fd327988b4287eaf741df0d72f1d9d59a46b97321e5fec89bc1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.13.0/tuiba-v0.13.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "210b618b9c633cff842bc7f6fcd1c6503970f627e7fe3e56ede356349f641c11"
    end
    on_intel do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.13.0/tuiba-v0.13.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0fafc1be73136934280908556bebe8518de4a2e33ad3738fc666fac3ceb799c1"
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
