cask "clawmax-app" do
  version "1.9.34"
  sha256 "c8ba7c81f1f45e3feb81d0a7a03b2043267a54e41ea7b51a3986200928697f82"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.34/ClawMax-1.9.34.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.34.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
