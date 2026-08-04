cask "clawmax-app" do
  version "1.9.17"
  sha256 "9eebec6eea8d7fbd453287a9b4b1818aae39eaf5fa0210fd737917519d4ae298"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.17/ClawMax-1.9.17.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.17.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
