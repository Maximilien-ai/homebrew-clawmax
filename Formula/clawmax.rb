class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.6"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.6/clawmax-v1.3.6-darwin-arm64.tar.gz"
      sha256 "719998189ab653de9d84408aa5e9137caf403475d211e56e25f069d70d763ade"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.6/clawmax-v1.3.6-darwin-amd64.tar.gz"
      sha256 "a8184b3cfe739017a0cf2cd1d780be19743484a1a4f16178cf0ec8caf781d126"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.6/clawmax-v1.3.6-linux-arm64.tar.gz"
      sha256 "a965c7d2050005bdc496c034998e79e53b9b986ae055b91e1ca984571dc708b1"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.6/clawmax-v1.3.6-linux-amd64.tar.gz"
      sha256 "f7b6d859c4934074b826725071e02b09b93742e387df0249e7c919d83952d3db"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
