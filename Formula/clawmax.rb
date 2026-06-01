class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.8.9"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.9/clawmax-v1.8.9-darwin-arm64.tar.gz"
      sha256 "d6cbbcc5d317cae24e789f7a458744f7e90086a2ba7688f44918e4f57b3788e7"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.9/clawmax-v1.8.9-darwin-amd64.tar.gz"
      sha256 "588cb308fa19dc0bebdfdf620361872af0d611604e02b67ded8c9f1db7b72507"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.9/clawmax-v1.8.9-linux-arm64.tar.gz"
      sha256 "aad160ce7a84218578744a1602ce3e250336fd183ba6391a007b7a43fd81e9d0"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.9/clawmax-v1.8.9-linux-amd64.tar.gz"
      sha256 "4271862ad1de73e7525ed114a498ef7356c84bcfe1057992009bcb6f4fb3f672"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.8.9", shell_output("#{bin}/clawmax version")
  end
end
