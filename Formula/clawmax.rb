class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.5.16"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.16/clawmax-v1.5.16-darwin-arm64.tar.gz"
      sha256 "c9967c09802f1e25fc965caf2ae55101366d0d1736e91a0d8e596928df0d6888"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.16/clawmax-v1.5.16-darwin-amd64.tar.gz"
      sha256 "d5c23af62a5981040d130ec48f66613d942280de5620e466a58e7f51fdaf6ff0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.16/clawmax-v1.5.16-linux-arm64.tar.gz"
      sha256 "25bade78837ba2192377313087884f50d673c4301546c4fa4ed75bb169b380da"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.16/clawmax-v1.5.16-linux-amd64.tar.gz"
      sha256 "c574b266295ef9f9ad29f9ba8599d676bbe7bbb4f5c55382bd297afffb14f0af"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.5.16", shell_output("#{bin}/clawmax version")
  end
end
