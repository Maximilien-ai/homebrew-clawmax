class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.30"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.30/clawmax-v1.9.30-darwin-arm64.tar.gz"
      sha256 "d09cd4606dc839b884e300cbf300dabab507d1e570f97c7c19b1317b11595681"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.30/clawmax-v1.9.30-darwin-amd64.tar.gz"
      sha256 "0df47e9374be8c41f74449e204111be5ccea8ccff0cdadd8d23f1da6a1f2b34d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.30/clawmax-v1.9.30-linux-arm64.tar.gz"
      sha256 "f84be7f28606a09b836243760b5244c0ab6acaa610a69f4ddc196d03448748fd"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.30/clawmax-v1.9.30-linux-amd64.tar.gz"
      sha256 "b5ffa7142c38507ae82da590a958cdc907ef8538ce019bbe147b04837addeb65"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.30", shell_output("#{bin}/clawmax version")
  end
end
