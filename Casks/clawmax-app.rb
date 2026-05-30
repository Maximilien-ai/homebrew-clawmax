cask "clawmax-app" do
  version "1.8.7"
  sha256 "72a6166e69ebe2af40f343b34b677cdc8309581a88952c76de5c6e9a414d2b64"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.7/ClawMax-1.8.7.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.8.7.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
