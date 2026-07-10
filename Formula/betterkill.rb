class Betterkill < Formula
  desc "Better kill - pids, %jobs, :ports, and names. Pure shell, zero deps"
  homepage "https://github.com/fire17/betterkill"
  url "https://github.com/fire17/betterkill/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "c1d147e4e62c5bb11ac5ed575fd39b9018be6f223864d4e9a02049dd753764f5"
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
