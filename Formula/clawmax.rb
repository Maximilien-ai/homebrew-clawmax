class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.8.6"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.6/clawmax-v1.8.6-darwin-arm64.tar.gz"
      sha256 "8a0d76d9f71bd0de9bae2fc00d0bbfdf40dcd614611ba197393243f109f27cbf"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.6/clawmax-v1.8.6-darwin-amd64.tar.gz"
      sha256 "f253d2944dae4da6556aeb7e85ff7e6bdc47c50545410fed04ae6185231d4adb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.6/clawmax-v1.8.6-linux-arm64.tar.gz"
      sha256 "5266b576477dca7361faade6cbcb887ead96cbee1cc081d7d86b2d9f780f6ed0"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.6/clawmax-v1.8.6-linux-amd64.tar.gz"
      sha256 "4d5cfca06401e3d430a34fb1569e30a4121a999c9130bbf86e4fc6fc87e927be"
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
    assert_match "1.8.6", shell_output("#{bin}/clawmax version")
  end
end
