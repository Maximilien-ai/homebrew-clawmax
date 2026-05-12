class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.6.11"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.11/clawmax-v1.6.11-darwin-arm64.tar.gz"
      sha256 "e4c098b842b5d1546d80108df7aade4155d2767977cba13308efc43b88684552"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.11/clawmax-v1.6.11-darwin-amd64.tar.gz"
      sha256 "022d86f23abd8bcc86b44fda89dfebebd2584ed0c1f592d2eead522f0c29ec71"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.11/clawmax-v1.6.11-linux-arm64.tar.gz"
      sha256 "c6f15b41dc0279d4bb775a3a706e218c82f6142ae2cb26af1a9b7f594ef1599b"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.11/clawmax-v1.6.11-linux-amd64.tar.gz"
      sha256 "8b285b042b57ebbde08880b4669bf779ad3646fd0bf7e05674a9a01f638ff8dc"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.6.11", shell_output("#{bin}/clawmax version")
  end
end
