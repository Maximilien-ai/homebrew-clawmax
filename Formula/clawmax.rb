class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.7"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.7/clawmax-v1.9.7-darwin-arm64.tar.gz"
      sha256 "1ecf57cf1b98a1bd64200eb2b5b80ea076743a3d3adc28f1de2ef706e270dde8"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.7/clawmax-v1.9.7-darwin-amd64.tar.gz"
      sha256 "c4dc3c2b5ddf4548d34c44ab65a3650650ac4ebd5ad1742a3f08933fa7b20458"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.7/clawmax-v1.9.7-linux-arm64.tar.gz"
      sha256 "5c468fbf9d5c120b6ed9d0455afee20b6ef35532b08ad5762c05744c035eabe9"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.7/clawmax-v1.9.7-linux-amd64.tar.gz"
      sha256 "e519ed36d21b500d12b0ff87c59d596c6034bc8cb7369eadbfe7b9758102d4ce"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.7", shell_output("#{bin}/clawmax version")
  end
end
