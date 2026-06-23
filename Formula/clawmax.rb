class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.8"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.8/clawmax-v1.9.8-darwin-arm64.tar.gz"
      sha256 "6656894540cb412a3af94260bd4003a125e1b11d79e73ed3f97aa3128de4959b"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.8/clawmax-v1.9.8-darwin-amd64.tar.gz"
      sha256 "5c0df2490f2dd81fc0797e36892fb33bfde84badaf7e4ee1102bcf2d64aee040"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.8/clawmax-v1.9.8-linux-arm64.tar.gz"
      sha256 "194ad1737660a033bbfa51448ad181c0cfe596b2366fd3e3e2df2503ec525c6e"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.8/clawmax-v1.9.8-linux-amd64.tar.gz"
      sha256 "1f42b710547eb65409242f66d01f8225ee0c29671ff09d8aa2b940567de6e32e"
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
    assert_match "1.9.8", shell_output("#{bin}/clawmax version")
  end
end
