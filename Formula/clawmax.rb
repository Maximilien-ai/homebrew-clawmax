class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.8"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.8/clawmax-v1.3.8-darwin-arm64.tar.gz"
      sha256 "0c81bf1970b691698412bc279c30c755be4c617c2ecf96fd042e710d3c4ca2b9"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.8/clawmax-v1.3.8-darwin-amd64.tar.gz"
      sha256 "be52ae6e2ebb99bb4ec0a55e4a68d9f0bc57c90c33245d9996bc92071fed495c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.8/clawmax-v1.3.8-linux-arm64.tar.gz"
      sha256 "1fe882da2d59252185fea7f8183d358ab1cc0b2217266ba4817eaf7962f6b257"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.8/clawmax-v1.3.8-linux-amd64.tar.gz"
      sha256 "375854f22aca59ebf13a10446e9e4bfb20f45a9f3676cced138ee7506c60b43f"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
