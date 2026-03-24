class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "0.1.11"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.11/clawmax-v0.1.11-darwin-arm64.tar.gz"
      sha256 "fc53d86f27e4c5f79047f08cef9599ad47ff03bfc5cc551ec688c731804358ce"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.11/clawmax-v0.1.11-darwin-amd64.tar.gz"
      sha256 "993ed227c14b5b531d51b89d84d4416ec9a20e1a78dfeb5342ca19a509913af8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.11/clawmax-v0.1.11-linux-arm64.tar.gz"
      sha256 "f75d33517968bf90a43b9cb292ba4180e163d4f1ede432fb8b08c7a87a629c2e"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.11/clawmax-v0.1.11-linux-amd64.tar.gz"
      sha256 "d1c77775b295e1310d819997d7d7e5130a85887b3f5bfe450c428a72d405f443"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
