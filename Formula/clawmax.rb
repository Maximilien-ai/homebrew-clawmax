class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.8.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.0/clawmax-v1.8.0-darwin-arm64.tar.gz"
      sha256 "bd7905498413b72e1ba6984034b9fde4a8c43d9d39619b8735d375ca305e20d9"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.0/clawmax-v1.8.0-darwin-amd64.tar.gz"
      sha256 "0617fce078155bd4d902db5389b684062c77db969cbf90233d769aa60423c4c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.0/clawmax-v1.8.0-linux-arm64.tar.gz"
      sha256 "067dd0bc5dd63a990332d0457163d57b1f1be3a5e47724e9da73f151b7fa92ae"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.0/clawmax-v1.8.0-linux-amd64.tar.gz"
      sha256 "a39591d531053079dbf9a1fb54c12f3a23dc18ec7d7b85ccdb7bb372901ec366"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.8.0", shell_output("#{bin}/clawmax version")
  end
end
