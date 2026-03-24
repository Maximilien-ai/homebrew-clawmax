class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "0.1.8"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.8/clawmax-v0.1.8-darwin-arm64.tar.gz"
      sha256 "dd25705a06f9a0330a7fa252cc4d86a887a6907fbd74d810104202c1959f3e81"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.8/clawmax-v0.1.8-darwin-amd64.tar.gz"
      sha256 "4051325514db2b15cb5efd311a23de51e37f733d8b84fa96193fbd8856a75c38"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.8/clawmax-v0.1.8-linux-arm64.tar.gz"
      sha256 "84b05071f806219e067a31dd951c3192548bd5a2ee26c508ba67012e46a8e45e"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.8/clawmax-v0.1.8-linux-amd64.tar.gz"
      sha256 "74f0970ebf8c6be911396f81c2d1cf929833b7d04c2dd01f998f73daf63fa9b3"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
