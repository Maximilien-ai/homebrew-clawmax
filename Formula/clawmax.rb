class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.53"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.53/clawmax-v1.3.53-darwin-arm64.tar.gz"
      sha256 "16b9e43f835fc5ed1d62050beb1c40a61f38b83a2ed82b250b717fa55aa5fd09"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.53/clawmax-v1.3.53-darwin-amd64.tar.gz"
      sha256 "adde5a43e821cf079cc4d9a96e418575a5c128c70e3279cbd20aefaaa89145d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.53/clawmax-v1.3.53-linux-arm64.tar.gz"
      sha256 "9b11ca30a3faa0aefb82a56ce8f0adf41609528d114a9311239df28619c1efa2"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.53/clawmax-v1.3.53-linux-amd64.tar.gz"
      sha256 "127ce2bb511eb61c5a51ecfb9a60a3450ed2fa5b4c243dac338073b09e21d390"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
