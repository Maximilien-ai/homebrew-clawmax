cask "clawmax-app" do
  version "1.8.4"
  sha256 "026088e53302aa07f73e514648c888fb14a462680512b32cce58e3e44d0236a2"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.4/ClawMax-1.8.4.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.8.4.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
