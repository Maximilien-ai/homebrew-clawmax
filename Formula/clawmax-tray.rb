class ClawmaxTray < Formula
  desc "macOS menu bar agent for ClawMax"
  homepage "https://clawmax.ai"
  version "0.1.12"
  license "Proprietary"

  depends_on :macos
  depends_on "maximilien-ai/clawmax/clawmax"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.12/clawmax-tray-v0.1.12-darwin-arm64.tar.gz"
      sha256 "d342499fe5de22f85df239618991ca97e9d5a4a253173ab8c533aea86f1e0c8a"
    end
  end

  def install
    bin.install "clawmax-tray"
  end

  test do
    assert_predicate bin/"clawmax-tray", :exist?
  end
end
