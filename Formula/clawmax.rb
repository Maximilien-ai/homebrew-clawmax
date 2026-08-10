class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.25"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.25/clawmax-v1.9.25-darwin-arm64.tar.gz"
      sha256 "af4dac8d20ab28f1d82b6d0cbe90a29212354a686f57f2028b454198b0d8a341"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.25/clawmax-v1.9.25-darwin-amd64.tar.gz"
      sha256 "463b2ab4323f8c8371ec27f312cbe12f432d18c2a0d2cd277bfd6eb0f4e3b979"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.25/clawmax-v1.9.25-linux-arm64.tar.gz"
      sha256 "3bf1a28caa0cbcf6f6a3e7dd92c1713d363e1984bdb1a3e8460d2d6cae90b5dd"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.25/clawmax-v1.9.25-linux-amd64.tar.gz"
      sha256 "1e9dcf1a1b7168f74cb7b8ae6339033e5706238f8480c99c58fd2033c71cb753"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"

    tray = Dir["**/clawmax-tray"].find { |path| File.file?(path) && File.executable?(path) }
    bin.install tray => "clawmax-tray" unless tray.nil?
  end

  test do
    assert_match "1.9.25", shell_output("#{bin}/clawmax version")
  end
end
