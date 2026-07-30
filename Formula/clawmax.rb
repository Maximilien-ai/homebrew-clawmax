class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.16"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.16/clawmax-v1.9.16-darwin-arm64.tar.gz"
      sha256 "7236e16a855f76e747eb1412735b410ce5d44952ee014fe360f912bb3a55ddfa"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.16/clawmax-v1.9.16-darwin-amd64.tar.gz"
      sha256 "08a465e1099bd9d7a5bffd1a153b9c601d2de46d37e681e5240f05f7d99b7547"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.16/clawmax-v1.9.16-linux-arm64.tar.gz"
      sha256 "e417930ec2fbca73aaeeed2186e03a204c5d6bb6e63c5d40f05828b0b1065b18"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.16/clawmax-v1.9.16-linux-amd64.tar.gz"
      sha256 "164e93133152cb520ff9279a00ef93cc92e7faddbe554196304b2ae604de561c"
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
    assert_match "1.9.16", shell_output("#{bin}/clawmax version")
  end
end
