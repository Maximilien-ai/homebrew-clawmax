cask "clawmax-app" do
  version "1.9.14"
  sha256 "287a2a0c7351c68a4f9920af8cd20c90b44d244bf21c83aed521e717c23eba4f"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.14/ClawMax-1.9.14.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.14.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
