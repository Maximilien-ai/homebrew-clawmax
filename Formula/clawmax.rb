class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.74"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.74/clawmax-v1.3.74-darwin-arm64.tar.gz"
      sha256 "2f79aecb6ee67ae84b8196293ea5eaa0fa831301d2bd033ac04ef79ca2d60b55"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.74/clawmax-v1.3.74-darwin-amd64.tar.gz"
      sha256 "45134672a2b588ca7fd24884973a18eaf95de3ece0e50e1d3df2e80787a09ea1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.74/clawmax-v1.3.74-linux-arm64.tar.gz"
      sha256 "373503718bb37d83f4c7ad9293ed6e1c5a638b8858aff665e0cafd4da6053188"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.74/clawmax-v1.3.74-linux-amd64.tar.gz"
      sha256 "7c45f936a9a588ce40ff07ac2a548d103079c2f54b607d5c3653a6ec79fd1084"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.3.74", shell_output("#{bin}/clawmax version")
  end
end
