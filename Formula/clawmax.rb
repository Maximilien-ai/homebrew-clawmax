class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.17"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.17/clawmax-v1.9.17-darwin-arm64.tar.gz"
      sha256 "6fdda26e0e48439f7d3698f9723b7253ec39e464f27b69f2309e6457c0dfd8d8"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.17/clawmax-v1.9.17-darwin-amd64.tar.gz"
      sha256 "e8a1687a0aae564c764ee21aab1c6e8f1e233d939ff039b4cafe061b35fae300"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.17/clawmax-v1.9.17-linux-arm64.tar.gz"
      sha256 "334c108c2b350a6ccbee68b08df2a94efe7df372cbbddc702cf826d9d7bca62f"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.17/clawmax-v1.9.17-linux-amd64.tar.gz"
      sha256 "f1126384efb1db2d566284133033e472e431a72022051d572aa05a65f9dbc821"
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
    assert_match "1.9.17", shell_output("#{bin}/clawmax version")
  end
end
