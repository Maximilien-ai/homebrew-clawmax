cask "clawmax-app" do
  version "1.9.13"
  sha256 "35a1f2e94e60ded86ddddce2ea97e742019b60f50f289a0f8553ba80ae66f9f6"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.13/ClawMax-1.9.13.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.13.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
