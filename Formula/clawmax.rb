class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.6.3"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.3/clawmax-v1.6.3-darwin-arm64.tar.gz"
      sha256 "95e3ece84f7dd97e302bbaede798190256c4e1cacb322d20068d9f80241f8dad"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.3/clawmax-v1.6.3-darwin-amd64.tar.gz"
      sha256 "ae17fae9e427312360f45f5ae5b1b4bfdf4eeb35bc1c90160101cdbe320bd42a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.3/clawmax-v1.6.3-linux-arm64.tar.gz"
      sha256 "21332ee01c55271304066be6bca21f3e786657221d66ea2ccdfdbeb954630efa"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.3/clawmax-v1.6.3-linux-amd64.tar.gz"
      sha256 "d0b462b42e75a897017fe3e6b7db49e9b6f86902120d1179597dbdcc3c004ea3"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.6.3", shell_output("#{bin}/clawmax version")
  end
end
