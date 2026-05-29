class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.8.2"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.2/clawmax-v1.8.2-darwin-arm64.tar.gz"
      sha256 "20b1e0da4f3ea8083951c62838259cdd36776a65d01b4c8e0c34ba091cb7a0e4"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.2/clawmax-v1.8.2-darwin-amd64.tar.gz"
      sha256 "9b4a7f5188df5e26f06f29bca6fcd41d3b975be80c22ff5f64132dc12cd05944"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.2/clawmax-v1.8.2-linux-arm64.tar.gz"
      sha256 "3331646e8b0885c87d41bd62a918a66c7ade6c481305780ca5916bd1c6198873"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.2/clawmax-v1.8.2-linux-amd64.tar.gz"
      sha256 "d6644e0dd270eceba5d945be3a8892e248640f66bf0df6d65ca06bc4a1ab867e"
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
    assert_match "1.8.2", shell_output("#{bin}/clawmax version")
  end
end
