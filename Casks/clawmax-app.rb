cask "clawmax-app" do
  version "1.9.16"
  sha256 "addb63d50a330b4d72cbad20db1f283559a397b62bf266c253ba76669dd6a066"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.16/ClawMax-1.9.16.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.16.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
