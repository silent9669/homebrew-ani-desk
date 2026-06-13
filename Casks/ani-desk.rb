cask "ani-desk" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.0"
  sha256 arm:   "5cd8f1c0b028e7e540eb10d37fa757110c06204559cda2968adac77d871709b8",
         intel: "28978006275bd11f6778587deb0f930d13054c5128e200afa1156bb2b4650456"

  url "https://github.com/silent9669/ani-desk/releases/download/v#{version}/ani-desk_#{version}_#{arch}.dmg"
  name "ani-desk"
  desc "Netflix-inspired desktop app for anime streaming"
  homepage "https://github.com/silent9669/ani-desk"

  livecheck do
    url "https://github.com/silent9669/ani-desk/releases/latest"
    strategy :github_latest
  end

  depends_on :macos

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
