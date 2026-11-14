cask "kkok" do
  version "0.2.1"
  sha256 "4225304ef8fca6bc0129cbbffcf02f56d2ff164fc03d7047ef4ecb8304b6cf40"

  url "https://github.com/ReentaKim/Kkok/releases/download/v#{version}/Kkok-#{version}.zip"
  name "Kkok"
  desc "Capture the screen, point at it with arrows and text, drag the PNG anywhere"
  homepage "https://github.com/ReentaKim/Kkok"

  depends_on macos: :sonoma

  app "Kkok.app"

  # 공증되지 않은 앱이므로 격리 속성을 벗겨 첫 실행 경고를 없앤다
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Kkok.app"]
  end

  uninstall quit: "io.github.reentakim.kkok"

  zap trash: [
    "~/Library/Application Support/Kkok",
    "~/Library/Preferences/io.github.reentakim.kkok.plist",
  ]

  caveats <<~EOS
    처음 캡처할 때 화면 기록 권한을 켜 주세요.
      시스템 설정 › 개인정보 보호 및 보안 › 화면 및 시스템 오디오 녹음 › Kkok
    영역 캡처(⇧⌘5)가 macOS 스크린샷 도구와 겹치면 시스템 설정에서 그쪽을 끄거나 Kkok 설정에서 단축키를 바꾸세요.
    캡처한 PNG는 ~/Pictures/Kkok 에 남습니다(zap으로도 지우지 않음).
  EOS
end
