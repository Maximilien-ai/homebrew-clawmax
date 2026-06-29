cask "clawmax-app" do
  version "1.9.11"
  sha256 "492a24a2e95b719b25c7e58c6ebbffa9a3b080f112db9228565716253ebe1e8d"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.11/ClawMax-1.9.11.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.11.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
