class Clawmax < Formula
  desc "CLI for managing ClawMax on-premise deployments"
  homepage "https://clawmax.ai"
  version "1.3.7"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.7/clawmax-v1.3.7-darwin-arm64.tar.gz"
      sha256 "0683b783dc746db12e2623fb74983134acbd741f2b1c9b74e88c769263fb4198"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.7/clawmax-v1.3.7-darwin-amd64.tar.gz"
      sha256 "4ee27dec664a850aa0031efddb1fa255a3b060b252259a13ddb27d68835c057a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.7/clawmax-v1.3.7-linux-arm64.tar.gz"
      sha256 "620017eab88edd78af9ac8b148ac510d913112d4da595c9205beedae675ff520"
    else
      url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.3.7/clawmax-v1.3.7-linux-amd64.tar.gz"
      sha256 "b51e80709cc920ca4a1ffeb49cb2f09e53a254810cf9c348869e64bc9c87823c"
    end
  end

  def install
    bin.install "clawmax"
  end

  test do
    assert_match "clawmax", shell_output("#{bin}/clawmax version 2>&1", 1)
  end
end
