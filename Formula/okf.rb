class Okf < Formula
  desc "Domain-neutral, Git-native persistent project memory for AI agents (OKF v0.2)"
  homepage "https://github.com/okf-memory/okf-agent-memory"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.1/okf-darwin-arm64"
      sha256 "2b80a404ab2972e8c6a91eda8c8df7b1c4df38dfbc8cf26af7f605561f899bc8"

      def install
        bin.install "okf-darwin-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.1/okf-darwin-amd64"
      sha256 "ce1a668b737b1e53bb2c886b5c256886509de7296320b00d557d381ac1e4d0e8"

      def install
        bin.install "okf-darwin-amd64" => "okf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.1/okf-linux-arm64"
      sha256 "7c35d344dd48295314b91fbedd1f0e993529648d1aa436a1dab50aee8e28414f"

      def install
        bin.install "okf-linux-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.1/okf-linux-amd64"
      sha256 "00a0a6da89823704f5abee8a8f0b01b256fddc761644b3ebf11a6bc10a2714b8"

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
