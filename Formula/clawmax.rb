class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.24"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.24/clawmax-v1.9.24-darwin-arm64.tar.gz"
      sha256 "b74188a04f92c2fcba7384adb6b99aeb6cdd085a06f3a5a33f4a24501c691500"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.24/clawmax-v1.9.24-darwin-amd64.tar.gz"
      sha256 "9d2f2ef2eb15d922b615bfea319c947008f46286a76d2d57f9b6b84c110079bd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.24/clawmax-v1.9.24-linux-arm64.tar.gz"
      sha256 "eb298d44c56f5fcf305f8ee73b94680476145e05aa413c2daefec7cddfb0040a"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.24/clawmax-v1.9.24-linux-amd64.tar.gz"
      sha256 "a76da47e9578790dbc9eabefe1d0cb78856e9626852f832613fb35996366ad4a"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.24", shell_output("#{bin}/clawmax version")
  end
end
