class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.8.7"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.7/clawmax-v1.8.7-darwin-arm64.tar.gz"
      sha256 "0b6e1e365f921d5693c6a0eecae2bc139998b98e490290d508ab9681d1f83eaa"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.7/clawmax-v1.8.7-darwin-amd64.tar.gz"
      sha256 "7405edd76988384ec76debfaf223bbe8eb111e2d2c7116f9ef6d97351f8441fe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.7/clawmax-v1.8.7-linux-arm64.tar.gz"
      sha256 "29f1f1f02b5ce0c274ad69c4ed666f0f5ca7e010068c01b320cc10ab7a8d2cd6"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.7/clawmax-v1.8.7-linux-amd64.tar.gz"
      sha256 "bdd4a6d6427c18f3c9dd64b69290db0fe6545e513953cf83193f161b36606326"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.8.7", shell_output("#{bin}/clawmax version")
  end
end
