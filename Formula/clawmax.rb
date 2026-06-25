class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.9"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.9/clawmax-v1.9.9-darwin-arm64.tar.gz"
      sha256 "2aa504ae55f6edcf65bf36fda1c4db08360929c8449bdd9bc02e15b140f2365e"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.9/clawmax-v1.9.9-darwin-amd64.tar.gz"
      sha256 "f19773ca2468b8bb09632e1d3eadb7395c6d36d70af75bfcf9655220c0a076d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.9/clawmax-v1.9.9-linux-arm64.tar.gz"
      sha256 "3a925ae831051cfb496caa976ec77aaae207bcc6e8abdc85b506a87ffb84ee19"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.9/clawmax-v1.9.9-linux-amd64.tar.gz"
      sha256 "5a1064e0577e570174444fc2d2677369918a6a028b4af6f239056ecb239c7216"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.9", shell_output("#{bin}/clawmax version")
  end
end
