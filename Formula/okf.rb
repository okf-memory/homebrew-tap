class Okf < Formula
  desc "Domain-neutral, Git-native persistent project memory for AI agents (OKF v0.2)"
  homepage "https://github.com/okf-memory/okf-agent-memory"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.5.0/okf-darwin-arm64"
      sha256 "7a9a9dde2dbc1f6029cee0a45205e20037f1120efa70e89b830a72581ce105d4"

      def install
        bin.install "okf-darwin-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.5.0/okf-darwin-amd64"
      sha256 "9f8b793968ee0a56a7968ebc328f6380863fde999bbf3507c97855253ce1ece5"

      def install
        bin.install "okf-darwin-amd64" => "okf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.5.0/okf-linux-arm64"
      sha256 "46be55b00a05f4baaa56f09666374666124f69ec152a96c488d82d463c9533a3"

      def install
        bin.install "okf-linux-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.5.0/okf-linux-amd64"
      sha256 "891ed6983f806f37462c6ec776562d254b8565c16a4e5d15e11f713471e0e1d2"

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
