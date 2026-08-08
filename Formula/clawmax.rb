class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.22"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.22/clawmax-v1.9.22-darwin-arm64.tar.gz"
      sha256 "6ece4bb317e7e16fa3e4a84cf016248e5e0196bd85bf3722c13bdece1fe2f496"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.22/clawmax-v1.9.22-darwin-amd64.tar.gz"
      sha256 "7bd49309c3985c4c4c8ee74365d1170746e753014e64b5469255d227d096dc84"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.22/clawmax-v1.9.22-linux-arm64.tar.gz"
      sha256 "407dd9dc4376c4f0a733eaa67d7accdc1361f05a72af562c6156f50af8299fc1"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.22/clawmax-v1.9.22-linux-amd64.tar.gz"
      sha256 "81d2266f9c7c567c96f0b13ee1900f917fbdf2c635e7418c9d72b09998b82f06"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.22", shell_output("#{bin}/clawmax version")
  end
end
