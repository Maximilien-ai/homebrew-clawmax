class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.32"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.32/clawmax-v1.9.32-darwin-arm64.tar.gz"
      sha256 "dc4324076d446b12bc3b808883ed0e36eb35e78bb1d953fe1fea078364acec6a"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.32/clawmax-v1.9.32-darwin-amd64.tar.gz"
      sha256 "2e6f07abe33a487e21affb1bcded43f2e300988fc09ed8a50b9cd0070db7b883"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.32/clawmax-v1.9.32-linux-arm64.tar.gz"
      sha256 "0fe0a42ead1b755449294f0a5f1326c3fa2ed82db07549013bb4e84cd7e1a87d"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.32/clawmax-v1.9.32-linux-amd64.tar.gz"
      sha256 "edc42862b2a24a3080ac871096ed216b2a6305609693d40dda5a66f471cbd4d4"
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
    assert_match "1.9.32", shell_output("#{bin}/clawmax version")
  end
end
