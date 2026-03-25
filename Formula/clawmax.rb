class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "0.1.16"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.16/clawmax-v0.1.16-darwin-arm64.tar.gz"
      sha256 "52ba5a52e4807a98664bb8b08090f8929b245eca1a6496e51cc2f68870a38de9"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.16/clawmax-v0.1.16-darwin-amd64.tar.gz"
      sha256 "f80360907611ff85d5bbb9f7e0b5b37a3bbbaaef0ce2ca57cf0dbb4d5d260fd3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.16/clawmax-v0.1.16-linux-arm64.tar.gz"
      sha256 "400d48b4d4f1cd844b214b52a42cf380baba58bcab0658246fa9bb6cbe8179e0"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.16/clawmax-v0.1.16-linux-amd64.tar.gz"
      sha256 "8a3157ee9870399cf1b0e01a68f29d53fffcae0d7a22ff33c2924804a4d00ba9"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
