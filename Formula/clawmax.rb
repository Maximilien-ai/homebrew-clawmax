class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.11"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.11/clawmax-v1.9.11-darwin-arm64.tar.gz"
      sha256 "afd5624c4217007b0e35b049aa9705022be51e0153c9d9c50e9c98fcb9a56ee9"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.11/clawmax-v1.9.11-darwin-amd64.tar.gz"
      sha256 "c8bc1e218dbe3f281ea92ae709d3f87052eb97afca8a8ecd2b5e09c03afb6ede"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.11/clawmax-v1.9.11-linux-arm64.tar.gz"
      sha256 "885399e722ddd6d9a2936412973202fc79e0f8ee92050603e349748b1dc39b97"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.11/clawmax-v1.9.11-linux-amd64.tar.gz"
      sha256 "0b0a1e7f3214b20bf0a14e2b2ca993a0038d55394544e9e5bdd06c10c21913af"
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
    assert_match "1.9.11", shell_output("#{bin}/clawmax version")
  end
end
