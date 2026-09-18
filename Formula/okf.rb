class Okf < Formula
  desc "Domain-neutral, Git-native persistent project memory for AI agents (OKF v0.2)"
  homepage "https://github.com/okf-memory/okf-agent-memory"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.4.1/okf-darwin-arm64"
      sha256 "92ed6a7ba92f02823b8fbb1bcfe4d84480f58875bc2b5259644f0009e9659723"

      def install
        bin.install "okf-darwin-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.4.1/okf-darwin-amd64"
      sha256 "d18f52b4b4951b1c35bdd4d62baf6f55d9b9ea652520b8a41a0f7ab3b876ae0e"

      def install
        bin.install "okf-darwin-amd64" => "okf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.4.1/okf-linux-arm64"
      sha256 "f047c06a27b8d0836e54c2106daaa7dcc0a536ed9f1909938538cbef2e8a7f1d"

      def install
        bin.install "okf-linux-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.4.1/okf-linux-amd64"
      sha256 "eed601b6c8afa3155f6365f755270abedbb5323b3e83d8b48506dc9ab0630248"

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
