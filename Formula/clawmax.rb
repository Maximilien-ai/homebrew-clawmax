class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.0/clawmax-v1.9.0-darwin-arm64.tar.gz"
      sha256 "090621c918803fa4db80e173ebe7db5024356c206b7325db5efaa1a675e4024e"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.0/clawmax-v1.9.0-darwin-amd64.tar.gz"
      sha256 "befd8f44f43457cdcfce8ba64fcda5b25b09cd7a2c4256091d56d4d10cff71e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.0/clawmax-v1.9.0-linux-arm64.tar.gz"
      sha256 "01d9e1ddbb9dbfc607b38628a51b339ff4d559fff3053fd80fc3d6f0d8e956a7"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.0/clawmax-v1.9.0-linux-amd64.tar.gz"
      sha256 "dfe34141b1817542a5ba7edc897c76e49398a53e226f0e20ebddab11c733aa16"
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
    assert_match "1.9.0", shell_output("#{bin}/clawmax version")
  end
end
