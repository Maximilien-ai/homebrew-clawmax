class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.4.1"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.4.1/clawmax-v1.4.1-darwin-arm64.tar.gz"
      sha256 "de70e0f4d6287303a68ce76275228d742de1d92b5b51c2676d543df7fbb4f9f5"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.4.1/clawmax-v1.4.1-darwin-amd64.tar.gz"
      sha256 "fe9a0933f7202bc0005cf3b46a6bfe309f829186ab123c61b7f3d4a50c9ef6c0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.4.1/clawmax-v1.4.1-linux-arm64.tar.gz"
      sha256 "77e74453ecb075f17b6a2ef8dcf85c264c99075929c2b7ba08af6f5254f4050a"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.4.1/clawmax-v1.4.1-linux-amd64.tar.gz"
      sha256 "d4c031f6947eb78a2dfab54416e55c1bcf546a425d6697903b1d15291db36489"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.4.1", shell_output("#{bin}/clawmax version")
  end
end
