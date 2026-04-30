class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.5.18"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.18/clawmax-v1.5.18-darwin-arm64.tar.gz"
      sha256 "617fcc1a70710d7c106e6945d6db5d5a2c736127251ec09cc7262c6eba07b31d"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.18/clawmax-v1.5.18-darwin-amd64.tar.gz"
      sha256 "6c2aa23a271102a625058aeed8a8d3ae34205cd0674c9fbb8da954db00d27454"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.18/clawmax-v1.5.18-linux-arm64.tar.gz"
      sha256 "9661507ebb22aabc6712f941ebf67bf747cca15e4e71c7747cdede4e2139f385"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.18/clawmax-v1.5.18-linux-amd64.tar.gz"
      sha256 "aa789d55c7a2929d6af39e0ffe8119017555ccd7fadf46ea6c9cfc6bbaf1b6fe"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.5.18", shell_output("#{bin}/clawmax version")
  end
end
