class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.6.5"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.5/clawmax-v1.6.5-darwin-arm64.tar.gz"
      sha256 "83885f3266a57fadb81fd4d7996b14861acb445553ec16f446a530d485330178"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.5/clawmax-v1.6.5-darwin-amd64.tar.gz"
      sha256 "bcb7ba2bd22e4ef08f2642d856138921509e31bb1de46f317889acaffdadab85"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.5/clawmax-v1.6.5-linux-arm64.tar.gz"
      sha256 "fcb707a9c050199bcd68fe23c9da8d8de44d8674ec9b18496ce621bb6d134bbb"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.5/clawmax-v1.6.5-linux-amd64.tar.gz"
      sha256 "0ed0fe3cac6a4f1a89297763a09483764e4f86ffb1c2c1aa0be35c9d8c66da18"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.6.5", shell_output("#{bin}/clawmax version")
  end
end
