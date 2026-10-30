class Tuiba < Formula
  desc "Game Boy Advance emulator running in your terminal"
  homepage "https://github.com/Huseynteymurzade28/tuiba"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.17.0/tuiba-v0.17.0-aarch64-apple-darwin.tar.gz"
      sha256 "c368feb9c0541e035864803a1b4b76541a27a8d5ba082643064ca6360f75e1e8"
    end
    on_intel do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.17.0/tuiba-v0.17.0-x86_64-apple-darwin.tar.gz"
      sha256 "76ce3c2ded3365e1c63eec2a878c77261424ea8380588cd11892672a400bf521"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.17.0/tuiba-v0.17.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f3762921369a8f4508707cb512028186e3b4ffec6b78822c227300e51bd27328"
    end
    on_intel do
      url "https://github.com/Huseynteymurzade28/tuiba/releases/download/v0.17.0/tuiba-v0.17.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b108fb0e6247debf565c0e7ef42770758cea3b5b6ddad86cb1429ea98e1edf96"
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
