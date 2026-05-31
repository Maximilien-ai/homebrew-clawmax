class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.8.8"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.8/clawmax-v1.8.8-darwin-arm64.tar.gz"
      sha256 "eda5e7acb0754ba05526ddd45fa085f9d3472e545397d9742a7594a48f5cbb2e"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.8/clawmax-v1.8.8-darwin-amd64.tar.gz"
      sha256 "3901eb3bbb9aa9c64ea372c02742149601835d1310a15cfd53d764d329802eb8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.8/clawmax-v1.8.8-linux-arm64.tar.gz"
      sha256 "ee7d2249039befd20d3fe3e4382d3b38718a79faba6901b822885f79f97f46ed"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.8/clawmax-v1.8.8-linux-amd64.tar.gz"
      sha256 "78767e2814355e8b657a6533206444ffbd8c0da49534489c4db4321ca50bf0d1"
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
    assert_match "1.8.8", shell_output("#{bin}/clawmax version")
  end
end
