class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.5.8"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.8/clawmax-v1.5.8-darwin-arm64.tar.gz"
      sha256 "faf52b7ab97d9c01d5f969aa7e58ff3957e65969bc70bb510a44350072c65140"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.8/clawmax-v1.5.8-darwin-amd64.tar.gz"
      sha256 "2ccfad95a0b117b519a1a9e3eac32dadaff05776c63c8a4205bd8e88567de4ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.8/clawmax-v1.5.8-linux-arm64.tar.gz"
      sha256 "3f25cf47008fe535f125d0de1916afd6eb1d2b698cdffdfc60c17455558de06d"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.8/clawmax-v1.5.8-linux-amd64.tar.gz"
      sha256 "b8d094aa41843f77eb6bf4bcafcc21f065cd5dd04e83878c1ac8bf2512d82b7f"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.5.8", shell_output("#{bin}/clawmax version")
  end
end
