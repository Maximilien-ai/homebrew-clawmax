class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.12"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.12/clawmax-v1.9.12-darwin-arm64.tar.gz"
      sha256 "f8db98f30cc4a7cf0bd900a574e073ac760772b6b7231d5b1accc4dcca44b289"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.12/clawmax-v1.9.12-darwin-amd64.tar.gz"
      sha256 "2364beb42e25eebfa51b8df219bcda0078019638ab799c59c49cb22b59982a3c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.12/clawmax-v1.9.12-linux-arm64.tar.gz"
      sha256 "cc5d121db3e1996d4da88f4603d3d5dab8cc599130cf75440502e56464143d65"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.12/clawmax-v1.9.12-linux-amd64.tar.gz"
      sha256 "298ca672cfe8688b74a4d5644d48bff90925c21655c3550765891f6265cebf5f"
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
    assert_match "1.9.12", shell_output("#{bin}/clawmax version")
  end
end
