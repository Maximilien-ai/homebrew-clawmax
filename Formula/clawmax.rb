class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "0.1.9"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.9/clawmax-v0.1.9-darwin-arm64.tar.gz"
      sha256 "aa1db20fa1c2859f9fcdb61b9f9734f356725ee7698077fea36ab5c65dd5807b"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.9/clawmax-v0.1.9-darwin-amd64.tar.gz"
      sha256 "76a58bad27504e59a345970bca16384bda78f37d9001b25aa38fc29719991818"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.9/clawmax-v0.1.9-linux-arm64.tar.gz"
      sha256 "ddb836f149c80dd2ef98bc96d71ba94d6b764afa9cd9e1c211d8352213327801"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v0.1.9/clawmax-v0.1.9-linux-amd64.tar.gz"
      sha256 "af5b115472dfc29115c9d359c86578c7d192725827a7c26621c1a4010a03e45e"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
