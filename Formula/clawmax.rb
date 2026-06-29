class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.11"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.11/clawmax-v1.9.11-darwin-arm64.tar.gz"
      sha256 "91265c6f843f1952a4078aa2864cf71e1d6bfc0279de2bec568489b19ece875a"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.11/clawmax-v1.9.11-darwin-amd64.tar.gz"
      sha256 "3ad33fc7b317419d8aebca1555252c5ca4129e02ecd35ce99df6bd0e56e49222"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.11/clawmax-v1.9.11-linux-arm64.tar.gz"
      sha256 "4f98abf0619a6781f624f433ba8c11e3155abbc0f46e652a20fb6cc3385b8b55"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.11/clawmax-v1.9.11-linux-amd64.tar.gz"
      sha256 "4c3a95d7f92d918e602e4296dbecbf840c9a4e9a93b61c3f22499d71be735180"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.11", shell_output("#{bin}/clawmax version")
  end
end
