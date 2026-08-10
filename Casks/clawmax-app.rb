cask "clawmax-app" do
  version "1.9.25"
  sha256 "2764788a9edf68c686a09f564b827a3e077dd3cfdc406a4187063f757f84db6d"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.25/ClawMax-1.9.25.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.25.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
