class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.4.2"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.4.2/clawmax-v1.4.2-darwin-arm64.tar.gz"
      sha256 "3ab26dae3a2c96a07f4f16a6bf2db55bfc065bf7c435ca8d1d31c14e1767e6c1"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.4.2/clawmax-v1.4.2-darwin-amd64.tar.gz"
      sha256 "a7cd758feccda358a0d822dd978780e3dce6f33882c72a27b72911e7815ec584"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.4.2/clawmax-v1.4.2-linux-arm64.tar.gz"
      sha256 "fc8d2f5e8a6d57604647870de98f6ca670fa43a7648a9d7addd9267351bdef0f"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.4.2/clawmax-v1.4.2-linux-amd64.tar.gz"
      sha256 "fe52fb488eb7a94196b22bd0b6a39f8768d226d94f340b505db57cc062f727fd"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.4.2", shell_output("#{bin}/clawmax version")
  end
end
