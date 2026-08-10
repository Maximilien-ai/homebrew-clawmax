class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.27"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.27/clawmax-v1.9.27-darwin-arm64.tar.gz"
      sha256 "065b9856f74df9c4f42b0167b254e252a3747549e028473579aed5718e7490f7"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.27/clawmax-v1.9.27-darwin-amd64.tar.gz"
      sha256 "110f6138f93892052e6889ee6e6102cd044d8019ba7ddfc71dd33d09f6aa79ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.27/clawmax-v1.9.27-linux-arm64.tar.gz"
      sha256 "b3f724b1d94fc6bc9676a5b36d7484f29be15148ca887847b6855e1cf98646cd"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.27/clawmax-v1.9.27-linux-amd64.tar.gz"
      sha256 "ed4e7cc8ed90e29b0831b2ccf24ed43b35e401e8e9e7fa669d53590a56110683"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.27", shell_output("#{bin}/clawmax version")
  end
end
