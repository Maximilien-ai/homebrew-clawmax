class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.6.9"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.9/clawmax-v1.6.9-darwin-arm64.tar.gz"
      sha256 "cb2b08c57d593d7c35e3a6ba61df95202447861287738b41de2c9142996a79bf"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.9/clawmax-v1.6.9-darwin-amd64.tar.gz"
      sha256 "e3f5d723b1912427d00eab3e2e0a7c7c921be5b609b8bf7db91bb8b772328f26"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.9/clawmax-v1.6.9-linux-arm64.tar.gz"
      sha256 "da412ab78b3074a45f5b6b75bbfe1e12f5575d5fa7b7dcde15035ecb769c5aff"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.9/clawmax-v1.6.9-linux-amd64.tar.gz"
      sha256 "f3266be080a8459d6597a0673d15164ce9328247e6d5d5705a58ebd4a75455f1"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.6.9", shell_output("#{bin}/clawmax version")
  end
end
