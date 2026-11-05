class Okf < Formula
  desc "Domain-neutral, Git-native persistent project memory for AI agents (OKF v0.2)"
  homepage "https://github.com/okf-memory/okf-agent-memory"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.8.0/okf-darwin-arm64"
      sha256 "e6b09ac3657c3c6eace0dba5a90b7d283b07f550264a1aaa4b926c12cc3b75e7"

      def install
        bin.install "okf-darwin-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.8.0/okf-darwin-amd64"
      sha256 "51a556b5501c64ef1522fb4c990d94ec72e340dcb002ee5efd12d71f6ea9a343"

      def install
        bin.install "okf-darwin-amd64" => "okf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.8.0/okf-linux-arm64"
      sha256 "5a837eda2b50ee56d6c95c2b0d28cae329ab0f10e2599072a0b2902e91f89f26"

      def install
        bin.install "okf-linux-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.8.0/okf-linux-amd64"
      sha256 "c93f3c807a0bc0a75ed2f3507e0d5c840639e2fb9bab0168e659be3f1b75cbe9"

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
