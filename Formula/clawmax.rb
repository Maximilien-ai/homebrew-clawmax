class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.20"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.20/clawmax-v1.9.20-darwin-arm64.tar.gz"
      sha256 "84024a3591e97f5c4d869235b41752503018ba5b540c3716a20a77fe59d972ac"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.20/clawmax-v1.9.20-darwin-amd64.tar.gz"
      sha256 "6ea21c237f17b4920cc828b6e65ec3b0412cab2182ddb478ef648a5eb4108ae4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.20/clawmax-v1.9.20-linux-arm64.tar.gz"
      sha256 "02c52b563ce0e4cacebcc43a7ac95dbe6080e4026183b1321756f478b0e6447a"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.20/clawmax-v1.9.20-linux-amd64.tar.gz"
      sha256 "3854a406e5546eb7b81b4d0cba65e32ab715f782cb6fc264a7fb6a68ee730dcc"
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
    assert_match "1.9.20", shell_output("#{bin}/clawmax version")
  end
end
