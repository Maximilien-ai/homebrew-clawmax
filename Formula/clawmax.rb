class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.4.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.4.0/clawmax-v1.4.0-darwin-arm64.tar.gz"
      sha256 "a25fec12abb594f7f2538e1bcaa03e2174400e7685024a78268925ed43d54f5d"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.4.0/clawmax-v1.4.0-darwin-amd64.tar.gz"
      sha256 "e44e2bdbbf46dd5133d84e090071dd5eaf5b02b8853ff9e8f4cdc6b9c1ee6cdb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.4.0/clawmax-v1.4.0-linux-arm64.tar.gz"
      sha256 "2aae466491f4430a0d7c6c5bd9212d2c9fa01653b4ee57d4cb8630a632a4d14c"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.4.0/clawmax-v1.4.0-linux-amd64.tar.gz"
      sha256 "617c2b6e4485b69d749a45b433fa29122f7e77d4479acffb728800205f55d547"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.4.0", shell_output("#{bin}/clawmax version")
  end
end
