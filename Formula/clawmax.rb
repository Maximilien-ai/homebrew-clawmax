class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.13"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.13/clawmax-v1.9.13-darwin-arm64.tar.gz"
      sha256 "5cc8cce343edc8e1cb7de297a282f7bab3abea9838abe81b646a03bbd5b4319a"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.13/clawmax-v1.9.13-darwin-amd64.tar.gz"
      sha256 "1173fba44ff9da2775258022ed319c8384c7b6eac1655775bdbd0db6383b8ecf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.13/clawmax-v1.9.13-linux-arm64.tar.gz"
      sha256 "1484a7429a7184d5305160281213fac55675418dc0c3cb15f1cb9d4d65e3c00b"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.13/clawmax-v1.9.13-linux-amd64.tar.gz"
      sha256 "f5448a72f80756a4518689bd7ed676b5bcd43e854bfa5069c34e522b5a90dded"
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
    assert_match "1.9.13", shell_output("#{bin}/clawmax version")
  end
end
