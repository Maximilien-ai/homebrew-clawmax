class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.5.15"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.15/clawmax-v1.5.15-darwin-arm64.tar.gz"
      sha256 "71824cc65565631911ca46d556224d7ea7254f95d2c1e2c271cc867535f3392d"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.15/clawmax-v1.5.15-darwin-amd64.tar.gz"
      sha256 "558d332b7f819f86b366fef225df2fcdef94bd30f34b9f762c7b3cb9a91569e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.15/clawmax-v1.5.15-linux-arm64.tar.gz"
      sha256 "1ec4ac2048f52b8346de9083390c7653a8596e1e2868899dcfa0cbf9382970eb"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.15/clawmax-v1.5.15-linux-amd64.tar.gz"
      sha256 "d9027b590db6bebb44d8d5b2e0e9bed7c05fea96190c282ecbd18bf53d1ffb7d"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.5.15", shell_output("#{bin}/clawmax version")
  end
end
