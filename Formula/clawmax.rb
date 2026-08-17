class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.28"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.28/clawmax-v1.9.28-darwin-arm64.tar.gz"
      sha256 "a666d991152971f5700418e947e4b462fa14505345e08410c8bb69160114796b"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.28/clawmax-v1.9.28-darwin-amd64.tar.gz"
      sha256 "a2b9f2166e3db348c075b3cfbcfdd220479a6819285d356e4188046a637e18c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.28/clawmax-v1.9.28-linux-arm64.tar.gz"
      sha256 "9f810e7c6aac5ce893d911731d9862273fc8731d61c3d30064ceb970a71f87b8"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.28/clawmax-v1.9.28-linux-amd64.tar.gz"
      sha256 "7ca82f6f31ae282dd49b2744d3be55d25f5c5bd45d508786ec8d28ea3fabb5fd"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.28", shell_output("#{bin}/clawmax version")
  end
end
