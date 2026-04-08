class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.39"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.39/clawmax-v1.3.39-darwin-arm64.tar.gz"
      sha256 "cdad9d541c60d7141b44cbcfc15eba9083aa0b0d5014ca39cb2a3cb4e7b97cac"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.39/clawmax-v1.3.39-darwin-amd64.tar.gz"
      sha256 "bbfc8524ca92bf5a3b914d1fdca304d41ff58dc0d043408edc15ce9475d3ec9b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.39/clawmax-v1.3.39-linux-arm64.tar.gz"
      sha256 "24c1e329a8cb219c77a7091e8e0cd339b912da20eca2c1d0a14680b9d46db8c6"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.39/clawmax-v1.3.39-linux-amd64.tar.gz"
      sha256 "4034fac2592425ae5df30ef8b5dddab873f2d76ba8b57548ffdcc24df4bfbb41"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
