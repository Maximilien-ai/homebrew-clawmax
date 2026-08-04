class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.17"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.17/clawmax-v1.9.17-darwin-arm64.tar.gz"
      sha256 "44d453be3e0f7c5ab541788d81c6e0fa6790dda3cb6341e0e02a7721b054c365"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.17/clawmax-v1.9.17-darwin-amd64.tar.gz"
      sha256 "154a9a911daa3f00d336849151bb533169af1d7b8a12afa2d4890dca9ad2d237"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.17/clawmax-v1.9.17-linux-arm64.tar.gz"
      sha256 "58d7233d853f2f2d85b5898f42e3595b1ada3ad213f60fabe5ad966e00d68711"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.17/clawmax-v1.9.17-linux-amd64.tar.gz"
      sha256 "879b7bbc05e64a44132bb607e5c7c6e6ec93a31f2c9119dec80b904af9f2460d"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.17", shell_output("#{bin}/clawmax version")
  end
end
