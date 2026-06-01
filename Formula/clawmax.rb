class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.2"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.2/clawmax-v1.9.2-darwin-arm64.tar.gz"
      sha256 "706924829b25a77d0e370075946a9247a734c4b5c378b1daf56a81e8f389743e"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.2/clawmax-v1.9.2-darwin-amd64.tar.gz"
      sha256 "14d89b4ac7615287ca5f2aa9b848a161afae2cbbeb9a872af25360513e2eb379"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.2/clawmax-v1.9.2-linux-arm64.tar.gz"
      sha256 "9120128171cdc504e1a2977e1a22f41d819733f58fd168917216f2fd0284cf53"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.2/clawmax-v1.9.2-linux-amd64.tar.gz"
      sha256 "2626368cde56ac3673d83345dbcbf9aa9f1f5971650a12e4c80571ed9897179c"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.2", shell_output("#{bin}/clawmax version")
  end
end
