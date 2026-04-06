class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.18"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.18/clawmax-v1.3.18-darwin-arm64.tar.gz"
      sha256 "2ad7aaf2d970579f718599aa2884f58966e6261f0074826cc79406df54e7d966"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.18/clawmax-v1.3.18-darwin-amd64.tar.gz"
      sha256 "8045b9d09ec411a8073c1dd71741924e77b4d7bc8449be463c9b2393220142bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.18/clawmax-v1.3.18-linux-arm64.tar.gz"
      sha256 "6ffca4105ebddf3896d1389427b5e59a1301275c8a07142d25b6e8103413de8c"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.18/clawmax-v1.3.18-linux-amd64.tar.gz"
      sha256 "8d723ec3f00214034bb2c491687d8ba90d5e2a03c9392234d74d7ad734a307f8"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
