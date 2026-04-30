class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.5.20"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.20/clawmax-v1.5.20-darwin-arm64.tar.gz"
      sha256 "7ca8ae5cf7ba56025cf0a4ef46f93ffbdb2ce8e31edb450fc23840245d50fe8c"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.20/clawmax-v1.5.20-darwin-amd64.tar.gz"
      sha256 "f2cf3661eae5eb6fa336be4dfa18ba577be3238e9b633811ba4249d3da74edad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.20/clawmax-v1.5.20-linux-arm64.tar.gz"
      sha256 "02b92e0775cf8877a44dc93e950e17888f402b89ed15b030ef24f6e3014548b7"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.20/clawmax-v1.5.20-linux-amd64.tar.gz"
      sha256 "c00c0e1757912d64edc3dde1cbfc65130feafe6332b0f3161e9765d3cedf13be"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.5.20", shell_output("#{bin}/clawmax version")
  end
end
