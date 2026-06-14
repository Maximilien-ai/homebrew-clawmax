class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.6"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.6/clawmax-v1.9.6-darwin-arm64.tar.gz"
      sha256 "d0e37d92daf915ac2de452732203057b97564611f19475845cd9d0ad2313d1b2"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.6/clawmax-v1.9.6-darwin-amd64.tar.gz"
      sha256 "2aa95164dd7b23075bb15d5f371e7ce4db569f9f8b4a2a70507e6422156773e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.6/clawmax-v1.9.6-linux-arm64.tar.gz"
      sha256 "1f2a4ce43f37f22a3349b4801cabcab16075d3ebe4009cf28fa23449f42e8a99"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.6/clawmax-v1.9.6-linux-amd64.tar.gz"
      sha256 "3d7e81fd2bbc88115bd823fc406a6a619affd80f033c628c14906bcdeb40d6f8"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.6", shell_output("#{bin}/clawmax version")
  end
end
