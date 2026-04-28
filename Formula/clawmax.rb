class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.5.10"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.10/clawmax-v1.5.10-darwin-arm64.tar.gz"
      sha256 "4db5803eccb8a03662460ac47b8510c20da5fd02ccf54f89e437997d58a5567d"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.10/clawmax-v1.5.10-darwin-amd64.tar.gz"
      sha256 "c79acacdc330c4e911d947f006189cfab0213e199ce913d7848e264ba097d479"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.10/clawmax-v1.5.10-linux-arm64.tar.gz"
      sha256 "828626917ceb0bb45db773313c2900179ffb62a9045c288abb3b9c13da834989"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.5.10/clawmax-v1.5.10-linux-amd64.tar.gz"
      sha256 "6ae3e8e14afd171ebbfe2170df89a70e9e8965c9aee869f794d75333ac87d6af"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.5.10", shell_output("#{bin}/clawmax version")
  end
end
