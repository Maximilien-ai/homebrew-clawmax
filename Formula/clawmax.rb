class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.21"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.21/clawmax-v1.3.21-darwin-arm64.tar.gz"
      sha256 "805a620f852c3e81575dfa1c9b193e875829b8f0cfd7b42c833f239a4cb9d335"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.21/clawmax-v1.3.21-darwin-amd64.tar.gz"
      sha256 "b9baf607fbab291b5723b88e71cc00b502a1d3e78a8616bf3fe60f86cabce053"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.21/clawmax-v1.3.21-linux-arm64.tar.gz"
      sha256 "473f2d92e376d8ca896e861d402f5782e2a684626e804580966f2744c5cf116f"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.21/clawmax-v1.3.21-linux-amd64.tar.gz"
      sha256 "ff8ed87b3ba782593368927a4a00b974be5838927861e82cbc354e19b88f28e0"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
