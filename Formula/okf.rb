class Okf < Formula
  desc "Domain-neutral, Git-native persistent project memory for AI agents (OKF v0.2)"
  homepage "https://github.com/okf-memory/okf-agent-memory"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.3.1/okf-darwin-arm64"
      sha256 "5061a0a05c260b0c3df17cd177a249d1bdb7d144ac86f115b4c289a17cbf5a67"

      def install
        bin.install "okf-darwin-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.3.1/okf-darwin-amd64"
      sha256 "330112ffea2a175fe4d9e86889da8630827a1ced5f8bddeb886a08da31a5625d"

      def install
        bin.install "okf-darwin-amd64" => "okf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.3.1/okf-linux-arm64"
      sha256 "20a95615ce8cc629e5bb3dfec3a5d77c22d4e4e8fb4d2e12e91c29e6259255dc"

      def install
        bin.install "okf-linux-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.3.1/okf-linux-amd64"
      sha256 "dfb1006f31d4b759770f443b5c6ccd2104aa9ab02dbb50e42980467c6a6f0f2e"

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
