class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.8.9"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.9/clawmax-v1.8.9-darwin-arm64.tar.gz"
      sha256 "e8a79ef25a9783bfcf0d4386f9ffda56e8b920e495f03904d9348438c8e4cf8c"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.9/clawmax-v1.8.9-darwin-amd64.tar.gz"
      sha256 "2a61e1de999cf3bf32a53f34c045bf9ab84df12c86f938f1d9d2e57ebfbc5a22"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.9/clawmax-v1.8.9-linux-arm64.tar.gz"
      sha256 "ac8d6b0bb4e021428845130805828415188f2be6e02dfef64f09b9b72f7020f1"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.9/clawmax-v1.8.9-linux-amd64.tar.gz"
      sha256 "0a032d14fd3e93664a22b3125ee93fb34866267d108830244306e529e5ca71d6"
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
    assert_match "1.8.9", shell_output("#{bin}/clawmax version")
  end
end
