cask "clawmax-app" do
  version "1.9.33"
  sha256 "5347ce85e79bd01c8045f718971f915d1c64015c08be638080bd356a1369b0f0"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.33/ClawMax-1.9.33.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.33.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
