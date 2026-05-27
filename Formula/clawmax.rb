class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.8.1"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.1/clawmax-v1.8.1-darwin-arm64.tar.gz"
      sha256 "741cc2cdbb9029e3579418cd6ce5113d9ae1d2587dbb1b74356b42abcd046d0f"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.1/clawmax-v1.8.1-darwin-amd64.tar.gz"
      sha256 "27f2874b3b0dff2e79b278a4ddd684c4cd037eca035a6b40876c85ab42c9874a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.1/clawmax-v1.8.1-linux-arm64.tar.gz"
      sha256 "690d14025bb4da683ad4ba0bf0eda969e760bb61cac08d8f83e4835c6e615a4e"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.1/clawmax-v1.8.1-linux-amd64.tar.gz"
      sha256 "4704d97d4c9929fcdb14cd24a1489d855990b4f293800cb5d5ec939695970bf1"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.8.1", shell_output("#{bin}/clawmax version")
  end
end
