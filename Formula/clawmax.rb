class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.3"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.3/clawmax-v1.3.3-darwin-arm64.tar.gz"
      sha256 "49745367f05c771f52da87e35297eb7be1a80cf7156d52030c92048917404709"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.3/clawmax-v1.3.3-darwin-amd64.tar.gz"
      sha256 "eb4e6be4c0f69e38071746d830d6760eb8377c4a51967b8748038a6983fdb2b7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.3/clawmax-v1.3.3-linux-arm64.tar.gz"
      sha256 "79d9db9e71dfe5529b670aaef1659cf026f7d545cb7a997e891314ec8be96a3e"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.3/clawmax-v1.3.3-linux-amd64.tar.gz"
      sha256 "d3f2fdf9a3f2d5c0fe41f9001cfff14fd5b7a3cc046e4059da274231f9924afc"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
