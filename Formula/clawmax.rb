class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.30"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.30/clawmax-v1.9.30-darwin-arm64.tar.gz"
      sha256 "bd3c2e3fea989ffee9a3f363ea071297603b943a0b78b757856d10d57d0077c2"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.30/clawmax-v1.9.30-darwin-amd64.tar.gz"
      sha256 "8c3a4e7dd193bc805bc438b056e846e0380d3b7fc1ca617014fba5443299c0f7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.30/clawmax-v1.9.30-linux-arm64.tar.gz"
      sha256 "bfcf6d7d7d3d6100670cc224db862b75dbb6d6cf7667b09312552a83783c4ed2"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.30/clawmax-v1.9.30-linux-amd64.tar.gz"
      sha256 "4f25332e30ae0beb89b6e015ab081af51e2e1acc3f22c112bdd85905a84c7f49"
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
    assert_match "1.9.30", shell_output("#{bin}/clawmax version")
  end
end
