class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.25"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.25/clawmax-v1.9.25-darwin-arm64.tar.gz"
      sha256 "cf3cdd2b8b2acb13a46fa96ecadecae2fe09a3d0a15cffe86009d27be5e349ea"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.25/clawmax-v1.9.25-darwin-amd64.tar.gz"
      sha256 "ba479dade02f680306514a49fe5fa9805884d8abebb093d5d1c0e6b0ca775d28"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.25/clawmax-v1.9.25-linux-arm64.tar.gz"
      sha256 "e70adfcacb93c204a7ecc3cc9b70c22b683de1e7dcb6c3d888ee4d15aa4de644"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.25/clawmax-v1.9.25-linux-amd64.tar.gz"
      sha256 "4cb2bf21942dae22d0404bfbd8f847013341e1c645e66c929fc94ad0c64317ac"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.25", shell_output("#{bin}/clawmax version")
  end
end
