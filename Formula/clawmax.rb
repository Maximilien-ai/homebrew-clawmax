class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.1"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.1/clawmax-v1.9.1-darwin-arm64.tar.gz"
      sha256 "629960f6558df1ac74451b7459d0da186fba15fa1dccca5647caf1973cff4e65"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.1/clawmax-v1.9.1-darwin-amd64.tar.gz"
      sha256 "f7e669862f4fd84f04b2b69e7a006bd47b2662fd235434a5b5cd57d5b8d90ca3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.1/clawmax-v1.9.1-linux-arm64.tar.gz"
      sha256 "1dc68eb83dbf991db27c3c482f22552fd427eba33aa3c806176225792e5713e0"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.1/clawmax-v1.9.1-linux-amd64.tar.gz"
      sha256 "a1c419e3c60cf5fbc585fbec16211e9ec3038689e9c07f677b029ef8e984c94d"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.1", shell_output("#{bin}/clawmax version")
  end
end
