class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.32"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.32/clawmax-v1.9.32-darwin-arm64.tar.gz"
      sha256 "8059ed31b696ce9533bc82e91f397e1a7df30a7397d5f8846035ede01ecccb26"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.32/clawmax-v1.9.32-darwin-amd64.tar.gz"
      sha256 "82df7be94d97876e6ec493bca57608fc27c78301166590912fcf701ed56d3f8c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.32/clawmax-v1.9.32-linux-arm64.tar.gz"
      sha256 "04bc5b2df1c4e7de33e83edb633d3f10c4c34d98bd67244b3728c48a6759dd7c"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.32/clawmax-v1.9.32-linux-amd64.tar.gz"
      sha256 "50d4337261e109da2221faf63325103a370e3a07910e1e154f8d777e091edacd"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.32", shell_output("#{bin}/clawmax version")
  end
end
