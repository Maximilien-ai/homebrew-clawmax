class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.16"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.16/clawmax-v1.3.16-darwin-arm64.tar.gz"
      sha256 "4248430c7b2644e6f1497b7c906c2646ac8f96d90eedd331f74d38abbaa63f37"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.16/clawmax-v1.3.16-darwin-amd64.tar.gz"
      sha256 "3a8d9b35260c316b2b34a7977092ee5ac119226c9a263fbe43ba8fc8dc0ef4b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.16/clawmax-v1.3.16-linux-arm64.tar.gz"
      sha256 "460fed647aec918644fbe70b9e9749cc6f8d8199c7d2e8ab9d01c1a9cae8b1f0"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.16/clawmax-v1.3.16-linux-amd64.tar.gz"
      sha256 "71cbdf84f5da32d66e51d7a82967c2240d0458afcb6ce342e76d23f21d8a1fde"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
