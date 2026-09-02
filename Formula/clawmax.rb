class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.34"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.34/clawmax-v1.9.34-darwin-arm64.tar.gz"
      sha256 "22e98464b6c83bd79a12a739c9a498d9cadf5a93b8fd4d6dc9075d1bc6db0313"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.34/clawmax-v1.9.34-darwin-amd64.tar.gz"
      sha256 "32a37fb1c92c423d4a9d603dc2cbc3a3c186a61177a6e873725dbbd7571d767e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.34/clawmax-v1.9.34-linux-arm64.tar.gz"
      sha256 "901901829817d029aac2341a912204e8c672acf811c2ba123d59c0c336c77601"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.34/clawmax-v1.9.34-linux-amd64.tar.gz"
      sha256 "e8e576c236a5d8583b4a7885a66b9970ac4858e8da6024934b7a8374fb222a8a"
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
    assert_match "1.9.34", shell_output("#{bin}/clawmax version")
  end
end
