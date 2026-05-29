class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.8.5"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.5/clawmax-v1.8.5-darwin-arm64.tar.gz"
      sha256 "e37b169383ce0e48ec254402cd9060e2951ee2c3c94acbe8096a6155bde6d20b"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.5/clawmax-v1.8.5-darwin-amd64.tar.gz"
      sha256 "1bcd564ab0085c23786b947d04163da9b8b12932a33322f453296a7242da50e2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.5/clawmax-v1.8.5-linux-arm64.tar.gz"
      sha256 "1dadbad8e556b36ee812f6996c1b39a679d7e7927f7774a97698ec162f558d48"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.5/clawmax-v1.8.5-linux-amd64.tar.gz"
      sha256 "ea3fe258713f724ad7f440d9310a9d6dd56bf10d4e9b6db6a04022f24dd9c203"
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
    assert_match "1.8.5", shell_output("#{bin}/clawmax version")
  end
end
