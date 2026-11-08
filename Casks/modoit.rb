cask "modoit" do
  version "0.3.0"
  sha256 "e13f4e5009bb49c09d0f1c310c97e55e153a7d4e44e19cd8551c4324a4822a34"

  url "https://github.com/ReentaKim/Modoit/releases/download/v#{version}/Modoit-#{version}.dmg"
  name "Modoit"
  desc "Notes that stick: any note becomes a desktop sticky, saved as Markdown"
  homepage "https://github.com/ReentaKim/Modoit"

  depends_on macos: ">= :ventura"

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
