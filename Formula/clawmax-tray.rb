class ClawmaxTray < Formula
  desc "macOS menu bar agent for ClawMax"
  homepage "https://clawmax.ai"
  version "0.1.10"
  license "Proprietary"

  depends_on :macos
  depends_on "maximilien-ai/clawmax/clawmax"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.10/clawmax-tray-v0.1.10-darwin-arm64.tar.gz"
      sha256 "f6dbcc298735ef48d0536fbd12605abaafb1cffb3c362741e786f5cde322699d"
    end
  end

  def install
    bin.install "clawmax-tray"
  end

  test do
    assert_predicate bin/"clawmax-tray", :exist?
  end
end
