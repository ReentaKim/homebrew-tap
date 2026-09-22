cask "sagebar" do
  version "0.7.8"
  sha256 "08be04729a9a44ef15978aa171e737d9f2d167168f31cb6dd614c85a50a0752d"

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

  caveats <<~EOS
    SageBar는 이 Mac에 설치된 Claude Code CLI(claude)로 편지를 짓습니다.
      1) Claude Code 설치: https://claude.com/claude-code
      2) 터미널에서 `claude` 를 한 번 실행해 로그인
      3) SageBar 실행 → 메뉴바 아이콘 → 시작
    Claude Code가 없으면 SageBar가 설치 안내 화면을 띄우고 자동 생성은 멈춥니다.
  EOS

  uninstall quit: "io.github.reentakim.sagebar"

  zap trash: [
    "~/Library/Application Support/SageBar",
    "~/Library/Preferences/io.github.reentakim.sagebar.plist",
  ]
end
