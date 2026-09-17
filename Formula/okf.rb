class Okf < Formula
  desc "Domain-neutral, Git-native persistent project memory for AI agents (OKF v0.2)"
  homepage "https://github.com/okf-memory/okf-agent-memory"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.4.0/okf-darwin-arm64"
      sha256 "88e80a25d08b420773349690a3e211d3358b1c57d0ff080a0e37b94b50aad8a5"

      def install
        bin.install "okf-darwin-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.4.0/okf-darwin-amd64"
      sha256 "ad11f4578c6b2d47bd9abc1df9723d0ef684948028b8182f479dba4530fa6a57"

      def install
        bin.install "okf-darwin-amd64" => "okf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.4.0/okf-linux-arm64"
      sha256 "539a8ebe2153c625b5112484a100917ced182441598054a2577b177831249213"

      def install
        bin.install "okf-linux-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.4.0/okf-linux-amd64"
      sha256 "491bf1af1262735cbd7f64f6a54b6234139cf28d0034ac544ad920d33cd88c5b"

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
