class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.5.26"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.26/clawmax-v1.5.26-darwin-arm64.tar.gz"
      sha256 "764bd512bece82e520c078ae04f060fd4f32e0a6127a7ffff6aa3a11d5383cdc"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.26/clawmax-v1.5.26-darwin-amd64.tar.gz"
      sha256 "bb2a2a6f1cab168615884335f7437e792c26862ed31f08f2c4fbd88ab0282409"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.26/clawmax-v1.5.26-linux-arm64.tar.gz"
      sha256 "730d430a54e4ff98c6fef72bc62e007cbee8228a45a0660b20b1386f6c6e8d15"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.26/clawmax-v1.5.26-linux-amd64.tar.gz"
      sha256 "b5ebda326560c0870a65eb98d43e42297e53750df4c2fdd3819a7dcb9609453b"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.5.26", shell_output("#{bin}/clawmax version")
  end
end
