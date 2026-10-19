class Tuiba < Formula
  desc "Game Boy Advance emulator running in your terminal"
  homepage "https://github.com/Huseynteymurzade28/tuiba"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.15.1/tuiba-v0.15.1-aarch64-apple-darwin.tar.gz"
      sha256 "7f7f2b56658492aef2b862c5b3424e43ea1fedc1e7ea3f8ce832ec70e5f54652"
    end
    on_intel do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.15.1/tuiba-v0.15.1-x86_64-apple-darwin.tar.gz"
      sha256 "64b3b0ff4221b788dfe60bb4ac26d72775a87feb985c94c557a02fdc8d4b7d2d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.15.1/tuiba-v0.15.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d8e2bad39a9e4907856f762d5345ce9b65181fb2cf87effd3785f74cd720df09"
    end
    on_intel do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.15.1/tuiba-v0.15.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e4acc282ad4fcbc508f210ce640fe8d29ba2f9400cdc9220dc01b8c384a714e"
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
