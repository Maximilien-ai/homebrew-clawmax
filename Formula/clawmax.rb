class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.20"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.20/clawmax-v1.3.20-darwin-arm64.tar.gz"
      sha256 "f03fe8de0dd9ee0e1b572aba261b0daaea10584724e63bfb3d703d2906c4d86c"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.20/clawmax-v1.3.20-darwin-amd64.tar.gz"
      sha256 "08ad603c2e2d59697a91b6cbdd977b2c42c9d392a51fc89744574cc5c09ac14b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.20/clawmax-v1.3.20-linux-arm64.tar.gz"
      sha256 "ab48b23adb17857a77257f65e9780ad222ace700ea5c00d112d183e7e578e823"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.20/clawmax-v1.3.20-linux-amd64.tar.gz"
      sha256 "a9cd6ba81426740fae6301b2142c08782526be5ee778c0f0edd83895b4848c0b"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
