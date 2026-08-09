class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.24"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.24/clawmax-v1.9.24-darwin-arm64.tar.gz"
      sha256 "17992ca0f8c5d99cfbdb76d9be78efc11da480a13529e317c408fa5e84a33bd6"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.24/clawmax-v1.9.24-darwin-amd64.tar.gz"
      sha256 "774e330040a91103d417f264130fb1c8534e14db6c1048d9f5aa2c95c8c25318"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.24/clawmax-v1.9.24-linux-arm64.tar.gz"
      sha256 "7db53126e4b7013ddf2721a42ff3ca3d1257435e562cdf3b9e84211195a0daba"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.24/clawmax-v1.9.24-linux-amd64.tar.gz"
      sha256 "a8945f5799753ed4ba5171ccddb7cb48991799894b56a4a582f88d65c0bdf1da"
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
    assert_match "1.9.24", shell_output("#{bin}/clawmax version")
  end
end
