class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.5.13"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.13/clawmax-v1.5.13-darwin-arm64.tar.gz"
      sha256 "20c86530b33da8563f9f5bf73db5bbbd107a1bf80870d621d57a7ec517a0095b"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.13/clawmax-v1.5.13-darwin-amd64.tar.gz"
      sha256 "b43012dd41146395f83715fb19db77d9de576278567c12674987725113d5543b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.13/clawmax-v1.5.13-linux-arm64.tar.gz"
      sha256 "e2464e954e47f9ff617864d5dcadba7b27bf03527ac637a9bc9eaa0b85755197"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.13/clawmax-v1.5.13-linux-amd64.tar.gz"
      sha256 "a4197c2e76a7eee199671c7a54b992f9ad92f7b5cd244a38cce2a3a85ffe3261"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.5.13", shell_output("#{bin}/clawmax version")
  end
end
