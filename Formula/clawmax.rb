class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.5.11"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.11/clawmax-v1.5.11-darwin-arm64.tar.gz"
      sha256 "844fc6f398339f1fbe6db06abb3a1e84d5c2b7ed52f88f07c642ceac2ab386ec"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.11/clawmax-v1.5.11-darwin-amd64.tar.gz"
      sha256 "41d1936f3a3ae6408013e8c1ce21ab642cb85479a37b4a0667a563d9e21f3f85"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.11/clawmax-v1.5.11-linux-arm64.tar.gz"
      sha256 "e06cfb9fe57ce433093977e551e429de2ec5acaef7005e29e9a55bceb97bf398"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.11/clawmax-v1.5.11-linux-amd64.tar.gz"
      sha256 "cc74fa2a58758c7d6def4c62c798c10162638e8bcafd7898da35eca7e3998fcc"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.5.11", shell_output("#{bin}/clawmax version")
  end
end
