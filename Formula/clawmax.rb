class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.9.33"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.33/clawmax-v1.9.33-darwin-arm64.tar.gz"
      sha256 "c5569a65eec7b9ee9fb7fa5e0dc237b58b010f2a8440087a15de14def0eeb317"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.33/clawmax-v1.9.33-darwin-amd64.tar.gz"
      sha256 "84f5fb56921c558d4dc41a9e1502d1b14b0ecea453dba9fcba98e8d9f4318f65"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.33/clawmax-v1.9.33-linux-arm64.tar.gz"
      sha256 "3427f3f789d813ee156d8cc48b8a0c776c786a8aaec18c2cdb73ca6001cbfc7f"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.33/clawmax-v1.9.33-linux-amd64.tar.gz"
      sha256 "f60f59395ee7b3ea5adcfc5fb13a591a887e099fb1a7398f5f473ed57adaece8"
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
    assert_match "1.9.33", shell_output("#{bin}/clawmax version")
  end
end
