class Okf < Formula
  desc "Domain-neutral, Git-native persistent project memory for AI agents (OKF v0.2)"
  homepage "https://github.com/okf-memory/okf-agent-memory"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.4.2/okf-darwin-arm64"
      sha256 "67e131e0527b6a4fd76d0a9889126757ae2fefc2a6a5880edcd9508f758ddcec"

      def install
        bin.install "okf-darwin-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.4.2/okf-darwin-amd64"
      sha256 "75828b61d36a36ac64d2ef23df6de18ceb8d841be03e6b343d6df375b62e0e51"

      def install
        bin.install "okf-darwin-amd64" => "okf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.4.2/okf-linux-arm64"
      sha256 "1fa93375241972fc2223484ea47069a199bd9310c4e30284875d31658cf18bee"

      def install
        bin.install "okf-linux-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.4.2/okf-linux-amd64"
      sha256 "c37e91a5edbd10c6ad32f1b62b3d12268a8497ec997b88b5cba377ed77fd0b13"

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
