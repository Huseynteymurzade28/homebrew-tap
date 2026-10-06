class Flerp < Formula
  desc "Terminal UI for exploring and analyzing text files, PDFs and images"
  homepage "https://github.com/Huseynteymurzade28/flerp"
  url "https://github.com/Huseynteymurzade28/flerp/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "654544d30aae99a1cff0108f54704af911949dd454861e39698147759479cfb7"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/flerp --version")
  end
end
