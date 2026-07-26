cask "clawmax-app" do
  version "1.9.15"
  sha256 "3e09f3a38d1c196f55bbee182dabccc76b1a991d55dfadcb0790c678620f5b09"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.15/ClawMax-1.9.15.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.15.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
