class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.12"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.12/clawmax-v1.3.12-darwin-arm64.tar.gz"
      sha256 "21dfd0a1f8caf029ef18a93df9462bc20e5fb1c1fcdc067d722cec644260fd6c"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.12/clawmax-v1.3.12-darwin-amd64.tar.gz"
      sha256 "347bd04bfd0b482803423faae06685b4d673e1772d1f0f49fd1a3a764f71d6a2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.12/clawmax-v1.3.12-linux-arm64.tar.gz"
      sha256 "24d7c0afe9c1d5e847638b4a0bc584d268d5de3500d6d45fb42ba646d889e143"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.12/clawmax-v1.3.12-linux-amd64.tar.gz"
      sha256 "3456d67e84c3e7cc3111d22423171d48ac70200ece705f27b6071741c33037ab"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
