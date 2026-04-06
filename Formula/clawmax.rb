class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.23"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.23/clawmax-v1.3.23-darwin-arm64.tar.gz"
      sha256 "0123af28dda77e68542f58c0c51669362dbef1d53eacd5a1c2f65f83f071acfa"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.23/clawmax-v1.3.23-darwin-amd64.tar.gz"
      sha256 "85244e40e9bd56e73aa95fc23294d5ce5c9f01522b179c8c4d4d0ab908dd93ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.23/clawmax-v1.3.23-linux-arm64.tar.gz"
      sha256 "d431e87ccc77bf2580bd97c0aa0bd0b399f544c479510df4c5e64d9d01f928f6"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.23/clawmax-v1.3.23-linux-amd64.tar.gz"
      sha256 "81a5e564fe513157e54bf1a38256869ac35142250fb184ba8d3b284460c88abf"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
