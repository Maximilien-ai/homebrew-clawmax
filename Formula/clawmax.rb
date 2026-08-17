class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.29"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.29/clawmax-v1.9.29-darwin-arm64.tar.gz"
      sha256 "6da16c858839b33ac2d1e1f8ba830a084b70afbf6d3c1e918f14d4be997d37f7"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.29/clawmax-v1.9.29-darwin-amd64.tar.gz"
      sha256 "c04bf30ec6438462b68b0267ec4ffe02144e05955f5f89ca499f9a62e03561f3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.29/clawmax-v1.9.29-linux-arm64.tar.gz"
      sha256 "43c47718530c02c6407d74c3b4cb226632b3a12a2b5c90b163e1f949b4988d8a"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.29/clawmax-v1.9.29-linux-amd64.tar.gz"
      sha256 "61aa9948806213e64998d57e43d2db1384d2fd3da0e650075a784ccc8e53ce87"
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
    assert_match "1.9.29", shell_output("#{bin}/clawmax version")
  end
end
