class Okf < Formula
  desc "Domain-neutral, Git-native persistent project memory for AI agents (OKF v0.2)"
  homepage "https://github.com/okf-memory/okf-agent-memory"
  version "0.6.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.6.2/okf-darwin-arm64"
      sha256 "44bbc5c7caf2de390231ac57858e0bb7a948a5b5107e07ead667d88926ef8535"

      def install
        bin.install "okf-darwin-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.6.2/okf-darwin-amd64"
      sha256 "c9167a3545375531f17bad9aded2c4b9d42e5cd02711daebac12c6a46e102cad"

      def install
        bin.install "okf-darwin-amd64" => "okf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.6.2/okf-linux-arm64"
      sha256 "4385f5fa5278a08ba36214aee80e4be2d3b931429d127887f9c69d7f57a24dc0"

      def install
        bin.install "okf-linux-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.6.2/okf-linux-amd64"
      sha256 "2da161da80132f70112a61fc237ce77aca0cbb0ea3767e73d7986dbd7cdcf47c"

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
