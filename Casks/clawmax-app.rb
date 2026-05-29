cask "clawmax-app" do
  version "1.8.2"
  sha256 "bd7a1fe3d1aa1204423e7da7689dd69004a82dcadcd8d3b967361b596f269dcc"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.2/ClawMax-1.8.2.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.8.2.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
