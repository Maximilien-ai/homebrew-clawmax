class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.8.8"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.8/clawmax-v1.8.8-darwin-arm64.tar.gz"
      sha256 "0726055942ebf85b1df9aff874aa14b690b4cb4e95c57e15bbf0f2ec090a695b"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.8/clawmax-v1.8.8-darwin-amd64.tar.gz"
      sha256 "c9784fb72e094c88dfec6f5f049c3ed0eb1b808b531284adc46d12013c8c32bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.8/clawmax-v1.8.8-linux-arm64.tar.gz"
      sha256 "6f9ed91d5bfb6dc294dda5c0d6112d661d1ed464e6712810e47ed5ae8c399cce"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.8/clawmax-v1.8.8-linux-amd64.tar.gz"
      sha256 "64c0c3ad87373feecefed18b946fe2d94f919560949cf6f79a5a8d2637f98942"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.8.8", shell_output("#{bin}/clawmax version")
  end
end
