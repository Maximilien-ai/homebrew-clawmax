cask "clawmax-app" do
  version "1.9.2"
  sha256 "8d6ba1209100dd3cab74b9516dd39768537814d6041badd8912b0e285abd4eae"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.2/ClawMax-1.9.2.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.2.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
