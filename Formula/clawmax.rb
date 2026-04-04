class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.2.5"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.2.5/clawmax-v1.2.5-darwin-arm64.tar.gz"
      sha256 "a19751b1c5e4a32bf946a9dfe55be022bf992159337f26f3dfea743bf963af27"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.2.5/clawmax-v1.2.5-darwin-amd64.tar.gz"
      sha256 "1862d163296af05ae27a5511f4d2e583819da8bc1487b1e68af84eecbb25953f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.2.5/clawmax-v1.2.5-linux-arm64.tar.gz"
      sha256 "2512753ad1121b153f6ae763ec2ccd86c5a3e876d70a5898fbc5658b75ab4a47"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.2.5/clawmax-v1.2.5-linux-amd64.tar.gz"
      sha256 "87e2db3010fa4a1858e65099d5fc7c9d9b3b29bd3cb8a7ad79c8d0f85fbcc9b7"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
