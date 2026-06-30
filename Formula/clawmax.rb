class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.13"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.13/clawmax-v1.9.13-darwin-arm64.tar.gz"
      sha256 "a6afef84a547bf5bd34b3d63341073e43558551f4f767c34523ad35643a33225"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.13/clawmax-v1.9.13-darwin-amd64.tar.gz"
      sha256 "0905895acb432ba1d9e2f0cd34ec9a14c6df83559e4a6211a105ea935c757121"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.13/clawmax-v1.9.13-linux-arm64.tar.gz"
      sha256 "e0da674bfb6bb96b6812f87e2fea881d8a497fecdf8eb6b4625d986b9e4dfa62"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.13/clawmax-v1.9.13-linux-amd64.tar.gz"
      sha256 "ddaf4af37405b0f03728861793624057bc3b8fb1a2e5e1c11988ad15393449fe"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.13", shell_output("#{bin}/clawmax version")
  end
end
