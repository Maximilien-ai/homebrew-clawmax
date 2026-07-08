class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.14"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.14/clawmax-v1.9.14-darwin-arm64.tar.gz"
      sha256 "4dd64ee5b8f4612c893203dc94c9eb4f23bfd2378d7364aa07477b1ef06b45d0"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.14/clawmax-v1.9.14-darwin-amd64.tar.gz"
      sha256 "0d92d54425ee9c82d2152d7a138b376c849ff0edea55f5e417445ffeb059a371"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.14/clawmax-v1.9.14-linux-arm64.tar.gz"
      sha256 "85425694bfc343fb50ed86e788bc91e51a099b52033cfe9b7d3b3336e98b056d"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.14/clawmax-v1.9.14-linux-amd64.tar.gz"
      sha256 "fa1957723c695b8baf600ef7c0f4cdae99a1edcca4d54e85b7f01d87c5703ab5"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.14", shell_output("#{bin}/clawmax version")
  end
end
