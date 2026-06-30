cask "clawmax-app" do
  version "1.9.12"
  sha256 "28a656f072330391aada998cecb56f7837bda0aeb1d5964164da60b92ab4894b"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.12/ClawMax-1.9.12.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.12.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
