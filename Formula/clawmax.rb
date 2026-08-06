class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.21"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.21/clawmax-v1.9.21-darwin-arm64.tar.gz"
      sha256 "7279f76361d4ebe4ef354215f500fbbd0bf807649289ae20442580b6dd09d587"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.21/clawmax-v1.9.21-darwin-amd64.tar.gz"
      sha256 "c5e569e6ffa8a3231cf7f0514124189c8a8782616ba1703e14d90421bbd949e6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.21/clawmax-v1.9.21-linux-arm64.tar.gz"
      sha256 "349c1e1af701a545d781eea10c2b14388fd7f83863434dc439edd740bf017803"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.21/clawmax-v1.9.21-linux-amd64.tar.gz"
      sha256 "45584cf027c9ec47474fe10522dd7004df1cabe71cb400dd733277428a917c2c"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.21", shell_output("#{bin}/clawmax version")
  end
end
