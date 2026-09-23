class Okf < Formula
  desc "Domain-neutral, Git-native persistent project memory for AI agents (OKF v0.2)"
  homepage "https://github.com/okf-memory/okf-agent-memory"
  version "0.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.4.3/okf-darwin-arm64"
      sha256 "be6ae1e0038a5cef0482a5d7b512d777d76308ba0d86bfd19bf6cd85233f882f"

      def install
        bin.install "okf-darwin-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.4.3/okf-darwin-amd64"
      sha256 "efc09e7ccfc3da3b73c0bc54b07a5b60b3180747ab29a5aec8cd2ffc8b36bbdb"

      def install
        bin.install "okf-darwin-amd64" => "okf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.4.3/okf-linux-arm64"
      sha256 "c7ba349f3ff13e2cddf859ec69a673c9ff35cd4d093054cd1bf0b4e3f97cdd4a"

      def install
        bin.install "okf-linux-arm64" => "okf"
      end
    else
      url "https://github.com/okf-memory/okf-agent-memory/releases/download/v0.4.3/okf-linux-amd64"
      sha256 "485761b084069b1299fa4a480df96cdac28894fc126bfffe20afd70731d7f037"

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
