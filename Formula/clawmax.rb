class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.7.7"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.7/clawmax-v1.7.7-darwin-arm64.tar.gz"
      sha256 "8bcbbfdc9b5ea712c6900fc4faef77f573c540c9f0a03ddebe5f84c6fe199aa4"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.7/clawmax-v1.7.7-darwin-amd64.tar.gz"
      sha256 "ca7f6433c56391bc96d0eb19b03dd3e8d12d91a98886cb012a884fe1db984b73"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.7/clawmax-v1.7.7-linux-arm64.tar.gz"
      sha256 "e88edab163fa619e47dea63aefd6bd94efad53c348ca4e529e875a18dc7d58b0"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.7/clawmax-v1.7.7-linux-amd64.tar.gz"
      sha256 "8a074b4ce0f11c5c239913e10e596e7093de38bbe23583cb6009f0f024a55790"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.7.7", shell_output("#{bin}/clawmax version")
  end
end
