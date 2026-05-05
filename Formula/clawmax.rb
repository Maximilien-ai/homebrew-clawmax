class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.5.25"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.25/clawmax-v1.5.25-darwin-arm64.tar.gz"
      sha256 "313715c0f4e94918cc4171a8a59d04931e409160cd469d58222a0d38c94eb5df"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.25/clawmax-v1.5.25-darwin-amd64.tar.gz"
      sha256 "47ef0e911b3c4aa56977751417bb4bd5b48ad64c04902f47e8fecd2249f04ea6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.25/clawmax-v1.5.25-linux-arm64.tar.gz"
      sha256 "eb738d372b9471266733e2ee8a38ed181a7aca2869ec8daf9cc1b7258d5d86b2"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.25/clawmax-v1.5.25-linux-amd64.tar.gz"
      sha256 "f0ff1eeb0d4bd55d6a29073790d9b05f991391351745321d96440aec4c0533f3"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.5.25", shell_output("#{bin}/clawmax version")
  end
end
