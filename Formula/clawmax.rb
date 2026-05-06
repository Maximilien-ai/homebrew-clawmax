class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.5.27"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.27/clawmax-v1.5.27-darwin-arm64.tar.gz"
      sha256 "2c5f4528e56618bce83cc61dad468b9b4f3b43f9c44c3245254005ab664af8d2"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.27/clawmax-v1.5.27-darwin-amd64.tar.gz"
      sha256 "235636cbc5dd88e1a93f7b80f4efb714a4bb7d1317d175ddba376f75a5442a62"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.27/clawmax-v1.5.27-linux-arm64.tar.gz"
      sha256 "b309542b5ac2da186be2a10f5053ed7494e0694d481dbcc0066be3fcfaf9e027"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.27/clawmax-v1.5.27-linux-amd64.tar.gz"
      sha256 "2d7b02cc7cad9ec783d2515afea8cfdd15061399e36dbd5a2c933c218a4b0a94"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.5.27", shell_output("#{bin}/clawmax version")
  end
end
