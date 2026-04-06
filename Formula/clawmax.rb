class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.11"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.11/clawmax-v1.3.11-darwin-arm64.tar.gz"
      sha256 "cf3da1cd5ea01b6d93b49191f0ed48ddd3df802d8281b254304871fca4ea378c"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.11/clawmax-v1.3.11-darwin-amd64.tar.gz"
      sha256 "9cfded639dc58e3cdd5446ed35604497b1d64e3194b411432a5abde8ff1de7b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.11/clawmax-v1.3.11-linux-arm64.tar.gz"
      sha256 "e9f73797ea05cb886ce0c01eb7f0aded0cb23f1e0ddeac33cd10336c23fa01ae"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.11/clawmax-v1.3.11-linux-amd64.tar.gz"
      sha256 "909ce9546bd06e4ae31f5d27028abc6290210aeff6c8bb9b6f0a8b369c35072f"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
