cask "clawmax-app" do
  version "1.8.5"
  sha256 "4730f40c7414cf153f20174169837e8da29a398b32081c6f61ae6e0c85d98841"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.5/ClawMax-1.8.5.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.8.5.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
