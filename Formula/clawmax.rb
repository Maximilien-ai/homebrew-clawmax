class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.26"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.26/clawmax-v1.9.26-darwin-arm64.tar.gz"
      sha256 "f62cd076da7770149de505a955eb2135503a40845a8964aa103095515639499d"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.26/clawmax-v1.9.26-darwin-amd64.tar.gz"
      sha256 "34ac392ea9180f23588cb94964c8f059760b5252fd5d1b93c4959f209c3e3021"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.26/clawmax-v1.9.26-linux-arm64.tar.gz"
      sha256 "d2da94c20ee2b61eecdbf2d9d0b5916f5d245e8a33ec06503377ff21f9400f1f"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.26/clawmax-v1.9.26-linux-amd64.tar.gz"
      sha256 "7708564a03c39bdd9d3e77096caef4d043ef23a8df9f0867ba481c2bd52b8eec"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.26", shell_output("#{bin}/clawmax version")
  end
end
