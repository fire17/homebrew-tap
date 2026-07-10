class Bettercd < Formula
  desc "Better cd - zoxide-aware, auto-mkdir, with undo. Pure shell, zero deps"
  homepage "https://github.com/fire17/bettercd"
  url "https://github.com/fire17/bettercd/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "6dbeba8b1ebee3e249f7df69c5ba3ad9459faa7ffd34e89973725a5c0344dcf9"
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
