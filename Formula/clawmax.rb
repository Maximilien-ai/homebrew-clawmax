class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.24"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.24/clawmax-v1.3.24-darwin-arm64.tar.gz"
      sha256 "8d086c8306381d6129421d0ef0d5ec6d4a8f11d24de00f923a5e4d6a4037d72e"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.24/clawmax-v1.3.24-darwin-amd64.tar.gz"
      sha256 "a3dad7f8865b6a59f116bdba920718e02da21b6a9370c6c908b37202951b5ba6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.24/clawmax-v1.3.24-linux-arm64.tar.gz"
      sha256 "599da007866658a1e8986b32f21caeaacb4780b0f7391bf93d6cfaa3820210fe"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.24/clawmax-v1.3.24-linux-amd64.tar.gz"
      sha256 "2c652f1c7d2527ab369f85550309d8ce1a71fb90f006d904c4ffcb799521c551"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
