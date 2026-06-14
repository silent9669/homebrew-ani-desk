cask "ani-desk" do
  version "1.0.0"
  sha256 "e48094b6d63ac94c72a699ffb4d64afd2253728d68a57af3579db2d724267ff3"

  url "https://github.com/silent9669/ani-desk/releases/download/v#{version}/ani-desk_#{version}_aarch64.dmg"
  name "ani-desk"
  desc "Netflix-inspired desktop app for anime streaming"
  homepage "https://github.com/silent9669/ani-desk"

  livecheck do
    url "https://github.com/silent9669/ani-desk/releases/latest"
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :sequoia"

  app "ani-desk.app"

  zap trash: [
    "~/Library/Application Support/com.silent9669.ani-desk",
    "~/Library/Caches/com.silent9669.ani-desk",
    "~/Library/Preferences/com.silent9669.ani-desk.plist",
  ]

  caveats <<~EOS
    ani-desk v1.0 artifacts are unsigned. If macOS blocks the first launch,
    open System Settings > Privacy & Security and allow ani-desk.

    mpv is optional for fallback playback:
      brew install mpv
  EOS
end
