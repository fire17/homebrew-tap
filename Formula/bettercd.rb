class Bettercd < Formula
  desc "Better cd - zoxide-aware, auto-mkdir, with undo. Pure shell, zero deps"
  homepage "https://github.com/fire17/bettercd"
  url "https://github.com/fire17/bettercd/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "120deda8499721dc09a2e84fa6226fb10f1c036176a25ce558c61afeb926946f"
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
