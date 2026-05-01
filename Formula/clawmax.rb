class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.5.23"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.23/clawmax-v1.5.23-darwin-arm64.tar.gz"
      sha256 "2e9fff70405310a100aa8e54b2226a220b16edd2211306d22bbe3e7fd8bd8862"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.23/clawmax-v1.5.23-darwin-amd64.tar.gz"
      sha256 "a342076bf1f0e98095576c3c466cb88c8ba23ea8efb2fde8c195ab5238c65bdf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.23/clawmax-v1.5.23-linux-arm64.tar.gz"
      sha256 "63878b94c22e3baefe8ecd1800b3b89fc941393efcd0d2550a1b4dc9fa258737"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.23/clawmax-v1.5.23-linux-amd64.tar.gz"
      sha256 "45868896ac6f8b4c6bf1ca1a4c266d9eb8652bdaf91718a4886d3c958b6127ca"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.5.23", shell_output("#{bin}/clawmax version")
  end
end
