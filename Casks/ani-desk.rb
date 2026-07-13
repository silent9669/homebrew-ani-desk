cask "ani-desk" do
  version "1.0.7"
  sha256 "cf2ee8c197935c047f420bb7d032172f8a9755906019240f8c5ae5da1ee29224"

  url "https://github.com/silent9669/ani-desk/releases/download/v#{version}/ani-desk_#{version}_aarch64.dmg"
  name "ani-desk"
  desc "Netflix-inspired desktop app for anime streaming"
  homepage "https://github.com/silent9669/ani-desk"

  livecheck do
    url "https://github.com/silent9669/ani-desk/releases/latest"
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "ani-desk.app"

  zap trash: [
    "~/Library/Application Support/com.silent9669.ani-desk",
    "~/Library/Caches/com.silent9669.ani-desk",
    "~/Library/Preferences/com.silent9669.ani-desk.plist",
  ]

  caveats <<~EOS
    ani-desk artifacts are unsigned. If macOS blocks the first launch, run:
      xattr -cr /Applications/ani-desk.app

    mpv is optional for fallback playback:
      brew install mpv
  EOS
end
