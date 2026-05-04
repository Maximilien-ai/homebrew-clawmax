class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.5.24"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.24/clawmax-v1.5.24-darwin-arm64.tar.gz"
      sha256 "c3b7ead7a236e7cf5daf91d40cde82466f3abe829af11508313a1aeaacefe552"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.24/clawmax-v1.5.24-darwin-amd64.tar.gz"
      sha256 "556483c345c3591d5871f20678b04364f31275f986ec72e4136562ccf729476e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.24/clawmax-v1.5.24-linux-arm64.tar.gz"
      sha256 "1e33e05475c500df9f51e4759fd3be4a17410f0a9a0d71e66175fc00951caeb4"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.24/clawmax-v1.5.24-linux-amd64.tar.gz"
      sha256 "13b40e7f03a49ef8430f288057ce3aee6b1149544124556fd59d75cd1f2b860e"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.5.24", shell_output("#{bin}/clawmax version")
  end
end
