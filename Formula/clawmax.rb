class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.5.9"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.9/clawmax-v1.5.9-darwin-arm64.tar.gz"
      sha256 "5012a4c33f9f30bca491c3486d1ef021cbdcc33a4c556836a15a7995ef38c358"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.9/clawmax-v1.5.9-darwin-amd64.tar.gz"
      sha256 "1ec175d88c164694e6e93acc3b6b67e512b8a86f2a39e79cd7aeaa805ba53bf7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.9/clawmax-v1.5.9-linux-arm64.tar.gz"
      sha256 "09a244c8a92a867173b9070a25fd7415849f4c3a6a351e6f27040164f458b923"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.9/clawmax-v1.5.9-linux-amd64.tar.gz"
      sha256 "9e2fbb74e813f053cf6aaf9675550fbecdef2266be348d4fa86601184dcc8552"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.5.9", shell_output("#{bin}/clawmax version")
  end
end
