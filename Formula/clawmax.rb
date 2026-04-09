class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.52"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.52/clawmax-v1.3.52-darwin-arm64.tar.gz"
      sha256 "5a9a57369fc5e68fe1b68d6a2b8d89d5627cd3a5b8c3a8be28084cd597b67cd4"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.52/clawmax-v1.3.52-darwin-amd64.tar.gz"
      sha256 "ae8f2df34a86d0c2acf837965c9d755174550ed3b9f872671dfa679a04741e5e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.52/clawmax-v1.3.52-linux-arm64.tar.gz"
      sha256 "590702679d62e31fbe086b5c71848fec6b27a25e449fdfff6028ad375459dd9d"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.52/clawmax-v1.3.52-linux-amd64.tar.gz"
      sha256 "a7deb768ed614e17155c0db844e63ef67f13d08dc7ab591b500fa44cd2e5b2ce"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
