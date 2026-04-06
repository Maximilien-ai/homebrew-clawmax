class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.9"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.9/clawmax-v1.3.9-darwin-arm64.tar.gz"
      sha256 "80efd38b1ab257b02036b0bb571732f52de763df7949a2785ef27d7fa8b19be4"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.9/clawmax-v1.3.9-darwin-amd64.tar.gz"
      sha256 "c5ef7b0f3e5aabb9eca53a2d9ac18fd3c26fcee07c53bbf4b547a274e037f9a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.9/clawmax-v1.3.9-linux-arm64.tar.gz"
      sha256 "71dbb6aea95a2fc346547723c0210fd0223e41e0f9a9922222d38949c5df28df"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.9/clawmax-v1.3.9-linux-amd64.tar.gz"
      sha256 "33b1425bcaffdd24c9a485148df102f16991a221be05267aadb8ac29a95ebe6d"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
