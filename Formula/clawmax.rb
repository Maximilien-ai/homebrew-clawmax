class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.23"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.23/clawmax-v1.9.23-darwin-arm64.tar.gz"
      sha256 "f16c0f235f2c4b3458b465a4f5f72e0d3e83030cf0b8835f69c6b1b0661aa6f4"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.23/clawmax-v1.9.23-darwin-amd64.tar.gz"
      sha256 "67db7ef353d6a1ce9845fefe2e0da2f8573076e0da64a1255ef0cdd164779fe0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.23/clawmax-v1.9.23-linux-arm64.tar.gz"
      sha256 "8e41280ebfe97e96b2336d9257f4c08d666020e22ac787bf32cb48a338c5b001"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.23/clawmax-v1.9.23-linux-amd64.tar.gz"
      sha256 "57ec3233b40d226fc2130187d24842776e51d5fe63f3c5916d8b05fa44938f75"
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
    assert_match "1.9.23", shell_output("#{bin}/clawmax version")
  end
end
