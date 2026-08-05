class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.19"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.19/clawmax-v1.9.19-darwin-arm64.tar.gz"
      sha256 "ec807757f9c98f074193fe7d499d6a41d4d90ff92fddd3291a798b257dcb06e0"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.19/clawmax-v1.9.19-darwin-amd64.tar.gz"
      sha256 "ace1e3a2489dc30d9af2341682de9f22af3d67e2fd37275fcd7177a19bfd7c77"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.19/clawmax-v1.9.19-linux-arm64.tar.gz"
      sha256 "f36267a0c2158a20b88e6020d1bf235513b8abe15b411af7f135ebfe8d0d12b8"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.19/clawmax-v1.9.19-linux-amd64.tar.gz"
      sha256 "10f782a190fda8c3a2cebf98cba3267737942dce1ded09d6045d5d5905517721"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.19", shell_output("#{bin}/clawmax version")
  end
end
