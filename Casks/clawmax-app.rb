cask "clawmax-app" do
  version "1.9.31"
  sha256 "1675d5e72a857eea7debce93b58c04998bfb1e49cac0fbc37a02daaf54c471bc"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.31/ClawMax-1.9.31.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.31.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
