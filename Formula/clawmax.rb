class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.7.5"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.5/clawmax-v1.7.5-darwin-arm64.tar.gz"
      sha256 "b2f528fa04a4ef395f7ea32b511b65d0770a969072903b2cc5a1bee5e9b4db9f"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.5/clawmax-v1.7.5-darwin-amd64.tar.gz"
      sha256 "1c42e2b1a5ab5952172a1bbe244ee4c11e95551dbc64cb066ec5770d27b5faa6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.5/clawmax-v1.7.5-linux-arm64.tar.gz"
      sha256 "9e53f789ce42a78a1908c86b5770c221322b06e5eadd78af2f535464b61c7c37"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.5/clawmax-v1.7.5-linux-amd64.tar.gz"
      sha256 "90ada40506b6fddcd788d1ff83f9eb236929576392c19cadfa62868e237baa43"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.7.5", shell_output("#{bin}/clawmax version")
  end
end
