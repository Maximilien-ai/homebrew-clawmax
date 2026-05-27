class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.8.1"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.1/clawmax-v1.8.1-darwin-arm64.tar.gz"
      sha256 "2e627336ac191ea1f3f4ffb7f9c89e2dc7587a324a64d1a1578c837f8ac69ee0"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.1/clawmax-v1.8.1-darwin-amd64.tar.gz"
      sha256 "c9ffa3ad8a441feec1d40a7ec36ab09ac8ea8d17a8e8932f67b6f8be88633bd8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.1/clawmax-v1.8.1-linux-arm64.tar.gz"
      sha256 "bc4a9e7eb09da5b6d211c9d74b11e1693900dce5d91aaf0ec855f4df50367ec6"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.1/clawmax-v1.8.1-linux-amd64.tar.gz"
      sha256 "f11ce4fe899978865a92e833087db31dde9f3984231a47f7d55fb25e45d651f1"
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
    assert_match "1.8.1", shell_output("#{bin}/clawmax version")
  end
end
