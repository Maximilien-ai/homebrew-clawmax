class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.20"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.20/clawmax-v1.9.20-darwin-arm64.tar.gz"
      sha256 "7e7f99ec1899102ce907282c50384245aab580b91ca2a06556f209463e4a65eb"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.20/clawmax-v1.9.20-darwin-amd64.tar.gz"
      sha256 "d861145721d47723f7b27988ab42f319d4bdede48a26246842616084cb39bf7a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.20/clawmax-v1.9.20-linux-arm64.tar.gz"
      sha256 "f843a1023757fb32d6cf84b937b35248d4e1dbe1787a05d1e02ef4256574cfc0"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.20/clawmax-v1.9.20-linux-amd64.tar.gz"
      sha256 "55b7bcf6b012ec29e3406d5abb515f7da344a0159d091c5dd8d93e4fefc61f00"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.20", shell_output("#{bin}/clawmax version")
  end
end
