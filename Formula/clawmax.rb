class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "0.1.10"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.10/clawmax-v0.1.10-darwin-arm64.tar.gz"
      sha256 "4b3d76addcd5c2cdab8061e25a6aabd485066f7bf0d93548dc19261fb3f5758e"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.10/clawmax-v0.1.10-darwin-amd64.tar.gz"
      sha256 "f2f36a87fc05716f2c05b5d7ad833686f0b713f9190acefb360091acc620fc6d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.10/clawmax-v0.1.10-linux-arm64.tar.gz"
      sha256 "fc7f62f39b22b8b3dae349ae46679ad59fe1d9f013a9f6ed1a7f67d37b3ee7fd"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.10/clawmax-v0.1.10-linux-amd64.tar.gz"
      sha256 "13ac2f20fbadd0fd50eab65957d6127326931c252fb7babea9273469c522835b"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
