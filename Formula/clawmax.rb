class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.6.8"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.8/clawmax-v1.6.8-darwin-arm64.tar.gz"
      sha256 "29efda8347e41a41e5e3e7a9a52657c58b19df88e789b8d420f1501f1a21281b"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.8/clawmax-v1.6.8-darwin-amd64.tar.gz"
      sha256 "274a6c2f8f8e3980ab0ffe575baa0cd4c609a44247904b93566ae96bab745a9c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.8/clawmax-v1.6.8-linux-arm64.tar.gz"
      sha256 "747a51ed74cd10a7285aa24e1bafa2a2b739fa467d9cc7f5f9e043b9a3e3ddd1"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.8/clawmax-v1.6.8-linux-amd64.tar.gz"
      sha256 "0a2793da8dfe3c3ee45ab5ae4656df22153f873060117522de20d76d6772afd1"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.6.8", shell_output("#{bin}/clawmax version")
  end
end
