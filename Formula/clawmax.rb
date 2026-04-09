class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.54"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.54/clawmax-v1.3.54-darwin-arm64.tar.gz"
      sha256 "5c43412799bc876dccb5f7010980bf06bfa130a7acc6a64f0de848daf0db00cd"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.54/clawmax-v1.3.54-darwin-amd64.tar.gz"
      sha256 "0a124199d5cee2c77e0b022e0120be4f1fdde339b946060a4ed4333eab907a06"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.54/clawmax-v1.3.54-linux-arm64.tar.gz"
      sha256 "ecc5a838373c87e73c4f5abafaf1383855ab44bcbcf9b465f5f5e0d5098b6977"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.54/clawmax-v1.3.54-linux-amd64.tar.gz"
      sha256 "d68be941041c28b3a072b34ee61f6af60ba575a05ec1d04a5a901e4281d1e3fb"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
