class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.10"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.10/clawmax-v1.9.10-darwin-arm64.tar.gz"
      sha256 "d1a9637ada43e4d000ca1461c212c9a2260f344036c7f21aa9774f990557dddc"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.10/clawmax-v1.9.10-darwin-amd64.tar.gz"
      sha256 "c623afb5f9b650ad513e50aa71ad91e32819dc0f8d3d21951ba135eadbb39feb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.10/clawmax-v1.9.10-linux-arm64.tar.gz"
      sha256 "ef608e59842c1e31d4248673a10363e916abb99bcfd628cc8c8f787e46ae58d8"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.10/clawmax-v1.9.10-linux-amd64.tar.gz"
      sha256 "8f2c1413199f9075b60a5274be43c6caf89e20669dcd712e6d1748ef19cda26d"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.10", shell_output("#{bin}/clawmax version")
  end
end
