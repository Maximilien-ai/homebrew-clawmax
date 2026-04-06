class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.22"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.22/clawmax-v1.3.22-darwin-arm64.tar.gz"
      sha256 "8f72ca133d1bb6212f045b07975f31b3626f6ab1d03066211a5328a874a52ec5"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.22/clawmax-v1.3.22-darwin-amd64.tar.gz"
      sha256 "ecfb276ef22f6a5c57e7d154a29c6eb7d374e9d6c12da0aa3f4e463eb0482a75"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.22/clawmax-v1.3.22-linux-arm64.tar.gz"
      sha256 "ed52c112f7688f588c77643302ccc03baeefc1e0fcb7e322ad5fd0630855ad83"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.22/clawmax-v1.3.22-linux-amd64.tar.gz"
      sha256 "a7dc956567c43c398675a5241685300121062f12168703ed133275d96f0d3fbb"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
