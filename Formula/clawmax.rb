class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.7.9"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.9/clawmax-v1.7.9-darwin-arm64.tar.gz"
      sha256 "1d87e40e04fcd19a7abdd1499b3831cc81aee4be3ceb88743267b74a87e33d55"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.9/clawmax-v1.7.9-darwin-amd64.tar.gz"
      sha256 "b4bc8fe5669354d1e9f5a47c6007f2bcf5bd2996907ed7971c2f99d1bb15602a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.9/clawmax-v1.7.9-linux-arm64.tar.gz"
      sha256 "1eca4cbf0dc52012947633c6391072fccb50d27278e77c87630b3591de223e6b"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.9/clawmax-v1.7.9-linux-amd64.tar.gz"
      sha256 "d11459ec70ff1b6a342c3eafa74fcf7eee13d7abc0bbf38f3896727dec971d32"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.7.9", shell_output("#{bin}/clawmax version")
  end
end
