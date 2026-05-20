cask "clawmax-app" do
  version "1.7.9"
  sha256 "7538b2ba2e8f11648e581b08cc87d0bb0ea7deab55afdff5e3010a88abff46e7"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.7.9/ClawMax-1.7.9.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.7.9.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
