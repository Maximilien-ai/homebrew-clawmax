class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.8.4"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.4/clawmax-v1.8.4-darwin-arm64.tar.gz"
      sha256 "5cc503eaa92c290f53ecc542b9edbbbabab39f8f5856dad4a4353892260f5706"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.4/clawmax-v1.8.4-darwin-amd64.tar.gz"
      sha256 "14e470c3d3cf2a864b1976940cecf8514b6498c53e0eb4a8f56d9db16aa36b7b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.4/clawmax-v1.8.4-linux-arm64.tar.gz"
      sha256 "665f88189b24734edc2ea9f35d6cd829a5a3d7d2d7620ad4e0e7f97b20a5c0fc"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.4/clawmax-v1.8.4-linux-amd64.tar.gz"
      sha256 "18353c81ad6f498aa2f06ac2c2420e80db3eb50345eaadd8a45ead6756771726"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.8.4", shell_output("#{bin}/clawmax version")
  end
end
