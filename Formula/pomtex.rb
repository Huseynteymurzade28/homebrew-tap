class Pomtex < Formula
  desc "On-demand LaTeX: portable TeX kernel that installs CTAN packages when needed"
  homepage "https://github.com/Huseynteymurzade28/pomtex"
  url "https://github.com/Huseynteymurzade28/pomtex/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "90561441abae808e5f8f8de355c8162c3971a62fea3564cb4c89b5e0d2e60d31"
  license "MIT"
  head "https://github.com/Huseynteymurzade28/pomtex.git", branch: "main"

  depends_on "crystal" => :build
  depends_on "bdw-gc"
  depends_on "openssl@4"
  depends_on "pcre2"
  depends_on "xz"

  uses_from_macos "zlib"

  def install
    system "crystal", "build", "src/pomtex.cr", "-o", "pomtex", "--release", "--no-debug"
    bin.install "pomtex"
    generate_completions_from_executable(bin/"pomtex", "completions")
    (man1/"pomtex.1").write Utils.safe_popen_read(bin/"pomtex", "manpage")
  end

  def caveats
    <<~EOS
      The first build downloads a portable TeX kernel (50-65 MB) into
      ~/.cache/pomtex, unless a TeX installation is already on PATH. Packages
      are fetched from CTAN as documents need them.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pomtex --version")
    (testpath/"hello.tex").write <<~TEX
      \\documentclass{article}
      \\usepackage{booktabs}
      \\begin{document}
      Hello.
      \\end{document}
    TEX
    assert_match "booktabs.sty", shell_output("#{bin}/pomtex scan --offline hello.tex 2>&1")
  end
end
