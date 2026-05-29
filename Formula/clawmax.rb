class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.8.4"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.4/clawmax-v1.8.4-darwin-arm64.tar.gz"
      sha256 "70f81262440525d0e3df5786f772be2e6256b78c6484a727278b9a1a84b503bb"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.4/clawmax-v1.8.4-darwin-amd64.tar.gz"
      sha256 "8805043de211aeb304af2345fa396e1b570786621bce9fbba888720d4631b56f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.4/clawmax-v1.8.4-linux-arm64.tar.gz"
      sha256 "16c206ff7a30c5b2d92c6ed648d238c4d2c43b093493459bf20c512213f85ce5"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.4/clawmax-v1.8.4-linux-amd64.tar.gz"
      sha256 "8ba25d9dc87d2ad539c6e80d5a26a4097fdd6d4d0a42e14ce0c8b020778d8104"
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
    assert_match "1.8.4", shell_output("#{bin}/clawmax version")
  end
end
