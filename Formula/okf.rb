class Okf < Formula
  desc "Domain-neutral, Git-native persistent project memory for AI agents (OKF v0.2)"
  homepage "https://github.com/okf-memory/okf-agent-memory"
  version "0.7.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.7.2/okf-darwin-arm64"
      sha256 "5d9e3be844c47b978dfcbc3430d4c1bc8d606705d8817a6c7d695fa06f476318"

      def install
        bin.install "okf-darwin-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.7.2/okf-darwin-amd64"
      sha256 "40c40703ae7a248aa3341b42b3bb69e1653d4a4c6645c2e7cc25f5778213c33a"

      def install
        bin.install "okf-darwin-amd64" => "okf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.7.2/okf-linux-arm64"
      sha256 "dc0bed0ff1f8ab74a4c8527f68c5dddfcbace6a1adeffcbb530cd3f3c7a7931b"

      def install
        bin.install "okf-linux-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.7.2/okf-linux-amd64"
      sha256 "e3a37b3af7a99d53f8ef0b685af7c2207c5ccc6b3d5ad87738005d6768861709"

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
