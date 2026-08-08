cask "clawmax-app" do
  version "1.9.22"
  sha256 "2bb9a2c9c75029b6d8813b522a123da16ae07b56ff0f7ef3aceff4024218f96b"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.22/ClawMax-1.9.22.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.22.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
