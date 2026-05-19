cask "clawmax-app" do
  version "1.7.8"
  sha256 "5bd44d5c277786c30488ccb2037df1108c5d7bbe892ff857d9e78fd253cc3bf3"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.8/ClawMax-1.7.8.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.7.8.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
