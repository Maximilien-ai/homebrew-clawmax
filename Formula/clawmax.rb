class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.68"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.68/clawmax-v1.3.68-darwin-arm64.tar.gz"
      sha256 "b21cb75045b2912069fe0846480cb824f8336b89d4c03fdecea3247a9cf4ffd4"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.68/clawmax-v1.3.68-darwin-amd64.tar.gz"
      sha256 "0bd40fa28545ee77b4e0d99bb0a1ec2765e1053aab5eb2bc946e42d861ee57a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.68/clawmax-v1.3.68-linux-arm64.tar.gz"
      sha256 "e815da2339c2e1e9d22fa339e5c183db25ee65f92c511744d1701008226a0dc2"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.68/clawmax-v1.3.68-linux-amd64.tar.gz"
      sha256 "dbcc98001c7f36fc253fbd68355edf6bf5a5fe41579888f4aba8194456a89e44"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
