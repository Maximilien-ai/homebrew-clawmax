class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.8.3"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.3/clawmax-v1.8.3-darwin-arm64.tar.gz"
      sha256 "11bdfcc1a1983d866979284619b5929b6b0269b81a52179835b964d7dbd1b69a"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.3/clawmax-v1.8.3-darwin-amd64.tar.gz"
      sha256 "4db373365eaf229a599cff1fd5394525083f4ea40c8d654fc667b5c1125889fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.3/clawmax-v1.8.3-linux-arm64.tar.gz"
      sha256 "8ac4d2a4fd4e9db263acaf7dfdf0128fd0d974ef41b697728b5f6d6c7977b5ad"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.3/clawmax-v1.8.3-linux-amd64.tar.gz"
      sha256 "61e1ed6538e1e631f0e0b302394aece29e1f90f246276f3f6f4c983f8cb12c04"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.8.3", shell_output("#{bin}/clawmax version")
  end
end
