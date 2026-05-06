class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.6.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.0/clawmax-v1.6.0-darwin-arm64.tar.gz"
      sha256 "a84fec1e82772edbf13e6b79e2acc1ac73e665a37dc67bc4c770d9bd0fc6222c"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.0/clawmax-v1.6.0-darwin-amd64.tar.gz"
      sha256 "31193cf3000489b03e87c473d2f78d0d03f89066b9d7bc2685819e66811b1bb7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.0/clawmax-v1.6.0-linux-arm64.tar.gz"
      sha256 "8b6d7ebbdfb63dfe4cb4579426d4330917a2ff79f064520b40fac5bb38f27081"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.0/clawmax-v1.6.0-linux-amd64.tar.gz"
      sha256 "1761527cebb41295db47852c2668ff147d135754497dc783a1176a5e06a44926"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.6.0", shell_output("#{bin}/clawmax version")
  end
end
