cask "clawmax-app" do
  version "1.9.28"
  sha256 "f8273ec4d8d87e93786bc994b11df4050a9800535c4d077ec81539689a0b3c9d"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.28/ClawMax-1.9.28.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.28.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
