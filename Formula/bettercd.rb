class Bettercd < Formula
  desc "Better cd - zoxide-aware, auto-mkdir, with undo. Pure shell, zero deps"
  homepage "https://github.com/fire17/bettercd"
  url "https://github.com/fire17/bettercd/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5da30c961c4b7b75bf545cf21637843f8fc00c178c17fc4588e942fe04e16fce"
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
