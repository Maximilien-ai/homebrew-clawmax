class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.7.8"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.8/clawmax-v1.7.8-darwin-arm64.tar.gz"
      sha256 "b18d47f4d81c37185bc9d7968335dc3896b7f660f7e558154f986268f01c2959"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.8/clawmax-v1.7.8-darwin-amd64.tar.gz"
      sha256 "371e29fbcb0b6234fe01fdcef33ae8e86eaadeeaf893d66e18f68a709f072c20"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.8/clawmax-v1.7.8-linux-arm64.tar.gz"
      sha256 "4f3e0ee0982ae5385568cdd5c8238d04ba2f80a87b2cf46e1c3126c7df447592"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.8/clawmax-v1.7.8-linux-amd64.tar.gz"
      sha256 "a98bae2ba1f1124f34e387feda842d9a9293454772a9780720a600f1a1e3a78a"
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
    assert_match "1.7.8", shell_output("#{bin}/clawmax version")
  end
end
