cask "clawmax-app" do
  version "1.9.10"
  sha256 "490f1ed65fdb7093295d903fa7262f644548c7dfb69248b0b5b5f06d40f240a0"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.10/ClawMax-1.9.10.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.10.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
