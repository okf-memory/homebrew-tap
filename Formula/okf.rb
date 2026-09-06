class Okf < Formula
  desc "Domain-neutral, Git-native persistent project memory for AI agents (OKF v0.2)"
  homepage "https://github.com/okf-memory/okf-agent-memory"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.0/okf-darwin-arm64"
      sha256 "35d758d79ce9a06de3bdd750fe68fca7cb7abb9852c18e32237c26cf97dc18d5"

      def install
        bin.install "okf-darwin-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.0/okf-darwin-amd64"
      sha256 "8f9d670a5db79602dfb5e546775f50477e27867d84ebd57bc8e56b55a42d248d"

      def install
        bin.install "okf-darwin-amd64" => "okf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.0/okf-linux-arm64"
      sha256 "cb8672da1be0265534673555f5656288e043b4e9d41ade9bf3022b6d44e545e5"

      def install
        bin.install "okf-linux-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.1.0/okf-linux-amd64"
      sha256 "3634adc6c72122a6ef81a2fb3b948a48393920ccb6e6823a47f13186261ce6eb"

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
