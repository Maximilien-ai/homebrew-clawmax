cask "clawmax-app" do
  version "1.9.24"
  sha256 "65b4613c47f1c52f968d2ba87ccdefecc16dbcf56e4ba2e0d885f2fd56aa1014"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.24/ClawMax-1.9.24.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.24.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
