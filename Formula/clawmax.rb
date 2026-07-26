class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.15"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.15/clawmax-v1.9.15-darwin-arm64.tar.gz"
      sha256 "72c853903c1b8d8ae3ac4530a725dd42699d1d8c8852f36bc8209c1a0e1cc8c5"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.15/clawmax-v1.9.15-darwin-amd64.tar.gz"
      sha256 "1b41627d323707ece956543a3297ee725a5032b3373de65caf197c26dcbf65c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.15/clawmax-v1.9.15-linux-arm64.tar.gz"
      sha256 "ea68410afa31e11c9bc5b20bdb7cb0e5e833b2c6a0ecf213165e716e94a725bc"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.15/clawmax-v1.9.15-linux-amd64.tar.gz"
      sha256 "70c012791077895c9e993ba8a119f1eaa52207362f6fdfc89ef05a850f7b4faa"
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
    assert_match "1.9.15", shell_output("#{bin}/clawmax version")
  end
end
