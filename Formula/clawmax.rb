class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.5"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.5/clawmax-v1.9.5-darwin-arm64.tar.gz"
      sha256 "d7598fbbcd0db4eff4f76a2d9de82fb26ffeaf4e50e83d619b0c034750e3db5b"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.5/clawmax-v1.9.5-darwin-amd64.tar.gz"
      sha256 "70c7fe36ed5a3202feebd42ab486b157eebda5f7db46e1e683661284368e4bff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.5/clawmax-v1.9.5-linux-arm64.tar.gz"
      sha256 "9dd2a26572139b27bb5a4b01b7e33c20178b97ae41fb6ba3ac245fff38ab032f"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.5/clawmax-v1.9.5-linux-amd64.tar.gz"
      sha256 "4f08ea08950eaa61b1d9fb9c6f9abf32e305b02bec563da512a64895942b1c84"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.5", shell_output("#{bin}/clawmax version")
  end
end
