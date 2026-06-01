cask "clawmax-app" do
  version "1.9.1"
  sha256 "ecef9e01a0d0e5aa3d1e67840f299b440ffcba620a801d9e7f50846b465f5bc3"

  url "https://github.com/Maximilien-ai/clawmax-cli-releases/releases/download/v1.9.1/ClawMax-1.9.1.pkg"
  name "ClawMax"
  desc "ClawMax Agent and App for on-premise deployments"
  homepage "https://clawmax.ai"

  pkg "ClawMax-1.9.1.pkg"

  uninstall pkgutil: "ai.maximilien.clawmax"
end
