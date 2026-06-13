cask "ani-desk" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.0"
  sha256 arm:   "a449ee1585aa87bfb2baafd365722d999900d68b1bf2636d7e7b25d5d3ea31a7",
         intel: "ff5b502a0fca17d5194dc43db7e6e23308efd9e5e20cc7582e60dad314346207"

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
