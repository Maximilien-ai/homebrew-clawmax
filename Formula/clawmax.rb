class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.5.14"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.14/clawmax-v1.5.14-darwin-arm64.tar.gz"
      sha256 "7b9066cae934166df61edb58607a6d57883394ed57b85cbcab479daf35ea643c"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.14/clawmax-v1.5.14-darwin-amd64.tar.gz"
      sha256 "60f67dbde7f26a18e479f8f4b8633a01fc191c8f73668d89e2f1315edb5dbfd8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.14/clawmax-v1.5.14-linux-arm64.tar.gz"
      sha256 "8cf8ce067c177decd5606f14374cc973384d5be1fe6f37df481be2ec02b90880"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.14/clawmax-v1.5.14-linux-amd64.tar.gz"
      sha256 "0265a7f99eaee39c616258a3dde8219dfb93756c214dab717667aa555780eef5"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.5.14", shell_output("#{bin}/clawmax version")
  end
end
