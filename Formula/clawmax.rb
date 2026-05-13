class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.7.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.0/clawmax-v1.7.0-darwin-arm64.tar.gz"
      sha256 "fa1bee39aeac5e93e3b062724b5c3f6eac5133cc31f6e617134e8963ce7a6493"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.0/clawmax-v1.7.0-darwin-amd64.tar.gz"
      sha256 "3e306aec1eae0d442cb0083bfd08328748b70c285ff40b6e90f681ddfe8450c0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.0/clawmax-v1.7.0-linux-arm64.tar.gz"
      sha256 "986c664ac042e9bc63c2270e53cfcc5181fed10bb4b5a665e3b579aa36c95041"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.0/clawmax-v1.7.0-linux-amd64.tar.gz"
      sha256 "bdce38faf52ca21289102c4f79dac5ea511e093a5938f5b41c3709738fe10e44"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.7.0", shell_output("#{bin}/clawmax version")
  end
end
