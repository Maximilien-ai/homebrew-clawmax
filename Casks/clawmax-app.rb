cask "clawmax-app" do
  version "1.9.21"
  sha256 "3dacba6edd47b16ec186c6fdedf9e418cf30c7089b5330a40ed67b3c6dc3bcfc"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.21/ClawMax-1.9.21.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.21.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
