class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.31"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.31/clawmax-v1.9.31-darwin-arm64.tar.gz"
      sha256 "7ee61767325f750d482e362c635225d2b6abf3f2c703a6761961997fedf88320"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.31/clawmax-v1.9.31-darwin-amd64.tar.gz"
      sha256 "2458cf398c1183ca77f24962566c304e7270fc425212f96e11079ce662b3f073"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.31/clawmax-v1.9.31-linux-arm64.tar.gz"
      sha256 "15f618ea6c47fedbdc74bb04fde1f0c211f58709a6369c6b363d4bd871958093"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.31/clawmax-v1.9.31-linux-amd64.tar.gz"
      sha256 "aaf60156c8b67c43f644b0bf4579fc7a6f4a3c80fff4f959e3e43f4462b73f33"
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
    assert_match "1.9.31", shell_output("#{bin}/clawmax version")
  end
end
