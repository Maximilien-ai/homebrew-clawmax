cask "clawmax-app" do
  version "1.8.3"
  sha256 "97e11030e81e8a2e665413017674e801b207adccc881431c33fc1d7677d7015b"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.3/ClawMax-1.8.3.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.8.3.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
