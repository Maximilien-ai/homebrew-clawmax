class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.8.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.0/clawmax-v1.8.0-darwin-arm64.tar.gz"
      sha256 "de543d2df64798d29d395b1c0e28d7054affd75601f7f06bc1c948f793adce13"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.0/clawmax-v1.8.0-darwin-amd64.tar.gz"
      sha256 "6e5e7abee4d820ca6f979b54a54b47e22eac16df0a0d3abc9d20b5ba049532a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.0/clawmax-v1.8.0-linux-arm64.tar.gz"
      sha256 "0327862d0c531c74e29f09a53e1603a2f9d2d007fea95535c230bf0cfe15aac1"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.0/clawmax-v1.8.0-linux-amd64.tar.gz"
      sha256 "1f80322aeed0ec4f26d73e3e1f09e55a2e40bb8698dcf94546fef47691e12df6"
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
    assert_match "1.8.0", shell_output("#{bin}/clawmax version")
  end
end
