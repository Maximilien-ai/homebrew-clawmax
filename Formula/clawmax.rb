class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.5.7"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.7/clawmax-v1.5.7-darwin-arm64.tar.gz"
      sha256 "1e464b824e5db9c4556972f4185090230847bb86e346eabdad0713b1ff93bb08"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.7/clawmax-v1.5.7-darwin-amd64.tar.gz"
      sha256 "9eccd846f3e5170d9f512a708fd70f0b25604c71c8d667f9f8fecb473cffe72f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.7/clawmax-v1.5.7-linux-arm64.tar.gz"
      sha256 "d1e4248fd4a4325ec4b5a67d6166db7a36f57f2386f412ffbf70763da580557f"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.7/clawmax-v1.5.7-linux-amd64.tar.gz"
      sha256 "acc301543ff6ae28209e75ee2ad14a0a8c5226b87ca22a42b8cdac0858864e4e"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.5.7", shell_output("#{bin}/clawmax version")
  end
end
