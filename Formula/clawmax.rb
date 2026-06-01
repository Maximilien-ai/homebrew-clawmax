class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.2"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.2/clawmax-v1.9.2-darwin-arm64.tar.gz"
      sha256 "095868cc3b9fa6c8b193a64c7d4555c12c93312f66ebb68bc2a1ecc3ce2f6adf"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.2/clawmax-v1.9.2-darwin-amd64.tar.gz"
      sha256 "4a4a26cedfb26bc669b3678e19d289fad5705bc5deedcd35db6e8fb167b98218"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.2/clawmax-v1.9.2-linux-arm64.tar.gz"
      sha256 "bd08124d51d36fc91cf1f8ff7835b791aafc5a8bb0cbfdf25aedf56f8ecae92b"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.2/clawmax-v1.9.2-linux-amd64.tar.gz"
      sha256 "0a210d8975bee673c7a82374521f3fdb2c8c571f883d858d75fcea6b9059806a"
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
    assert_match "1.9.2", shell_output("#{bin}/clawmax version")
  end
end
