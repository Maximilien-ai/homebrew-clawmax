class ClawmaxTray < Formula
  desc "macOS menu bar agent for ClawMax"
  homepage "https://clawmax.ai"
  version "0.1.14"
  license "Proprietary"

  depends_on :macos
  depends_on "maximilien-ai/clawmax/clawmax"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.14/clawmax-tray-v0.1.14-darwin-arm64.tar.gz"
      sha256 "b3342fbac9965bb135287f61df90143f531b27667c103c984df9fe295a96dc81"
    end
  end

  def install
    bin.install "clawmax-tray"
  end

  test do
    assert_predicate bin/"clawmax-tray", :exist?
  end
end
