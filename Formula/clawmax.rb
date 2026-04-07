class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.26"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.26/clawmax-v1.3.26-darwin-arm64.tar.gz"
      sha256 "3cbf98a5f457426bad3a012bbeabd4aa8fad4636e6ff005752620940925444f9"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.26/clawmax-v1.3.26-darwin-amd64.tar.gz"
      sha256 "9cd6c4bc99ace4d5928d645163f43adccb9c3087b713a65f7322328a1b6f5225"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.26/clawmax-v1.3.26-linux-arm64.tar.gz"
      sha256 "6bbeba952ae4e4670ed42e5f4a9bfbc6d320b1e99f93d472a22afca3255839c8"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.26/clawmax-v1.3.26-linux-amd64.tar.gz"
      sha256 "561251f83bf4e0797edebfd08ad9dbb7d4d3ea264b8a9319e158f1ff8b1a3307"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
