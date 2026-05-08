class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.6.2"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.2/clawmax-v1.6.2-darwin-arm64.tar.gz"
      sha256 "b69b3a24d5e7b8b5d931abb74460c7062efe09f2ccc3dc36edb5e30438a0ab76"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.2/clawmax-v1.6.2-darwin-amd64.tar.gz"
      sha256 "7d7700b4e6b00143d7511c8b86573af5d37f088eeb38af1fffe401e65c72d450"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.2/clawmax-v1.6.2-linux-arm64.tar.gz"
      sha256 "4390a0fd3863b37511cb318bcd70e437584bbb4de6ac8a0b38a3be49c085b400"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.2/clawmax-v1.6.2-linux-amd64.tar.gz"
      sha256 "989dfaf67c75871699c293d694f224112eab41ff71ef0c36b4c361cdf1ccfccb"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.6.2", shell_output("#{bin}/clawmax version")
  end
end
