cask "clawmax-app" do
  version "1.9.3"
  sha256 "700b0d9d6599f3ce605ca612e627278f78b430c5d4e4f7a2bda152cad065740b"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.3/ClawMax-1.9.3.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.3.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
