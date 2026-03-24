class ClawmaxTray < Formula
  desc "macOS menu bar agent for ClawMax"
  homepage "https://clawmax.ai"
  version "0.1.9"
  license "Proprietary"

  depends_on :macos
  depends_on "maximilien-ai/clawmax/clawmax"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.9/clawmax-tray-v0.1.9-darwin-arm64.tar.gz"
      sha256 "24e06e3c5ac44b17c4250a3a2b909bb7bda15c7cf8e4c21bfde57a7d5b018834"
    end
  end

  def install
    bin.install "clawmax-tray"
  end

  test do
    assert_predicate bin/"clawmax-tray", :exist?
  end
end
