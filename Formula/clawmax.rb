class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.5.21"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.21/clawmax-v1.5.21-darwin-arm64.tar.gz"
      sha256 "11bb3f6c9b8796bc8ad15a4f3c78d2378e70653fe3e4cdf37475f92e0ff689f2"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.21/clawmax-v1.5.21-darwin-amd64.tar.gz"
      sha256 "6c0af5ca04e410f014cd79b261e98b4e5f406feb621cd24b46f07f452d6ed5bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.21/clawmax-v1.5.21-linux-arm64.tar.gz"
      sha256 "c97cda2afdf8108048b624a91790d9f2bf88dffddfd325fc30d8b1df747d7c1c"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.21/clawmax-v1.5.21-linux-amd64.tar.gz"
      sha256 "d474e511d0a1d0e674c3970745d31b275bfbf875728604b0e380be71c5cbc5d1"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.5.21", shell_output("#{bin}/clawmax version")
  end
end
