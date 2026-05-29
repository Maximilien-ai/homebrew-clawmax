class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.8.6"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.6/clawmax-v1.8.6-darwin-arm64.tar.gz"
      sha256 "0f3cf5e36af48c8cceaae0c3c2c55d9b4865080b1fb3ced93d5884889482bb84"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.6/clawmax-v1.8.6-darwin-amd64.tar.gz"
      sha256 "e8eb5c72e82062819a956e94e094da89b548317dc9f1e5824acae63b1189dfbb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.6/clawmax-v1.8.6-linux-arm64.tar.gz"
      sha256 "5b675bf375127d7ba174f6b3e7f94865f521f8c895f71bffdecc19fc3d936d28"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.6/clawmax-v1.8.6-linux-amd64.tar.gz"
      sha256 "2c117301c9060f634267f1a1e1e4c8522b8e2500f1d9f07d179447af4b753f9f"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.8.6", shell_output("#{bin}/clawmax version")
  end
end
