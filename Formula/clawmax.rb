class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.3"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.3/clawmax-v1.9.3-darwin-arm64.tar.gz"
      sha256 "dbca17b09310bb01dd367684ed224bfc657c38a1aa6b1f584ef078b1c3eb8f50"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.3/clawmax-v1.9.3-darwin-amd64.tar.gz"
      sha256 "d060b106d34241cf7802d1bd9a38eb930a48b2530811dec41164cf2082f2a434"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.3/clawmax-v1.9.3-linux-arm64.tar.gz"
      sha256 "a4f91375501c13544452a33f188d00653a8ebfb2315bc26d301d3a28808b8049"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.3/clawmax-v1.9.3-linux-amd64.tar.gz"
      sha256 "6d6b630a3586fa2d884ecbad16350e72e245403f8e32d4fcc4c8cd7571425df6"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.3", shell_output("#{bin}/clawmax version")
  end
end
