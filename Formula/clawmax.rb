class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.6.4"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.4/clawmax-v1.6.4-darwin-arm64.tar.gz"
      sha256 "57c3805264139142e051dd240d1d4cf0bb86171a649f1884ac5848788d7f0977"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.4/clawmax-v1.6.4-darwin-amd64.tar.gz"
      sha256 "a42878f3cc6cc63ea7af5df3a46dffd953785f36b5acc94f238bc6884771f09d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.4/clawmax-v1.6.4-linux-arm64.tar.gz"
      sha256 "4eac2942f6f741bc7ba6214382bef47c56421f543a932f43f3a30fa09378dc80"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.6.4/clawmax-v1.6.4-linux-amd64.tar.gz"
      sha256 "df08878a87e2678c0e0b1c1e5a0fcd662c83311f8a57afa77830f4ee86bb769c"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.6.4", shell_output("#{bin}/clawmax version")
  end
end
