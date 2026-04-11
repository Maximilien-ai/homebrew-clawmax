class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.60"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.60/clawmax-v1.3.60-darwin-arm64.tar.gz"
      sha256 "8cbc77d4d95679ba1cff38e6eff6ca6ca38efd0fd0ab180c99f8bb7172801d0c"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.60/clawmax-v1.3.60-darwin-amd64.tar.gz"
      sha256 "e812069c76667c0d2ad231e350e19f77cda9c5c83c15432baba938a014641ee0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.60/clawmax-v1.3.60-linux-arm64.tar.gz"
      sha256 "ecf546f349a17433ddbd1ef91fc9dcabffa42cb1267972276dbdd6fa5d8b8351"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.60/clawmax-v1.3.60-linux-amd64.tar.gz"
      sha256 "d5805a9125d62108c894531b77faa6bf9ed701a2fcf2345e0edd770e3bb18001"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
