class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.5"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.5/clawmax-v1.9.5-darwin-arm64.tar.gz"
      sha256 "3f76bd8bc5a5f3048961458995970829292451df91d622e27906d2d191142ba6"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.5/clawmax-v1.9.5-darwin-amd64.tar.gz"
      sha256 "985d1e6736cca87c59b9ca9c1b5e8c5c3f09459572efda74d505a9266567264b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.5/clawmax-v1.9.5-linux-arm64.tar.gz"
      sha256 "49244686a23b2e16bc776ee224ff9a7b372b6006373cbc3a902a1f070ad66ad0"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.5/clawmax-v1.9.5-linux-amd64.tar.gz"
      sha256 "9d5e976ba5cf7d1f26c56829bf140ef8ee32e3eac477db65a2cab50ce57c743d"
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
    assert_match "1.9.5", shell_output("#{bin}/clawmax version")
  end
end
