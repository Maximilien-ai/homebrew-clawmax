class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.13"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.13/clawmax-v1.3.13-darwin-arm64.tar.gz"
      sha256 "7bc3f62b6bd5f5406c047fd094ba552d490065b724b72ea61f2aa7af70098334"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.13/clawmax-v1.3.13-darwin-amd64.tar.gz"
      sha256 "952cd56a73bb58f8a8cb2db10873e5abce76f9811299f1982f62bd35837a0e4d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.13/clawmax-v1.3.13-linux-arm64.tar.gz"
      sha256 "0209fc485ec69bedb3af6a1d0b96a65ac937fa24a975ea3f9efbbee025b0060d"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.13/clawmax-v1.3.13-linux-amd64.tar.gz"
      sha256 "4201447459e5368251f962e0fc4285e8e829749156fb12e4c0f53374ebfccc36"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
