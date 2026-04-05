class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.1"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.1/clawmax-v1.3.1-darwin-arm64.tar.gz"
      sha256 "93408baf228538b34cfdebd29e454b86bd7b9ae72dec40186f6a171786639945"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.1/clawmax-v1.3.1-darwin-amd64.tar.gz"
      sha256 "bc0cb8431f38c6124d70281e1c278dead25273c455a6f6427577b9431b2e2031"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.1/clawmax-v1.3.1-linux-arm64.tar.gz"
      sha256 "3bbe9fb41b29a75a84df2be16fc26eefcd2b05cd63bdfa1192d124f4bd65e29c"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.1/clawmax-v1.3.1-linux-amd64.tar.gz"
      sha256 "8ba549a60211c341a192a68e7d18037959617b65117e7067bf2981c8b7003985"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
