cask "clawmax-app" do
  version "1.9.30"
  sha256 "984d003f82412c5d7d0455a00efd5386696fef7c47a7e06f2b9130f22ec1e76c"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.30/ClawMax-1.9.30.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.30.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
