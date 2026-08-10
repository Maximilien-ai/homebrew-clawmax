cask "clawmax-app" do
  version "1.9.27"
  sha256 "998754f8c6113bc0c16a1bb7c5c38a766d1b835a1bb5cf3c6c00ab4c47e99601"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.27/ClawMax-1.9.27.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.27.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
