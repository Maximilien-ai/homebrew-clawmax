class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.7.1"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.1/clawmax-v1.7.1-darwin-arm64.tar.gz"
      sha256 "15c5de1c0c11448abded6a5c20abad64ebc1fe954b81743e65787a79707c1da7"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.1/clawmax-v1.7.1-darwin-amd64.tar.gz"
      sha256 "77984c17e611cf086e53c3a046f7f13bd5e0099ec5f6a0b717c650f195529baa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.1/clawmax-v1.7.1-linux-arm64.tar.gz"
      sha256 "95d2e0cbac0951b07afa7ceb83f27669c5738766b59d008b0e07825822db7ed2"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.1/clawmax-v1.7.1-linux-amd64.tar.gz"
      sha256 "3e573e9025bff447419d03799156e9b64a72ad43ff39922cff075d4731d18a71"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.7.1", shell_output("#{bin}/clawmax version")
  end
end
