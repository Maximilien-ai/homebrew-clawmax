class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.12"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.12/clawmax-v1.9.12-darwin-arm64.tar.gz"
      sha256 "c6c414cd435cd3768f06acdfa775cf84a00a2a2cc49fd23749ff6ec9ebb4bf56"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.12/clawmax-v1.9.12-darwin-amd64.tar.gz"
      sha256 "17070df57b2166d8b9bc8253f764e9f650e7ead1d631ad2dc6dbe4aaae306ef3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.12/clawmax-v1.9.12-linux-arm64.tar.gz"
      sha256 "fc5b573988881de508955660ba83d2a7683d37a2778f4a3d700322c43c4dee0e"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.12/clawmax-v1.9.12-linux-amd64.tar.gz"
      sha256 "40f7d2417098844135ccec9fa72f27f89a1d2498e7440d7315ab3a8fb1d7183d"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.12", shell_output("#{bin}/clawmax version")
  end
end
