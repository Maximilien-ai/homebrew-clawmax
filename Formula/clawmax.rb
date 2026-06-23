class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.8"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.8/clawmax-v1.9.8-darwin-arm64.tar.gz"
      sha256 "8a4cf5ea20044a5dd2efff8733d2932de4a41ccd030e0525e54b21c987c3c305"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.8/clawmax-v1.9.8-darwin-amd64.tar.gz"
      sha256 "757fc4e27be6a01dc0de36ffbb12c7e97209ffb7cc70eeb9632fced0f9a2c9ce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.8/clawmax-v1.9.8-linux-arm64.tar.gz"
      sha256 "68796e30a8e7a88c2cac63deece738e4e7a7b319934c4bd224f2ed3c288b9248"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.8/clawmax-v1.9.8-linux-amd64.tar.gz"
      sha256 "2d4b326f84406630bb7579693ac11cf8e96ba851352c8d8de4bb12d20bfd3d58"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.8", shell_output("#{bin}/clawmax version")
  end
end
