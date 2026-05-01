class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.5.22"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.22/clawmax-v1.5.22-darwin-arm64.tar.gz"
      sha256 "2c4eff69d16bfa3764c92d3d95ef11ef02102fe71135161c7a48dd4d9d41db1b"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.22/clawmax-v1.5.22-darwin-amd64.tar.gz"
      sha256 "d1eb30e93c210221e3e1dac5a0fac11bbdbacbb0386871dfb841999e48a22976"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.22/clawmax-v1.5.22-linux-arm64.tar.gz"
      sha256 "f278b5158112623968e52bc6ba0416ae1ea9436045004514917664daf6d556ab"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.22/clawmax-v1.5.22-linux-amd64.tar.gz"
      sha256 "b7094f448b73172ce3937fbc482206c4ff3694e13ef0c6e2518164dbf443644f"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.5.22", shell_output("#{bin}/clawmax version")
  end
end
