class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.25"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.25/clawmax-v1.3.25-darwin-arm64.tar.gz"
      sha256 "cd689a42f038dee0e3f478fd66e4deb0614d2b9a778dca283c5650fd7d61b3de"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.25/clawmax-v1.3.25-darwin-amd64.tar.gz"
      sha256 "41ab1370147618cb2757d91ef208f56b394252ceee84d2abbdf04363fd11b7ac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.25/clawmax-v1.3.25-linux-arm64.tar.gz"
      sha256 "e609c29bbd8a0518ad7a4a74b8524c6dc5b5dc88e8d938e588629330cba406c7"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.25/clawmax-v1.3.25-linux-amd64.tar.gz"
      sha256 "70c3117be870c2dd0b5e0d705227ea1904bd67f6577a3d064ffaa74101807ebe"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
