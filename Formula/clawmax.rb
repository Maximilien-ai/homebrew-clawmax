class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "0.1.12"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.12/clawmax-v0.1.12-darwin-arm64.tar.gz"
      sha256 "4fec46c2100a09ac795c0aaad1f52c0a0341e652a689cb755eb34b485e0e4999"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.12/clawmax-v0.1.12-darwin-amd64.tar.gz"
      sha256 "c00df63354205115647932b8ad109f7a96ad292c201fb18870a43463a0f7ede3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.12/clawmax-v0.1.12-linux-arm64.tar.gz"
      sha256 "89a8cfeeb6b9f705982da9922ee21962cfb4700f531c94bd6a0432bae2451d98"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.12/clawmax-v0.1.12-linux-amd64.tar.gz"
      sha256 "753e6fac7c45ed94439a0c9496cdae3496196e0b5a162cfd8dc8f2b89a889030"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
