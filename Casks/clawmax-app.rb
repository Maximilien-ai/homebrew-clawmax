cask "clawmax-app" do
  version "1.8.6"
  sha256 "dba7956981dd881c2470f0dcf08f7cc4cbe68bb6aae1f5d3e2679fdd5db68a60"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.6/ClawMax-1.8.6.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.8.6.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
