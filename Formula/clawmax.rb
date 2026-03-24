class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "0.1.13"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.13/clawmax-v0.1.13-darwin-arm64.tar.gz"
      sha256 "bf9b78cecaaa8812335bafcf918b346d6615fcc6b3f9fd0c12ebcc71f58e4aed"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.13/clawmax-v0.1.13-darwin-amd64.tar.gz"
      sha256 "7d838915eb1c6f7aaf5a826fb7aa0115459b718ff2b60f0e180a31c1c594aaf5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.13/clawmax-v0.1.13-linux-arm64.tar.gz"
      sha256 "3b3de3b94ad77cb963adc4f1136c01741bef8b775e4179c08d5e33a406eeb322"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.13/clawmax-v0.1.13-linux-amd64.tar.gz"
      sha256 "70f2935363932c9a4145eded559ab1db8d7f0f7ac2a1b89b9371d39ff9309a08"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
