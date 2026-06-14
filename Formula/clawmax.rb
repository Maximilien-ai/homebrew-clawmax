class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.6"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.6/clawmax-v1.9.6-darwin-arm64.tar.gz"
      sha256 "d9e382361ad24f0206e75a032077ef381032d6b755ad335ee75671a46c3954c5"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.6/clawmax-v1.9.6-darwin-amd64.tar.gz"
      sha256 "fff9e8d38643ddb4e8a43cc055dd1d2493aec844ddbd06f66a8fe436165ccab4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.6/clawmax-v1.9.6-linux-arm64.tar.gz"
      sha256 "9c31356e6d4819e9301025d24fcdf34e5e3096f2490d6bf360d053e940df6e2d"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.6/clawmax-v1.9.6-linux-amd64.tar.gz"
      sha256 "5ebeebf1757795a217ae3bb8d490246647c1fa713fb2fa939987349351f4b89e"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"

    tray = Dir["**/clawmax-tray"].find { |path| File.file?(path) && File.executable?(path) }
    bin.install tray => "clawmax-tray" unless tray.nil?
  end

  test do
    assert_match "1.9.6", shell_output("#{bin}/clawmax version")
  end
end
