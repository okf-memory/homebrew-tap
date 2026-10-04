class Okf < Formula
  desc "Domain-neutral, Git-native persistent project memory for AI agents (OKF v0.2)"
  homepage "https://github.com/okf-memory/okf-agent-memory"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.6.0/okf-darwin-arm64"
      sha256 "8a025d794460a7f11d69a3f255af54cb86445c4da12d27ffcbecbef8dcbc950b"

      def install
        bin.install "okf-darwin-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.6.0/okf-darwin-amd64"
      sha256 "82641d563891c4da7d87b14cdca2b4e8e7364217cfb01ee052d20bc6b6be70c5"

      def install
        bin.install "okf-darwin-amd64" => "okf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.6.0/okf-linux-arm64"
      sha256 "c713be4298fc14a09aae12d57c568c73ebfebe23ce866974cd702bfe1826c54d"

      def install
        bin.install "okf-linux-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.6.0/okf-linux-amd64"
      sha256 "b431f4374f2fefccc69a77e76fee6a37e4c61c31fb58f1e4f2d8e6658145e575"

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
