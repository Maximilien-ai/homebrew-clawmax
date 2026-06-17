class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.7"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.7/clawmax-v1.9.7-darwin-arm64.tar.gz"
      sha256 "bad6a59d8a070d7512c7c5c0060926ca9e5c5dedce1b60fc0483be06c0d53974"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.7/clawmax-v1.9.7-darwin-amd64.tar.gz"
      sha256 "7038a32111c858264abdf6126bebde86d5460c05bc2aed24431b22c22592d18c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.7/clawmax-v1.9.7-linux-arm64.tar.gz"
      sha256 "9b079556456375c2cc973933a838f34ae0e11798a039b0a0efb042a077b3e933"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.7/clawmax-v1.9.7-linux-amd64.tar.gz"
      sha256 "4e24a62a708dafcec0381a9c359f5e7c4d2640e9971d583a1ddbc8b93cfc5dc7"
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
    assert_match "1.9.7", shell_output("#{bin}/clawmax version")
  end
end
