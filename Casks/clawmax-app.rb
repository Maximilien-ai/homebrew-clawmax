cask "clawmax-app" do
  version "1.9.23"
  sha256 "29482c6c9d2621ffa1996d5f4672babc456704113e6fc0ea473151b10adac4c5"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.23/ClawMax-1.9.23.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.23.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
