class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.23"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.23/clawmax-v1.9.23-darwin-arm64.tar.gz"
      sha256 "fe75f67716a3142e5e3132580ed8df2dbb5859f3fb3ff7d2cc638bb67597673e"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.23/clawmax-v1.9.23-darwin-amd64.tar.gz"
      sha256 "1242cd61d68a136687ed4db15c138b7cc5f72014b379ac032016a3b15385ded1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.23/clawmax-v1.9.23-linux-arm64.tar.gz"
      sha256 "c62a52f96d3d1215d49a12490f7915a329aa7af1663fd25e526fa428e1b124e8"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.23/clawmax-v1.9.23-linux-amd64.tar.gz"
      sha256 "d3bb7baa1706242ff2e173aa47071234df2e22af066ed6f74a8329a6005b63c8"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.23", shell_output("#{bin}/clawmax version")
  end
end
