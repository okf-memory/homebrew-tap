class Okf < Formula
  desc "Domain-neutral, Git-native persistent project memory for AI agents (OKF v0.2)"
  homepage "https://github.com/okf-memory/okf-agent-memory"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.7.1/okf-darwin-arm64"
      sha256 "9489d8bd2a6167299319d21bee029e6f75e50352c0334a240309b329bedd9e98"

      def install
        bin.install "okf-darwin-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.7.1/okf-darwin-amd64"
      sha256 "fdcd6b97fc2db677af13ea89741261c205de13cfd4ca9f537306238116653640"

      def install
        bin.install "okf-darwin-amd64" => "okf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.7.1/okf-linux-arm64"
      sha256 "f58f9bfe310333a166c8ae0aae61338a8983af8a8d4c392692d2595ba4497814"

      def install
        bin.install "okf-linux-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.7.1/okf-linux-amd64"
      sha256 "59bd393e02058c33452e02415f32ffd466441e9e1c12558627bb11c842397611"

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
