class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.10"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.10/clawmax-v1.3.10-darwin-arm64.tar.gz"
      sha256 "c8d051ef0e1a33e4ea65e2cdb64195a2fce627e5338ce73ccfe6ac23daa28eaf"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.10/clawmax-v1.3.10-darwin-amd64.tar.gz"
      sha256 "d9f7aa1815c097b1c7952dbbee6321db2ca961cd6883a71edb5f3c570a6dfe27"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.10/clawmax-v1.3.10-linux-arm64.tar.gz"
      sha256 "e987622ee3719f948a3a6633e52176379e39e9c8801bd11cd6ca5791eaadca4b"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.10/clawmax-v1.3.10-linux-amd64.tar.gz"
      sha256 "a328e74f3bcd8871b4e2cb49ebe7ce4f45dc7712efbb20a7d5ed55739541bb42"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
