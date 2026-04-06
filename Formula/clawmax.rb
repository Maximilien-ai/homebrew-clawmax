class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.4"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.4/clawmax-v1.3.4-darwin-arm64.tar.gz"
      sha256 "777bbea8d697f276135b647806521f559fbee4112be33e60d3c84c04c2080ef6"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.4/clawmax-v1.3.4-darwin-amd64.tar.gz"
      sha256 "5552bfdb10b6db438fd33b8ef209bc005cd3fe6245916aa026f64abb8048c1de"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.4/clawmax-v1.3.4-linux-arm64.tar.gz"
      sha256 "8d0c62e5588035b1f1712670375c1b1d04600467aad5c312e1fb01bbfcb3ac8d"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.4/clawmax-v1.3.4-linux-amd64.tar.gz"
      sha256 "78b6cf6fcbfd5ad8c352e6015a7a35175db42268d06fdcaca8eac27a2a2ffd1b"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
