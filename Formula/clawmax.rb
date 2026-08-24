class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.31"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.31/clawmax-v1.9.31-darwin-arm64.tar.gz"
      sha256 "c8c677ba11879fe1e33bb6437845bb47c927f51109477a324ee368b7ee6cdd66"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.31/clawmax-v1.9.31-darwin-amd64.tar.gz"
      sha256 "cec6d64d0606e2353b0acd4b239fcd4a4d53ecbf6c48d052e4ab5611272b17c0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.31/clawmax-v1.9.31-linux-arm64.tar.gz"
      sha256 "42378015185b1fd95b2bdfdeeeeb8437104bd7f3db182e349a11ac5c8ca94b42"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.31/clawmax-v1.9.31-linux-amd64.tar.gz"
      sha256 "fbfbae5409c8e0d7fb8820cbcd24988596fd32635d067e9b862ed46974c79c80"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.31", shell_output("#{bin}/clawmax version")
  end
end
