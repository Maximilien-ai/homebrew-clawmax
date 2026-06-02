class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.4"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.4/clawmax-v1.9.4-darwin-arm64.tar.gz"
      sha256 "144ba19de7b6dc8f92e054f1a76a885bce6788eb622f270b89bc7f765d199411"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.4/clawmax-v1.9.4-darwin-amd64.tar.gz"
      sha256 "59cdbd64671188f8fe780e5d91dbc2b60fe6c939fc3c466ff04271c911b4ff2d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.4/clawmax-v1.9.4-linux-arm64.tar.gz"
      sha256 "3b7f13a5bf443b0edd702784817a1254792d13191b515a55f6b85910b3eae4f7"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.4/clawmax-v1.9.4-linux-amd64.tar.gz"
      sha256 "09bd8b54855898588c704dda42ec4e99337120dcda79b491dd9f45b268044961"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.4", shell_output("#{bin}/clawmax version")
  end
end
