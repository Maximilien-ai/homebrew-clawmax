cask "clawmax-app" do
  version "1.9.26"
  sha256 "e2bdebd0ccf3c74928da2871d74f78f7f6557e669a3fbf15421873e325e11dbb"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.26/ClawMax-1.9.26.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.26.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
