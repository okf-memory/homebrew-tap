class Okf < Formula
  desc "Domain-neutral, Git-native persistent project memory for AI agents (OKF v0.2)"
  homepage "https://github.com/okf-memory/okf-agent-memory"
  version "0.4.0-rc.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.4.0-rc.1/okf-darwin-arm64"
      sha256 "265ce3cf824c29d68f005b9eefbb603f3d55ffcdeae07a39bf385f794d5ee440"

      def install
        bin.install "okf-darwin-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.4.0-rc.1/okf-darwin-amd64"
      sha256 "3b2c60670110d5e7c252e91791cf0e8c6f518c42e9144d85e1a626a4cf2cceeb"

      def install
        bin.install "okf-darwin-amd64" => "okf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.4.0-rc.1/okf-linux-arm64"
      sha256 "8c12986968b47695174f84b93b413aa96283a76680a07889bde5cf8104f32409"

      def install
        bin.install "okf-linux-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.4.0-rc.1/okf-linux-amd64"
      sha256 "90f223b283cefb64d395571e588b0210ae0215eb36e7ed8cbd39ab90bcc5f856"

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
