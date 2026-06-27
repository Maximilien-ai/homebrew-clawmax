class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.10"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.10/clawmax-v1.9.10-darwin-arm64.tar.gz"
      sha256 "921dee086a18962003526cb39e9ffec05845a919750279f8aa6785289e98a411"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.10/clawmax-v1.9.10-darwin-amd64.tar.gz"
      sha256 "af10bcb78e4403b82b0fc74374e56173795e744b298a862dec5a0af721ea06ba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.10/clawmax-v1.9.10-linux-arm64.tar.gz"
      sha256 "38bb00a0a163ef3190a43894376c7ba24c6991f67a463323c8de1441d53e5b27"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.10/clawmax-v1.9.10-linux-amd64.tar.gz"
      sha256 "13bbdbbf6c56b73c7bb78c4884766bdf310cefa16abccbf4bdbcec7046081a12"
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
    assert_match "1.9.10", shell_output("#{bin}/clawmax version")
  end
end
