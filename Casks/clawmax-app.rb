cask "clawmax-app" do
  version "1.9.29"
  sha256 "875e5a4f6f1478e4aa573f0429aab3f6d81caeda9cee5f0c3d0084f5b6b9cf48"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.29/ClawMax-1.9.29.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.29.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
