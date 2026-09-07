class Okf < Formula
  desc "Domain-neutral, Git-native persistent project memory for AI agents (OKF v0.2)"
  homepage "https://github.com/okf-memory/okf-agent-memory"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.2/okf-darwin-arm64"
      sha256 "c3d45a0c5fee96f9af7250adb1f36a6af3ae26ea68b9ccf8001acd2a1b8f6836"

      def install
        bin.install "okf-darwin-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.2/okf-darwin-amd64"
      sha256 "a65272beaf507388186f522cb67980a288fdfc8ca63e39901abbb152b7e64e64"

      def install
        bin.install "okf-darwin-amd64" => "okf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.2/okf-linux-arm64"
      sha256 "b5623fe3a0f62e9ef2e4b54863fa8636a85f17722ec288f94bbe73be5b23cb06"

      def install
        bin.install "okf-linux-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.2/okf-linux-amd64"
      sha256 "b561a7a478f3ccd661ee561fadc2b762aeb9cbc19d962d267077a169c1c9084c"

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
