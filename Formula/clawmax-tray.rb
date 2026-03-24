class ClawmaxTray < Formula
  desc "macOS menu bar agent for ClawMax"
  homepage "https://clawmax.ai"
  version "0.1.13"
  license "Proprietary"

  depends_on :macos
  depends_on "maximilien-ai/clawmax/clawmax"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.13/clawmax-tray-v0.1.13-darwin-arm64.tar.gz"
      sha256 "03c9daf275d22faa0d0a0ff00d3b25cbb1ff504994801bb994d390e777e53566"
    end
  end

  def install
    bin.install "clawmax-tray"
  end

  test do
    assert_predicate bin/"clawmax-tray", :exist?
  end
end
