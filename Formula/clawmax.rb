class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.29"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.29/clawmax-v1.9.29-darwin-arm64.tar.gz"
      sha256 "db78c16cf71b971582c9607d236f3cf9334c62fe9486de845ec8f4284e677a68"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.29/clawmax-v1.9.29-darwin-amd64.tar.gz"
      sha256 "607fe98340951ad5410293eb7fd3e04f97c4a8b8ddedb60760771d1a2b382dda"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.29/clawmax-v1.9.29-linux-arm64.tar.gz"
      sha256 "698dae8222fa15b69deb2c783161b9409ae2e9ad78d1e1957e2cc549a6e9c17a"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.29/clawmax-v1.9.29-linux-amd64.tar.gz"
      sha256 "b4b2c77dae8aa7878c018aadaecea8bb92a60e2cdb8f9d9259195cdad6860e3e"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.29", shell_output("#{bin}/clawmax version")
  end
end
