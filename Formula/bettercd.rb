class Bettercd < Formula
  desc "Better cd - zoxide-aware, auto-mkdir, with undo. Pure shell, zero deps"
  homepage "https://github.com/fire17/bettercd"
  url "https://github.com/fire17/bettercd/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "d3ca6a17b3eb3c9b2a6fd8daf3e5b4adc2297150a274f77e814c3301c13a3587"
  license "MIT"

  def install
    pkgshare.install "bettercd.sh", "bettercd.plugin.zsh", "tests"
  end

  def caveats
    <<~EOS
      Add to your ~/.zshrc (or ~/.bashrc), AFTER any `zoxide init` line:
        source #{opt_pkgshare}/bettercd.sh
      Then restart your shell and run:  bettercd doctor
    EOS
  end

  test do
    system "sh", "-c", ". #{pkgshare}/bettercd.sh && bettercd version | grep -q bettercd"
  end
end
