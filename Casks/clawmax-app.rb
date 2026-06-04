cask "clawmax-app" do
  version "1.9.5"
  sha256 "171308734d08c476b12f8a70650c39299a9bfb8e3f82efae01d9f0f1e5e18a2d"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.5/ClawMax-1.9.5.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.5.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
