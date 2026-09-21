cask "sagebar" do
  version "0.6.0"
  sha256 "112e22b30b589319d3ced7dea84f2d5d050c7bda7d7b0faaa6e0f66132f109de"

  url "https://github.com/ReentaKim/SageBar/releases/download/v#{version}/SageBar-#{version}.dmg"
  name "SageBar"
  desc "Zhuge Liang, Socrates, Nietzsche and King Sejong write you a morning letter from your Claude Code history"
  homepage "https://github.com/ReentaKim/SageBar"

  depends_on macos: :sonoma

  app "SageBar.app"

  # 공증되지 않은 앱이므로 격리 속성을 벗겨 첫 실행 경고를 없앤다
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/SageBar.app"], sudo: false
  end

  uninstall quit: "io.github.reentakim.sagebar"

  zap trash: [
    "~/Library/Application Support/SageBar",
    "~/Library/Preferences/io.github.reentakim.sagebar.plist",
  ]
end
