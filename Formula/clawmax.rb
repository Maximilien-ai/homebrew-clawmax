class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.8.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.0/clawmax-v1.8.0-darwin-arm64.tar.gz"
      sha256 "14b139cdaf0f972970cac8f92f9c86a2d1b124a827e14294c852a830f937d1ae"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.0/clawmax-v1.8.0-darwin-amd64.tar.gz"
      sha256 "8f33aa348a68495360920a832212b75871a48c401e2893c31aa742f1007db67c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.0/clawmax-v1.8.0-linux-arm64.tar.gz"
      sha256 "f64c5d120cceec1b088df1415b043e16dbda331e1bef19e46fb87297e26b630c"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.0/clawmax-v1.8.0-linux-amd64.tar.gz"
      sha256 "e097fcf4f77987646a7be173f5970203761e5352705871dd4f2478158d9cfe48"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.8.0", shell_output("#{bin}/clawmax version")
  end
end
