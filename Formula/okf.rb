class Okf < Formula
  desc "Domain-neutral, Git-native persistent project memory for AI agents (OKF v0.2)"
  homepage "https://github.com/okf-memory/okf-agent-memory"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.9.0/okf-darwin-arm64"
      sha256 "8062668eb58e97981fd73423f9e73a27dbab3a87d9572fe07ef3ed411640c076"

      def install
        bin.install "okf-darwin-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.9.0/okf-darwin-amd64"
      sha256 "77bd7bf46fcfa11c6c9ad8b357c7bab5b221cb0a0566c8020c83a8804d6107c7"

      def install
        bin.install "okf-darwin-amd64" => "okf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.9.0/okf-linux-arm64"
      sha256 "864a8b1f1aa985731d3a25a2d37520dba12a9a4dbe4b446f39a7777bbfa53079"

      def install
        bin.install "okf-linux-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.9.0/okf-linux-amd64"
      sha256 "9f866288c53c9acf157b3875aecb5d3acc6de118782b7d76a503a0251a83977f"

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
