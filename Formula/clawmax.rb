class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.5.17"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.17/clawmax-v1.5.17-darwin-arm64.tar.gz"
      sha256 "67a4e07e5e3322b720e9910e5e1bdb946031a196e496acda3e9cbf320c89eb8d"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.17/clawmax-v1.5.17-darwin-amd64.tar.gz"
      sha256 "d47eb4e90493a21e5604c496f6ca9de01285e815d41f67eb68198975a1d09f99"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.17/clawmax-v1.5.17-linux-arm64.tar.gz"
      sha256 "61b89b0f33a9983766666f3111afbeae73c6d69b9e55b2bf052d8e1a9f042a32"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.17/clawmax-v1.5.17-linux-amd64.tar.gz"
      sha256 "d94916d3a01e8eae02a97f8c2443abfa2926fcbb46b5a86ef0023bacd5bea618"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.5.17", shell_output("#{bin}/clawmax version")
  end
end
