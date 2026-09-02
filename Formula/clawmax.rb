class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.34"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.34/clawmax-v1.9.34-darwin-arm64.tar.gz"
      sha256 "1a9761e6c6da100b4d1102ef6438536d864d705066887cbbde755b758895b9ca"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.34/clawmax-v1.9.34-darwin-amd64.tar.gz"
      sha256 "d4f6c749c1deac976f2d45eaacd243daf36b6b3dc834b8e7fe9fe84a1a887cc8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.34/clawmax-v1.9.34-linux-arm64.tar.gz"
      sha256 "69b1dc0290c101ea51a6ee1071601bc30119a411eae4a08dc2e60da700055537"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.34/clawmax-v1.9.34-linux-amd64.tar.gz"
      sha256 "07ec4cc063f3b053491f71b68219e22ec39ba123a2b446edaacbe3436a873b44"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.34", shell_output("#{bin}/clawmax version")
  end
end
