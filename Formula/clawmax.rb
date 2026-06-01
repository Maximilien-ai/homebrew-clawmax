class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.1"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.1/clawmax-v1.9.1-darwin-arm64.tar.gz"
      sha256 "7e3b022cf553699056f6f4dd9eacddae00ed9d873213eb440a90cbecaafa7000"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.1/clawmax-v1.9.1-darwin-amd64.tar.gz"
      sha256 "d7d3f5e3cfac56477c85adf468b195bd7817e407f13ea12b27503626b54ce08b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.1/clawmax-v1.9.1-linux-arm64.tar.gz"
      sha256 "3568867de8c6dc7d5a508ece0e3fd804f04e5cb671d4e7e63aa203a47262308f"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.1/clawmax-v1.9.1-linux-amd64.tar.gz"
      sha256 "9425120d02b825aa62075cfd13b6abc7e17fb39130a5d04831229cd12f972e14"
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
    assert_match "1.9.1", shell_output("#{bin}/clawmax version")
  end
end
