cask "clawmax-app" do
  version "1.9.7"
  sha256 "aae8bb462f727bd05b2637608318942a425bb072206801bd1b7df0e59400ba3b"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.7/ClawMax-1.9.7.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.7.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
