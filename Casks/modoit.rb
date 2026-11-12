cask "modoit" do
  version "2.0.0"
  sha256 "c1b936766c180c5b683419b2babf36ac69a78bbb1f0905df82547c63636b748e"

  url "https://github.com/ReentaKim/Modoit/releases/download/v#{version}/Modoit-#{version}.dmg"
  name "Modoit"
  desc "Notes that stick: any note becomes a desktop sticky, saved as Markdown"
  homepage "https://github.com/ReentaKim/Modoit"

  depends_on macos: :sequoia

  app "Modoit.app"

  # 공증되지 않은 앱이므로 격리 속성을 벗겨 첫 실행 경고를 없앤다
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Modoit.app"], sudo: false
  end

  caveats <<~EOS
    첫 실행 때 메모를 저장할 폴더를 고릅니다. 메모는 그 폴더 안에 .md 파일로만 저장됩니다.
  EOS

  uninstall quit: "io.github.reentakim.modoit"

  zap trash: [
    "~/Library/Application Support/io.github.reentakim.modoit",
    "~/Library/Caches/io.github.reentakim.modoit",
    "~/Library/WebKit/io.github.reentakim.modoit",
  ]
end
