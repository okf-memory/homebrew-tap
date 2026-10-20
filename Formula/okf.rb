class Okf < Formula
  desc "Domain-neutral, Git-native persistent project memory for AI agents (OKF v0.2)"
  homepage "https://github.com/okf-memory/okf-agent-memory"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.7.0/okf-darwin-arm64"
      sha256 "009d70ebf067e19463fe238eb380109f64b270c3cc194ae6a53f25d31cf187f9"

      def install
        bin.install "okf-darwin-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.7.0/okf-darwin-amd64"
      sha256 "5e6f4185748865241f5d156a88f5935dc57142054f6560212b1a5de6eb1367b3"

      def install
        bin.install "okf-darwin-amd64" => "okf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.7.0/okf-linux-arm64"
      sha256 "ad6266e37b85d69c66488e8dfe3af051b6d44d845fad94f25820d52df4db8d39"

      def install
        bin.install "okf-linux-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.7.0/okf-linux-amd64"
      sha256 "e44bc08ee2b150871d69182bcfe04712669be4196566cde65d77620b2e8c43f1"

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
