class Okf < Formula
  desc "Domain-neutral, Git-native persistent project memory for AI agents (OKF v0.2)"
  homepage "https://github.com/okf-memory/okf-agent-memory"
  version "0.4.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.4.4/okf-darwin-arm64"
      sha256 "dd14394bd9778e29270bed90eba043466d271dca65a79001e4b931b7dd442911"

      def install
        bin.install "okf-darwin-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.4.4/okf-darwin-amd64"
      sha256 "355c22d955fb3a53e7b5054f0f5139639acd17c1f6b3d1da72acb125fccc02a9"

      def install
        bin.install "okf-darwin-amd64" => "okf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.4.4/okf-linux-arm64"
      sha256 "72f57dfee44706b73f2cadf2d8cc96b63a1c1fd2d8fc6850e55d7982ce925d75"

      def install
        bin.install "okf-linux-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.4.4/okf-linux-amd64"
      sha256 "073c393644034080713fca2c9c814da5fcd568e85f0a49c99f187d3448424a9f"

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
