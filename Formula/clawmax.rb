class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.16"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.16/clawmax-v1.9.16-darwin-arm64.tar.gz"
      sha256 "53607e48e61ad78f87fddb2a08941d4bb00d17ebe3356c8fba40bcf967e27119"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.16/clawmax-v1.9.16-darwin-amd64.tar.gz"
      sha256 "77d40aad08df73dda7e4dd7bd19b49ff20874b5cc9f9aa60ac4ee765a9c33da9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.16/clawmax-v1.9.16-linux-arm64.tar.gz"
      sha256 "de35b1d2ed28a4459e45b56008a18d0cd09b0ab2bef684feeb2cb452fce1ed87"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.16/clawmax-v1.9.16-linux-amd64.tar.gz"
      sha256 "ead49a7b421b36576e75ab413874cdde76c941df7e9bd783998687b472d59ea4"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.16", shell_output("#{bin}/clawmax version")
  end
end
