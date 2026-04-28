class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.5.12"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.12/clawmax-v1.5.12-darwin-arm64.tar.gz"
      sha256 "1df5a7c23e11a2c75afe31eb3458b5e9eaf0a9b35d0e4f86718771653bbcaa2d"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.12/clawmax-v1.5.12-darwin-amd64.tar.gz"
      sha256 "a5e81078bef5fe62a35732087c61262c5ca6a55b4c40e7bf4a027e0be46aa915"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.12/clawmax-v1.5.12-linux-arm64.tar.gz"
      sha256 "3712c3574c1be4e10692cda5a37e9e70723aa992b075589adc1cc404e74f2f5d"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.12/clawmax-v1.5.12-linux-amd64.tar.gz"
      sha256 "94b95a40a62aaf355b25471ad904dfe36ace6eb96ad32a34c77c1cfec12a879b"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.5.12", shell_output("#{bin}/clawmax version")
  end
end
