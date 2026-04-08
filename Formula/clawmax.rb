class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.40"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.40/clawmax-v1.3.40-darwin-arm64.tar.gz"
      sha256 "f0e36f2de23e8193e5e2e93677e715a6250eb76ed5fdf541aff768ca6911289a"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.40/clawmax-v1.3.40-darwin-amd64.tar.gz"
      sha256 "b4baf696909d1e60713345b17b0195fbc96510dc04375966c0e6445eb26af461"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.40/clawmax-v1.3.40-linux-arm64.tar.gz"
      sha256 "604b3391d7e6308c87ac55edf91f143f72ec58d7b7a18bc18f49bcc59aed9dde"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.40/clawmax-v1.3.40-linux-amd64.tar.gz"
      sha256 "da75cd50a1a32f94cfac18ea00acf6b18ac09e86ba0dc1243cc48596a17ab7cb"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
