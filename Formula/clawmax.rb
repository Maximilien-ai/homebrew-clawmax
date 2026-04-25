class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.75"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.75/clawmax-v1.3.75-darwin-arm64.tar.gz"
      sha256 "aa7cc3d7c8a8891dbca29ebb183e43402c9eea7aa60e01f7be4c79a057dad877"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.75/clawmax-v1.3.75-darwin-amd64.tar.gz"
      sha256 "43d9946f2f629617d14a2d1b34128bba5ac0313ebdbc1798921aca4be0bf6076"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.75/clawmax-v1.3.75-linux-arm64.tar.gz"
      sha256 "776ca0eb7bad2638d01aee5d76c4ce3d3c43d70483b9f52d4f89ca114a0bc11d"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.75/clawmax-v1.3.75-linux-amd64.tar.gz"
      sha256 "f32fc29f1a2e5ffdd1d0748c8204a8dc47e4e4098dd5f7ced6ebed85ac82220e"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.3.75", shell_output("#{bin}/clawmax version")
  end
end
