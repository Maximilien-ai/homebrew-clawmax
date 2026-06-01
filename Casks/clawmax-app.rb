cask "clawmax-app" do
  version "1.9.0"
  sha256 "97f883c5e0b37b6480dfbf3d09dc7baf5b190daa5da0299b6eca5d76ddce4dbc"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.0/ClawMax-1.9.0.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.0.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
