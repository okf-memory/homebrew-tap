class Okf < Formula
  desc "Domain-neutral, Git-native persistent project memory for AI agents (OKF v0.2)"
  homepage "https://github.com/okf-memory/okf-agent-memory"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.3/okf-darwin-arm64"
      sha256 "ae3eb3bbf6448fa7fe9d75bd77cdd23d3b051b6ec065349c218c2cbd7c08303e"

      def install
        bin.install "okf-darwin-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.3/okf-darwin-amd64"
      sha256 "01f56f22d56e6745de4686a051f183a32de8a8ee21efb6e8b59252d964641314"

      def install
        bin.install "okf-darwin-amd64" => "okf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.3/okf-linux-arm64"
      sha256 "34cbaad41cca721062f861ccc0195c8bb7c9ac24794c4d7ba300a12990d6f489"

      def install
        bin.install "okf-linux-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.3/okf-linux-amd64"
      sha256 "8bb75d65814fd28f9c30e680cdd3060979fe683a2096af07637068c09c9c03ba"

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
