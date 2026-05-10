class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.6.7"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.7/clawmax-v1.6.7-darwin-arm64.tar.gz"
      sha256 "c63b974b632e87237318bda485515c650f6eadd817ac6439ab60876ddba07b0d"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.7/clawmax-v1.6.7-darwin-amd64.tar.gz"
      sha256 "d07323f2d9ce56b88e0e26e6da8dd37da396c9397d7a33d9c5a82f94b415cb94"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.7/clawmax-v1.6.7-linux-arm64.tar.gz"
      sha256 "bfa5a38a8e344b5e8ff9fd5f2e38da23ab34d389ec10cfdc56ee8333702a0c3c"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.7/clawmax-v1.6.7-linux-amd64.tar.gz"
      sha256 "c481b2b8fcc34758d68a066a68f4c315931414575d7b33b6ade316ad8b3dec5f"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.6.7", shell_output("#{bin}/clawmax version")
  end
end
