cask "clawmax-app" do
  version "1.9.8"
  sha256 "a8390d30b56a12fa7f554df3a09e64adff85ba40162627581c0a128c8f971c3d"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.8/ClawMax-1.9.8.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.8.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
