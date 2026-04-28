class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.5.6"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.6/clawmax-v1.5.6-darwin-arm64.tar.gz"
      sha256 "fb548e74b99c34bd3d914d570a1558e3254c75f0c9026e505ebb574fcb88ac73"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.6/clawmax-v1.5.6-darwin-amd64.tar.gz"
      sha256 "0359da146680cb0660a4f747841becbb99f3c66270ce5395244d1577932cf423"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.6/clawmax-v1.5.6-linux-arm64.tar.gz"
      sha256 "869e4811119ef0b594e42e5e5b4c9e91e64d1db30302efe9ef908acdb0e50de3"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.6/clawmax-v1.5.6-linux-amd64.tar.gz"
      sha256 "cca3e05e1890d88ae1c37208103a3e3ab595741d3d53e5742ca552842247f436"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.5.6", shell_output("#{bin}/clawmax version")
  end
end
