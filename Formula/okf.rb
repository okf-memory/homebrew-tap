class Okf < Formula
  desc "Domain-neutral, Git-native persistent project memory for AI agents (OKF v0.2)"
  homepage "https://github.com/okf-memory/okf-agent-memory"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.5/okf-darwin-arm64"
      sha256 "ba7420039c99b5e2d836ec95366f3b3a1dd537658ea179f185a6d003a4964816"

      def install
        bin.install "okf-darwin-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.5/okf-darwin-amd64"
      sha256 "066c8fa231e90225f41c0c7ab6f965ea38797da285dd98934863805b301438bd"

      def install
        bin.install "okf-darwin-amd64" => "okf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.5/okf-linux-arm64"
      sha256 "9b4acd0858c80450593b83f0dbaf3cb7a9486c9daa8b770301643f32e6af09e6"

      def install
        bin.install "okf-linux-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.5/okf-linux-amd64"
      sha256 "6c5c475f427ae1df179c28527780fc76ff4ad08897bd42d0e076143e4063c58a"

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
