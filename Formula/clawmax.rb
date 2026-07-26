class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.15"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.15/clawmax-v1.9.15-darwin-arm64.tar.gz"
      sha256 "01e26f5d4c59c0ddd1a9d5dda3e90e7a2e0f55eeaee97ed984631d4a83a06a8d"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.15/clawmax-v1.9.15-darwin-amd64.tar.gz"
      sha256 "3e554964c89a28fff564176e6859353dd8910a402af6caef47a2498f11270816"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.15/clawmax-v1.9.15-linux-arm64.tar.gz"
      sha256 "26b29d2e1e29d2837c65ca513ba61fe5d10a5c5ad4266f43f9e91df1ce708b90"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.15/clawmax-v1.9.15-linux-amd64.tar.gz"
      sha256 "6444cfc3286231ecb87fd47613a465b63a18ae7a31b52364949aa6cb2eed3c3c"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.15", shell_output("#{bin}/clawmax version")
  end
end
