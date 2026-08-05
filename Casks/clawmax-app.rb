cask "clawmax-app" do
  version "1.9.20"
  sha256 "88dd66e8826555194b6faae9982d397b32ae57745ae2e38fb0b3acdb8f88acb2"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.20/ClawMax-1.9.20.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.20.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
