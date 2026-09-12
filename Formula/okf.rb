class Okf < Formula
  desc "Domain-neutral, Git-native persistent project memory for AI agents (OKF v0.2)"
  homepage "https://github.com/okf-memory/okf-agent-memory"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.2.0/okf-darwin-arm64"
      sha256 "22aeebab4906ba81a47ecba5a9e4c7b301b8338c04e122d2200baa95831174b1"

      def install
        bin.install "okf-darwin-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.2.0/okf-darwin-amd64"
      sha256 "72fe89395ee8463d8333d77488b5b9b5aa90a6f2fe5a857b70d9930e6558770e"

      def install
        bin.install "okf-darwin-amd64" => "okf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.2.0/okf-linux-arm64"
      sha256 "8a075166b2fe0b4aa719dbfa861ce3d6461c42db5ee5a9e897404d82ac41e51f"

      def install
        bin.install "okf-linux-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.2.0/okf-linux-amd64"
      sha256 "04ef67184ee0160621a4db268306117a64e08e34685f66166f9fdf7c67920fad"

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
