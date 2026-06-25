class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.9"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.9/clawmax-v1.9.9-darwin-arm64.tar.gz"
      sha256 "31723aab12a9ee2039787a8982d3483fb1daf9613b9c2893257d735318be8642"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.9/clawmax-v1.9.9-darwin-amd64.tar.gz"
      sha256 "e3b793840fcc38b293bd8d68db00b42bfb7c7c93353ddec60b373d2c320d8689"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.9/clawmax-v1.9.9-linux-arm64.tar.gz"
      sha256 "ec28d39cb9150144659078a10326b3461a5efe080cbd312079b781ee73dd6d36"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.9/clawmax-v1.9.9-linux-amd64.tar.gz"
      sha256 "cdadf641445203d4249f70725ace95a25bebe023c5b2eb9ba8670553ccfa9817"
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
    assert_match "1.9.9", shell_output("#{bin}/clawmax version")
  end
end
