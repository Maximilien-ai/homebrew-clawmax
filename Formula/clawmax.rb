class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.28"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.28/clawmax-v1.3.28-darwin-arm64.tar.gz"
      sha256 "f919ded387746c731dec8f03b4226af95c3ef7597d35acc0f942b9d39c6ed037"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.28/clawmax-v1.3.28-darwin-amd64.tar.gz"
      sha256 "320c1676cf0841c1d38cc6f3b526cb54a52bf3cc44555e89250ee5071cf24c41"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.28/clawmax-v1.3.28-linux-arm64.tar.gz"
      sha256 "6901f932bf180487c46d3ebd9398cac8737f56d20c52af76508086b2ee591409"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.28/clawmax-v1.3.28-linux-amd64.tar.gz"
      sha256 "1a38172554b1f5cdf7162026660599c05d5c1dadb5d152f077f873f5cfdcbb0e"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
