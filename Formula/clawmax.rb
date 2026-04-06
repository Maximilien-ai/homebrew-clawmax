class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.17"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.17/clawmax-v1.3.17-darwin-arm64.tar.gz"
      sha256 "079d1476e0b6749ad98ac033dc327e4bbb68ea121a49e4cb61a0c947c12bcde2"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.17/clawmax-v1.3.17-darwin-amd64.tar.gz"
      sha256 "1b78981aac5f84ec2c9061a5ec028467738943d672a444ecbb3fac89705053df"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.17/clawmax-v1.3.17-linux-arm64.tar.gz"
      sha256 "e0bc08bf9ad2b80ff2b562fed0f00cf8e0c1a59691ce426f452f8eacfbe5ab78"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.17/clawmax-v1.3.17-linux-amd64.tar.gz"
      sha256 "e670aeeb1007aba7c24db7b6b288327e1af8561a2ef6216a9b871ffc40aec38d"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
