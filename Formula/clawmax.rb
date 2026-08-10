class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.26"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.26/clawmax-v1.9.26-darwin-arm64.tar.gz"
      sha256 "ab2be21b16ecbeb29fa28cdbeebd3ea95b17fc4eadf811d463802adf54d9606a"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.26/clawmax-v1.9.26-darwin-amd64.tar.gz"
      sha256 "1db05600b677d424e6bf20072291a923fa2247653d307d8a0e0db802787e0f29"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.26/clawmax-v1.9.26-linux-arm64.tar.gz"
      sha256 "e52fa990e4cc17712fd6ee781a98ce69dedd7832d733b80f817371c6c77d7f48"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.26/clawmax-v1.9.26-linux-amd64.tar.gz"
      sha256 "5b6c13e8b01ccf4b2118c330d0beee540e144112af11e11863588d19646cd39b"
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
    assert_match "1.9.26", shell_output("#{bin}/clawmax version")
  end
end
