class Okf < Formula
  desc "Domain-neutral, Git-native persistent project memory for AI agents (OKF v0.2)"
  homepage "https://github.com/okf-memory/okf-agent-memory"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.6.1/okf-darwin-arm64"
      sha256 "3830a85bd89b3f168ae50bb4c456605c82e03b6a65fc33bf2d133281ad2b3df4"

      def install
        bin.install "okf-darwin-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.6.1/okf-darwin-amd64"
      sha256 "e5f0fe9945b441b5820c14631547c438685a6cf48f41a8b2f34b25a8688d7592"

      def install
        bin.install "okf-darwin-amd64" => "okf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.6.1/okf-linux-arm64"
      sha256 "02cdfd7279515be45a720f4b6a483a47f16550589b1bbb5e9717c43f2674faf4"

      def install
        bin.install "okf-linux-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.6.1/okf-linux-amd64"
      sha256 "254c164e7ddfa060d4998cc6cf89f3e6889cce945f5145bf34752c9a5b8f8fb0"

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
