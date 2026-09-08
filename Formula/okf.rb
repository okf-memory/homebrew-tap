class Okf < Formula
  desc "Domain-neutral, Git-native persistent project memory for AI agents (OKF v0.2)"
  homepage "https://github.com/okf-memory/okf-agent-memory"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.3/okf-darwin-arm64"
      sha256 "4e26aa386b9dbc3637a76a74386936582fe578734239e9e9d4ca09d3e9352922"

      def install
        bin.install "okf-darwin-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.3/okf-darwin-amd64"
      sha256 "7405830a74006e387dde0c367f734b597e3e42cf2df4f6c320964f8b81665496"

      def install
        bin.install "okf-darwin-amd64" => "okf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.3/okf-linux-arm64"
      sha256 "15fddeb47d3c234c1ae5b9d0ba68821de67ac7885a574cc61d87d80f08c39758"

      def install
        bin.install "okf-linux-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.3/okf-linux-amd64"
      sha256 "0731e73bb865663d6b31f15037ced26f229bc078f58f54803a32fe4d78fcc783"

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
