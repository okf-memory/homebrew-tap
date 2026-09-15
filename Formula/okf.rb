class Okf < Formula
  desc "Domain-neutral, Git-native persistent project memory for AI agents (OKF v0.2)"
  homepage "https://github.com/okf-memory/okf-agent-memory"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.3.0/okf-darwin-arm64"
      sha256 "d896b5ba4dd9225e5d74e5fb214eaa56069b832a79a50a933a8c8d13dbe6bf75"

      def install
        bin.install "okf-darwin-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.3.0/okf-darwin-amd64"
      sha256 "a99bc2256884661081c2a5ab1e8ce1aa078d6b8f536d1637f37aa60118bc1915"

      def install
        bin.install "okf-darwin-amd64" => "okf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.3.0/okf-linux-arm64"
      sha256 "72ba1dc3d47d610035c8c71f77d1277503e78d02a9d908bc4728b1bacd766abe"

      def install
        bin.install "okf-linux-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.3.0/okf-linux-amd64"
      sha256 "0e6dd9ba62252919b05edbc9e4450e96bd3c7fdd816c7bfef608c615bb8ecb15"

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
