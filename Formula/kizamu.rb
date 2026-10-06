class Kizamu < Formula
  desc "Terminal typing test that measures WPM and accuracy"
  homepage "https://github.com/Huseynteymurzade28/Kizamu"
  url "https://github.com/Huseynteymurzade28/Kizamu/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "8689de7f1a272099b40918b1668a9cf96d547224ee37e28489e338202a5dce7d"
  license "MIT"

  # build.zig.zon asks for 0.16, and Zig's standard library changes between
  # minor versions.
  depends_on "zig@0.16" => :build

  # The Zig packages from build.zig.zon (libvaxis and its own dependencies),
  # pinned so the build never fetches. Each is staged under the hash Zig
  # files it by and handed over with --system.
  resource "vaxis-0.6.0-BWNV_AIQDADLTDo5jCn27pBWJBvi-sTrSkSKwITQWgUV" do
    url "https://github.com/rockorager/libvaxis/archive/f37c42a3b324131c131d066767968e1f5b976453.tar.gz"
    sha256 "d9d3988ed3d3bf0033b21f05c8997b15c917934090d74991c4ae82f29b0b8094"
  end

  resource "zigimg-0.1.0-8_eo2oyaFwBZwJpmqPkCfVXWBrHcqbYwmrp1I6bTD3lI" do
    url "https://github.com/zigimg/zigimg/archive/d695acd97c02e57bb151e8f659d1280f5cd6ca70.tar.gz"
    sha256 "487794b6f28a8380d17a4960d3c53ef2f466d3075b92e8ebf3f84ec6b568545d"
  end

  resource "uucode-0.2.0-ZZjBPlK5VADj7fdoq7G8LIHzD5o6FSkcBXXrRWr4jnrA" do
    url "https://github.com/jacobsandlund/uucode/archive/2826a37a4562284fdacd8fa029d49509cc9bffcd.tar.gz"
    sha256 "7e76fc7fab1e7ac728c52b35bbb3e5b8c639841abfc7fe1a4bcb13050594bc9e"
  end

  def install
    resources.each { |r| r.stage(buildpath/"zig-pkgs"/r.name) }
    system "zig", "build", *std_zig_args, "--system", buildpath/"zig-pkgs"
  end

  test do
    # Kizamu is all interface and takes no flags, so there is nothing to run
    # without a terminal.
    assert_predicate bin/"kizamu", :executable?
  end
end
