class Betterkill < Formula
  desc "Better kill - pids, %jobs, :ports, and names. Pure shell, zero deps"
  homepage "https://github.com/fire17/betterkill"
  url "https://github.com/fire17/betterkill/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0f381019a56d2005da0928eed2c1dcd60e5d2e9ca4cf7780a1b92777725e331a"
  license "MIT"

  def install
    pkgshare.install "betterkill.sh", "tests"
  end

  def caveats
    <<~EOS
      Add to your ~/.zshrc (or ~/.bashrc):
        source #{opt_pkgshare}/betterkill.sh
      Then open a new shell and run:  betterkill status
    EOS
  end

  test do
    system "sh", "-c", ". #{pkgshare}/betterkill.sh && betterkill version | grep -q betterkill"
  end
end
