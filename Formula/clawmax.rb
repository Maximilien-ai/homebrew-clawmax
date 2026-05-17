class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.7.4"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.4/clawmax-v1.7.4-darwin-arm64.tar.gz"
      sha256 "1aff2c43d00025df07a38f6c17034ae06d84927f259df8663282d853c6e6f5e2"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.4/clawmax-v1.7.4-darwin-amd64.tar.gz"
      sha256 "268db348edce9eeb1ae36b7f726e50feb0fb3f435032c939dad9baaaa6052ddf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.4/clawmax-v1.7.4-linux-arm64.tar.gz"
      sha256 "7f17dfb6920549a5b48015e3adc1ad1af90f58b8770307976638445fa2f81b75"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.4/clawmax-v1.7.4-linux-amd64.tar.gz"
      sha256 "9bb8225f36488267f8a3cb4f4764a28148c961a369c85b8f423a9e8b2e6a46f5"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.7.4", shell_output("#{bin}/clawmax version")
  end
end
