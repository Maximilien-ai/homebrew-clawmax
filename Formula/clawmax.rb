class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "0.1.10"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.10/clawmax-v0.1.10-darwin-arm64.tar.gz"
      sha256 "2f8bf97aadbe46bbd81ef34c9cce63da35a32dcef527c0ee0ae32570948fa05e"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.10/clawmax-v0.1.10-darwin-amd64.tar.gz"
      sha256 "9097c6faaa1032b5cf4e500afd9f21c9cab0ba5cf4d14f3d2bee9d3d5d9f747a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.10/clawmax-v0.1.10-linux-arm64.tar.gz"
      sha256 "6e2de894e7ce0c70f6971b26d2ceec68aca36c144356ef1918283892a4c8dd63"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.10/clawmax-v0.1.10-linux-amd64.tar.gz"
      sha256 "1e3c924560c65c4a7b2082cc6f608ebcc314d59a0ab63496ab68260a8827b09f"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
