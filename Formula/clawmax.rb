class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.18"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.18/clawmax-v1.9.18-darwin-arm64.tar.gz"
      sha256 "38f54794b040b06e6f1a8fe04636f287dc95249f1422c6516c790331529d42ad"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.18/clawmax-v1.9.18-darwin-amd64.tar.gz"
      sha256 "6f53ae902957de5c6900b74ae6f6c7e6552f5ac92f3966f39400a1cd2485575b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.18/clawmax-v1.9.18-linux-arm64.tar.gz"
      sha256 "1c0eca0913bb080bee545a28609252dbb3d91d7195e58d03b3689eb0a7d689c7"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.18/clawmax-v1.9.18-linux-amd64.tar.gz"
      sha256 "5d861040c0e0185a4ab6887ebceb602e9e2fd14752c3bb3a7f69c29abadb0fa9"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.18", shell_output("#{bin}/clawmax version")
  end
end
