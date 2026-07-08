class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.14"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.14/clawmax-v1.9.14-darwin-arm64.tar.gz"
      sha256 "65aa1d9a0ed98e85db89ffb848cc2a7f1772625584828df68763a008cb39372c"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.14/clawmax-v1.9.14-darwin-amd64.tar.gz"
      sha256 "30497afc31ff0595c567215e45909c6a616a629b12973d5a30f0ed6bfa7170d3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.14/clawmax-v1.9.14-linux-arm64.tar.gz"
      sha256 "afba1eeed200051553a53b0f81e8f4a7a419c8d8fd7a540e71963890a531e0b8"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.14/clawmax-v1.9.14-linux-amd64.tar.gz"
      sha256 "2172f21bd6e47ea3c0de7ccd993bbe641a1c9eac949d0dea27ce3857593916db"
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
    assert_match "1.9.14", shell_output("#{bin}/clawmax version")
  end
end
