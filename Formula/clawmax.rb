class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "0.1.15"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.15/clawmax-v0.1.15-darwin-arm64.tar.gz"
      sha256 "bca6e809160067f7114b70704a8491f7666f8f0aee5e4529bedb102140ffca13"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.15/clawmax-v0.1.15-darwin-amd64.tar.gz"
      sha256 "01c1f8d05f93b7a73b622e02c49663810289617dc51e5c2acc8948b0b19c914a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.15/clawmax-v0.1.15-linux-arm64.tar.gz"
      sha256 "d9d0df7c6e86f0081a099959809a52e6e37acf5675da5ac1cfabbf11a071cf0a"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.15/clawmax-v0.1.15-linux-amd64.tar.gz"
      sha256 "59ca74f6292ebec0b18f56cadb8afcf4b806a4e4af913f3cd23f473e55368891"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
