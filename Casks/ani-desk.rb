cask "ani-desk" do
  version "1.0.9"
  sha256 "f085161a3952fa7ca46ddd88a4521a004d5ca43a2c7cd5bd23368c20ea5d9e3c"

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
