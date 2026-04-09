class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.51"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.51/clawmax-v1.3.51-darwin-arm64.tar.gz"
      sha256 "5348acedd21311c44fa235c823f04b37aa48230ecea40f32baa13b600eb99ab7"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.51/clawmax-v1.3.51-darwin-amd64.tar.gz"
      sha256 "fb1f4898a1858e8a74ccbd6ea3bbefb8c59f644ba5dccd57af4f8ba16f586828"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.51/clawmax-v1.3.51-linux-arm64.tar.gz"
      sha256 "84b45ac65e93ec917e2634f7115e3311dbe481beb905acbb5d7ad8f3e03c254b"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.51/clawmax-v1.3.51-linux-amd64.tar.gz"
      sha256 "7a486f5bd22629cd9bb33816a9ca4a273ddff193455bc66946e4ccb132330221"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
