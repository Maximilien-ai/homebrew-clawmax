class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "0.1.9"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.9/clawmax-v0.1.9-darwin-arm64.tar.gz"
      sha256 "affea154395dfb7f9307f2635cdd811905ce7970cc86ba29b650de42798ba868"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.9/clawmax-v0.1.9-darwin-amd64.tar.gz"
      sha256 "09e8b69d472d6245675896f59bbb2ae03287dd52a508e8257292b7fc4d829489"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.9/clawmax-v0.1.9-linux-arm64.tar.gz"
      sha256 "88f2ab5c8c876ac8e878988de49bc637390a6ad2a57743b65135bd0710c2609e"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.9/clawmax-v0.1.9-linux-amd64.tar.gz"
      sha256 "39e9e78b6a2f5a44bdcdcae95f931ffe6c5164e654ecdaf7843d906f19388e00"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
