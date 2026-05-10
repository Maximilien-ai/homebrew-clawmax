class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.6.6"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.6/clawmax-v1.6.6-darwin-arm64.tar.gz"
      sha256 "ff6286bc91383461b5bf7af210f4b5809aed8e581d45f4122801765091daa027"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.6/clawmax-v1.6.6-darwin-amd64.tar.gz"
      sha256 "b99c19fc750010e4046b388326298b8d032716ab0e8a087c90af1cca0d9cd935"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.6/clawmax-v1.6.6-linux-arm64.tar.gz"
      sha256 "9ece53ba1160c1852d6b935d419523f5b4b943d83f649525b3dde64b4e6de30a"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.6/clawmax-v1.6.6-linux-amd64.tar.gz"
      sha256 "e1a4ca9eb2572481f5745a9698d7d52325b6ce86223fdd5ab33d67472850da37"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.6.6", shell_output("#{bin}/clawmax version")
  end
end
