class Okf < Formula
  desc "Domain-neutral, Git-native persistent project memory for AI agents (OKF v0.2)"
  homepage "https://github.com/okf-memory/okf-agent-memory"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.3.0/okf-darwin-arm64"
      sha256 "e3d339e8fa7cd65515bdda3eb8a0a347a0e34a94dd9822e769b74d39df04de7e"

      def install
        bin.install "okf-darwin-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.3.0/okf-darwin-amd64"
      sha256 "a8a4da2463ce6228e3aa5f0f62ee080a3c9412cb12fe583fe04da9254b77e111"

      def install
        bin.install "okf-darwin-amd64" => "okf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.3.0/okf-linux-arm64"
      sha256 "cffc69811ba4bbf28f221fa6a6543e08041cc151afd1cb602e2874994b4ea8e1"

      def install
        bin.install "okf-linux-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.3.0/okf-linux-amd64"
      sha256 "2099552560d31f66f0059d647cd0699fc74cb4e5dd13912de3247368c870deb4"

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
