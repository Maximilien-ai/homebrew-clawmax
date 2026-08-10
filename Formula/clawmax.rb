class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.27"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.27/clawmax-v1.9.27-darwin-arm64.tar.gz"
      sha256 "aee29c5a06277d1ae690d7b2bc219c36e3ba6d67103e05fec3b294fe72aebca0"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.27/clawmax-v1.9.27-darwin-amd64.tar.gz"
      sha256 "d9309dc12747130ddf1c6952eee22557748c1d6abe489db5cf1ad9d1a5ea36a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.27/clawmax-v1.9.27-linux-arm64.tar.gz"
      sha256 "df59de5f04560288d8a875a83f928186c5c69c56d19317c85bc6b252000e5dfe"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.27/clawmax-v1.9.27-linux-amd64.tar.gz"
      sha256 "c3fde743caf56de3a3e26573f3261930efa6397bcabcbd6a1c39f91e731675dc"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"

    tray = Dir["**/clawmax-tray"].find { |path| File.file?(path) && File.executable?(path) }
    bin.install tray => "clawmax-tray" unless tray.nil?
  end

  test do
    assert_match "1.9.27", shell_output("#{bin}/clawmax version")
  end
end
