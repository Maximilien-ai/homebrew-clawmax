class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.7.9"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.9/clawmax-v1.7.9-darwin-arm64.tar.gz"
      sha256 "2f089db9f096b71c4a966fd08ffccd17b20a24e1aaba5ced46325cf7913a5bf5"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.9/clawmax-v1.7.9-darwin-amd64.tar.gz"
      sha256 "183eef328e7d5e398bccce128eaf165a744b2ad3c5249ca03502e55b0acc9afd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.9/clawmax-v1.7.9-linux-arm64.tar.gz"
      sha256 "2df8b7400134a982bee27683f92418615c81f93724373f702ad6fb0c907deb3b"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.9/clawmax-v1.7.9-linux-amd64.tar.gz"
      sha256 "ff1bd4cdfa74920bfe062c6345bab5e98442b040e039c59236d5c690cc94e7c3"
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
    assert_match "1.7.9", shell_output("#{bin}/clawmax version")
  end
end
