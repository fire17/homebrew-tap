class Betterkill < Formula
  desc "Better kill - pids, %jobs, :ports, and names. Pure shell, zero deps"
  homepage "https://github.com/fire17/betterkill"
  url "https://github.com/fire17/betterkill/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "22bd7701b97d49070df2f5ababfd06af11f05866eb81bd366bf2b08f0be4d4a9"
  license "MIT"

  def install
    pkgshare.install "betterkill.sh", "tests", "completions"
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
