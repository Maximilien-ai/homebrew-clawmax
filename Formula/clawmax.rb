class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.5.19"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.19/clawmax-v1.5.19-darwin-arm64.tar.gz"
      sha256 "4ef03e5174d8af4f15b5de602c90ec0baafa8c78c227c62830082aca5d67d900"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.19/clawmax-v1.5.19-darwin-amd64.tar.gz"
      sha256 "19550bf2aff30cf421d72d5d63ad8f586aa5659cdb09f750e38caf2a673b5209"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.19/clawmax-v1.5.19-linux-arm64.tar.gz"
      sha256 "521769ef4685ed08e8225c31a4244a65e71bc22e9b3da3e2def7dd13e9715229"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.19/clawmax-v1.5.19-linux-amd64.tar.gz"
      sha256 "78ccaded6c3f5568c0cdec2e54833cbd67ba2791793fb207fab89a782ef756e3"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.5.19", shell_output("#{bin}/clawmax version")
  end
end
