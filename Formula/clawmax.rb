class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.15"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.15/clawmax-v1.3.15-darwin-arm64.tar.gz"
      sha256 "a1137898facc33a46aa242eede8cc08eebf78a68c4ef6a3b8ccb3213c3d5cffa"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.15/clawmax-v1.3.15-darwin-amd64.tar.gz"
      sha256 "cf99a94e616d0b85dbc81e56dc8ff71e0ba1109d30ea89ea5c1e14234d533c50"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.15/clawmax-v1.3.15-linux-arm64.tar.gz"
      sha256 "458182e5b0a73a5d72e97ee766a3670ce5f2803cf25a5000fa0146d8248b6070"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.15/clawmax-v1.3.15-linux-amd64.tar.gz"
      sha256 "1143708308bcb662f444a226e0c47ea6b7c99bfa5213321a56a65fe75b980918"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
