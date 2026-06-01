cask "clawmax-app" do
  version "1.8.9"
  sha256 "1db5955354a60ba17112fad8ec2ada370fa2ff35fc79ab166164466290eb99d4"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.9/ClawMax-1.8.9.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.8.9.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
