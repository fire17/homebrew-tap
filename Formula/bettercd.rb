class Bettercd < Formula
  desc "Better cd - zoxide-aware, auto-mkdir, with undo. Pure shell, zero deps"
  homepage "https://github.com/fire17/bettercd"
  url "https://github.com/fire17/bettercd/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "1a77f375a65a0722d9087d5e005fb8e124623b3f1df766554f283e711c2964ed"
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
