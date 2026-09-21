cask "sagebar" do
  version "0.1.0"
  sha256 "301b3ff7b441882d2dda21ee6202613f814ac16ff89fb3f09878ab14ae98aab7"

  url "https://github.com/ReentaKim/SageBar/releases/download/v#{version}/SageBar-#{version}.dmg"
  name "SageBar"
  desc "Zhuge Liang, Socrates, Nietzsche and King Sejong write you a morning letter from your Claude Code history"
  homepage "https://github.com/ReentaKim/SageBar"

  depends_on macos: ">= :sonoma"

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
