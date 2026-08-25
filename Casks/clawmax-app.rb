cask "clawmax-app" do
  version "1.9.32"
  sha256 "3e7454084018ac29dfb37dd385e02a5d61fc8787de180c3f863154af357fd2fa"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.32/ClawMax-1.9.32.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.32.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
