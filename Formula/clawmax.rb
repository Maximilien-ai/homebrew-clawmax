class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.14"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.14/clawmax-v1.9.14-darwin-arm64.tar.gz"
      sha256 "10349adea0683c99b75b2d9d8323e5ee8da256975d2a3317ed07dd583119f98d"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.14/clawmax-v1.9.14-darwin-amd64.tar.gz"
      sha256 "536de61ada2315a4f060784521d101f982bb0b2397c301d5b92f663a0041464f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.14/clawmax-v1.9.14-linux-arm64.tar.gz"
      sha256 "a23ea2384ebec8da39a351ccf5b0515ee7c436508129bdfde961a54d10bab5cf"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.14/clawmax-v1.9.14-linux-amd64.tar.gz"
      sha256 "7cc10209edc8c88978c341e2546dc9d02891c1c2b40e18bb6eb20fa6c59a08aa"
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
    assert_match "1.9.14", shell_output("#{bin}/clawmax version")
  end
end
