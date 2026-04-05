class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.0/clawmax-v1.3.0-darwin-arm64.tar.gz"
      sha256 "d7c25f257356d6a986a5e121bde1e4283f86318dd8e9df1f0dd197df0347af00"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.0/clawmax-v1.3.0-darwin-amd64.tar.gz"
      sha256 "3603967c3366586b50880d9a6a1b9e3e2626221ab81769cd76937102f58c3ebf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.0/clawmax-v1.3.0-linux-arm64.tar.gz"
      sha256 "124400f43231182cb861af43652d62279cdb6ed289cd4d3779639a1779a9e62f"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.0/clawmax-v1.3.0-linux-amd64.tar.gz"
      sha256 "83a95f8a1a6708036c6862486c541f3b752f1d7a06eb8ac6d52603370743f162"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
