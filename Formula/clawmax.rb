class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.27"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.27/clawmax-v1.3.27-darwin-arm64.tar.gz"
      sha256 "aea0306fe6731d0baa3546b95af0eeee7961a7b501cd03a29f06f121bafa5bac"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.27/clawmax-v1.3.27-darwin-amd64.tar.gz"
      sha256 "edb57a33f9c8ebd5d09d21430c950a99829f9a037c11166d1eaf9088f844bb5e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.27/clawmax-v1.3.27-linux-arm64.tar.gz"
      sha256 "7a01d6614350f64fb647c79db43341d6392d90935a0c280e81211a0ac5c767ba"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.27/clawmax-v1.3.27-linux-amd64.tar.gz"
      sha256 "f3f0d81218a4e782596ac12097dc4b4495632e8e522422578448e95d5f2f2b8f"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
