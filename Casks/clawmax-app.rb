cask "clawmax-app" do
  version "1.8.8"
  sha256 "0fbfdc3a2587bd265630459df74bc5bdf5348f91dc379a9521af080b3991ba6a"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.8.8/ClawMax-1.8.8.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.8.8.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
