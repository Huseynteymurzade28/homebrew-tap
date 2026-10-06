class Tuiba < Formula
  desc "Game Boy Advance emulator running in your terminal"
  homepage "https://github.com/Huseynteymurzade28/tuiba"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.10.0/tuiba-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "d98157e21a8275c439615130de222168b4c69d649c61c1059e0636779f64e8ef"
    end
    on_intel do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.10.0/tuiba-v0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "da383c3a82105281d8cb44026a7e34996a7df21f2db938fbd9bddc9b8059ce61"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.10.0/tuiba-v0.10.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1abb7b12657d4784cb1b90487b355ca9b66f04ede8d8d4c16564266e31df7ccc"
    end
    on_intel do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.10.0/tuiba-v0.10.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "03eae313431bc87a45ddb72c71205ead9b0260f367faacc364b48725e1c7b602"
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
