class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.28"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.28/clawmax-v1.9.28-darwin-arm64.tar.gz"
      sha256 "7355f96e30b974f07128756cfdf09796b68a723ddd907118685986e687a79515"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.28/clawmax-v1.9.28-darwin-amd64.tar.gz"
      sha256 "111798b2a7069e730984ffe0b67b7a09e9eb0c0b2aee9f05ccd51b342ca7ea09"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.28/clawmax-v1.9.28-linux-arm64.tar.gz"
      sha256 "e46fee4da5e78863ee8ba29cee8f4c16bb4ec099bf2cf1677f63dd3af25d49d3"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.28/clawmax-v1.9.28-linux-amd64.tar.gz"
      sha256 "05ebc281919dc41e97124b4ac8ece7a0ad802966598c289addcbc720cfea4ff7"
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
    assert_match "1.9.28", shell_output("#{bin}/clawmax version")
  end
end
