class Okf < Formula
  desc "Domain-neutral, Git-native persistent project memory for AI agents (OKF v0.2)"
  homepage "https://github.com/okf-memory/okf-agent-memory"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.4/okf-darwin-arm64"
      sha256 "c90b480f0af350e8960e72699ac2709425acd71c25aa2a8880924b809008f025"

      def install
        bin.install "okf-darwin-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.4/okf-darwin-amd64"
      sha256 "d6ab0bf5ad82843e35ea69de610c93ce258a600a72591596cbef15faa60b9031"

      def install
        bin.install "okf-darwin-amd64" => "okf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.4/okf-linux-arm64"
      sha256 "89b597aa0f979a749dcf2d7931683c04760fdcb4e69c8617632cfd84cf3d7093"

      def install
        bin.install "okf-linux-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.4/okf-linux-amd64"
      sha256 "0c723ac2789a910d11dec2e2fd981348ce1aada0db4031c1e073c1bfab92b4fa"

      def install
        bin.install "okf-linux-amd64" => "okf"
      end
    end
  end

  test do
    assert_match "okf version #{version}", shell_output("#{bin}/okf version")
    (testpath/"knowledge").mkpath
    system "#{bin}/okf", "init", testpath/"knowledge"
    assert_predicate testpath/"knowledge/index.md", :exist?
  end
end
