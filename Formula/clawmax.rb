class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.8.7"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.7/clawmax-v1.8.7-darwin-arm64.tar.gz"
      sha256 "20361945e69ff924f0721882b13cb33d7fc5a8396e2990da499d7d9a59b13e55"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.7/clawmax-v1.8.7-darwin-amd64.tar.gz"
      sha256 "a5201d4932a060ea1e6f95368452f20ed7a969c61177b685272be2948dfca0af"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.7/clawmax-v1.8.7-linux-arm64.tar.gz"
      sha256 "6f53b3b070e9a650a8d927f36eb1ffa15f182fe0f89ec0f44589a2d668cae661"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.7/clawmax-v1.8.7-linux-amd64.tar.gz"
      sha256 "d2868f10a44e1af941b3d1a9de3214821695ff5b2c268807b8abe292c9b60215"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"

    tray = Dir["**/clawmax-tray"].find { |path| File.file?(path) && File.executable?(path) }
    bin.install tray => "clawmax-tray" unless tray.nil?
  end

  test do
    assert_match "1.8.7", shell_output("#{bin}/clawmax version")
  end
end
