cask "clawmax-app" do
  version "1.9.6"
  sha256 "8a15d85a2dba70358da8e118fb42db85873104f32ea73f782f49fb673f438b42"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.6/ClawMax-1.9.6.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.6.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
