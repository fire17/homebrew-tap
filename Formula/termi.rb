class Termi < Formula
  desc "Your Terminal Friend — doctor, packs, editor keys, typo recovery, any shell, any AI harness"
  homepage "https://github.com/fire17/termi"
  url "https://github.com/fire17/termi/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "cb4575d20a270665373a83fa631a380c65f4a121dae9cf074198f9b7e54e72a0"
  license "MIT"

  depends_on "python@3.13"

  def install
    libexec.install "bin", "packs", "support", "skills"
    (bin/"termi").write <<~EOS
      #!/bin/bash
      exec "#{Formula["python@3.13"].opt_bin}/python3" "#{libexec}/bin/termi" "$@"
    EOS
  end

  test do
    assert_match "termi 0.2.0", shell_output("#{bin}/termi version")
  end
end
