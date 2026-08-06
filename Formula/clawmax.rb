class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.21"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.21/clawmax-v1.9.21-darwin-arm64.tar.gz"
      sha256 "40857991722a7a51b860dc3cebf81d51339f07d83e5a666bbfd5ef509d3e09ff"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.21/clawmax-v1.9.21-darwin-amd64.tar.gz"
      sha256 "54d124e891c9400b3fd9379489da158560bddea91d172838d9bd3e0ac246ed58"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.21/clawmax-v1.9.21-linux-arm64.tar.gz"
      sha256 "bdeda380f2550dc11007c52773a35a136462f9c788cf2ae765dedde1ab065ec0"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.21/clawmax-v1.9.21-linux-amd64.tar.gz"
      sha256 "47ac647085fdd9348b0373c12cbbfdc5347b56d93aeea2ffaa774970de029e44"
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
    assert_match "1.9.21", shell_output("#{bin}/clawmax version")
  end
end
