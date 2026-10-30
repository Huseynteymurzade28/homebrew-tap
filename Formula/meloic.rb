class Meloic < Formula
  desc "Terminal music player with album covers, waveform, queue and themes"
  homepage "https://github.com/Huseynteymurzade28/meloic"
  url "https://github.com/Huseynteymurzade28/meloic/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "c51a0b43c44292f3aebeacbfedd389cba79e5fb1fd1d962a1d93eec51a217313"
  license "MIT"

  depends_on "rust" => :build

  # Sound goes through ALSA on Linux.
  on_linux do
    depends_on "pkgconf" => :build
    depends_on "alsa-lib"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # meloic takes no flags. Pointed at a folder with no music it says so and
    # exits without opening the interface.
    assert_match "No music found", shell_output("#{bin}/meloic #{testpath}")
  end
end
