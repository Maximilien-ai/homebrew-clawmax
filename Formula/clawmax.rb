class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.0/clawmax-v1.9.0-darwin-arm64.tar.gz"
      sha256 "bc5506f69843788c18ec0fef3837203a81619b888e83439dadba066762423f04"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.0/clawmax-v1.9.0-darwin-amd64.tar.gz"
      sha256 "0c2ee19a7fd72ca5492de3b74d16c9a763c68153020dd8b7b15534edea3956af"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.0/clawmax-v1.9.0-linux-arm64.tar.gz"
      sha256 "b8a6bd4a2f60ca01cea24fae2818a958e688a204c5f6bbe1c93c20b4e96074a6"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.0/clawmax-v1.9.0-linux-amd64.tar.gz"
      sha256 "f95af20bd76600118a7fcf82fb61568b94cb0b630154bb4ff9a53c121b940ad3"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.0", shell_output("#{bin}/clawmax version")
  end
end
