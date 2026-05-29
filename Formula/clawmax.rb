class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.8.3"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.3/clawmax-v1.8.3-darwin-arm64.tar.gz"
      sha256 "f6613228d313bebe87718dd2525f5872799ead7af7dc8af16b5148890e09dc5d"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.3/clawmax-v1.8.3-darwin-amd64.tar.gz"
      sha256 "37f779834fffef204f87088dd3b225210e36be24c68e71fe6ee5582a976fd13d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.3/clawmax-v1.8.3-linux-arm64.tar.gz"
      sha256 "c9e9375c94687a18b1010132704720ded6153e388e550c417c66e2c3cfc248ec"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.3/clawmax-v1.8.3-linux-amd64.tar.gz"
      sha256 "e0e6fae6a61981762e848fa3f5aae3d73654fe147b19da3c559e0e63d5d13218"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"

    tray = Dir["**/clawmax-tray"].find { |path| File.file?(path) && File.executable?(path) }
    bin.install tray => "clawmax-tray" unless tray.nil?
  end

  test do
    assert_match "1.8.3", shell_output("#{bin}/clawmax version")
  end
end
