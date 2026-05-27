cask "clawmax-app" do
  version "1.8.1"
  sha256 "c0425ac8ec0751b144738fac2e7a8598427990aef10ca93530979ea70fa756b5"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.1/ClawMax-1.8.1.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.8.1.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
