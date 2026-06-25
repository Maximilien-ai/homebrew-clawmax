cask "clawmax-app" do
  version "1.9.9"
  sha256 "c5ed2e80d433a805a105c103557ad20d520e2d8e1ce57c8c5886b6028bc4cb81"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.9/ClawMax-1.9.9.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.9.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
