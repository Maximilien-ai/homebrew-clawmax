class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.14"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.14/clawmax-v1.3.14-darwin-arm64.tar.gz"
      sha256 "7f7b814bbb1cf45bc28f877d93faad91f5783d450bd8fbdb44fd52fea6e39133"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.14/clawmax-v1.3.14-darwin-amd64.tar.gz"
      sha256 "878069a0adea35e2a161e978250b9947b57551ff4f3bc4b2d151310678617de6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.14/clawmax-v1.3.14-linux-arm64.tar.gz"
      sha256 "38441623d5865c048bad680aa3e873787b67ce424e909295c3f2631b70cf63f2"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.14/clawmax-v1.3.14-linux-amd64.tar.gz"
      sha256 "758b2f141abefbab2d32b8d449f9eb4badffb04727f4365420177cce4317ffa1"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
