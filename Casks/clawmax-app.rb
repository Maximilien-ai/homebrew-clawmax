cask "clawmax-app" do
  version "1.8.0"
  sha256 "3c19a1c9d21f26a6ec28f3724570549a5b49121985e14b6ebafe28800074e46e"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.0/ClawMax-1.8.0.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.8.0.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
