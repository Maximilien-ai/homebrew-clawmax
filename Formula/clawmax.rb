class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.7"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.7/clawmax-v1.3.7-darwin-arm64.tar.gz"
      sha256 "82ee27091e977bbd4e8b6e8b0750012f6baa794f5c22646ceee06dc0f3a3f73c"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.7/clawmax-v1.3.7-darwin-amd64.tar.gz"
      sha256 "9209466c4e8365f3c484f5f9ffcc06643c006f3636fde1ea82800150f243e836"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.7/clawmax-v1.3.7-linux-arm64.tar.gz"
      sha256 "f87cb4e628c042c0a388dd17ce682cec3a30a0f40808332cb7e37bf8ab3a68aa"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.7/clawmax-v1.3.7-linux-amd64.tar.gz"
      sha256 "6f17d03187a12b546671683e5253bc37b7aa22ec5f0a7562ecb6579b0f86fffc"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
