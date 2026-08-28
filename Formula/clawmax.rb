class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.33"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.33/clawmax-v1.9.33-darwin-arm64.tar.gz"
      sha256 "2624d593cdbb0255a15c11ac908216c012197d60a4846f9931063c96e114eed1"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.33/clawmax-v1.9.33-darwin-amd64.tar.gz"
      sha256 "fe0ea560864f4858a353688f076c2a2a11a6fa075f16b33efa64ad4e0ab5d629"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.33/clawmax-v1.9.33-linux-arm64.tar.gz"
      sha256 "81ad438d11425ce6f87b5688908de8c7331cdebca6303a30879b1ebd4c934576"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.33/clawmax-v1.9.33-linux-amd64.tar.gz"
      sha256 "0dab1bd0cb19dedbdf52896f72ca149c149cfe99e4607340234aae159b3c0bbc"
    end
  end

  def install
    binary = Dir["**/clawmax"].find { |path| File.file?(path) && File.executable?(path) }
    raise "clawmax binary not found in release archive" if binary.nil?

    bin.install binary => "clawmax"
  end

  test do
    assert_match "1.9.33", shell_output("#{bin}/clawmax version")
  end
end
