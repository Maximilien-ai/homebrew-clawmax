class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.22"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.22/clawmax-v1.9.22-darwin-arm64.tar.gz"
      sha256 "4d2abfacea11decef2dd8b255cf0423a6276dd15b86176ab62d75da0d13421b1"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.22/clawmax-v1.9.22-darwin-amd64.tar.gz"
      sha256 "8009ea22e345d8d73409a69a3018695cbeadda41a7e7b1461b6a61efe1ee8c00"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.22/clawmax-v1.9.22-linux-arm64.tar.gz"
      sha256 "bd53de9bc949ea790aadfe28de276ec41178477a02266252ac6c11a0279d95fd"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.22/clawmax-v1.9.22-linux-amd64.tar.gz"
      sha256 "a6f6ef92f27061100cd1e72c9769850953c92e2f039ae254498620ed29d1014c"
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
    assert_match "1.9.22", shell_output("#{bin}/clawmax version")
  end
end
