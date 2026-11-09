class Amoo < Formula
  desc "AI-driven mobile testing framework for iOS and Android"
  homepage "https://github.com/ArjangConsulting/amoo-ai"
  license "MIT"
  version "0.4.0"

  on_macos do
    url "https://github.com/ArjangConsulting/amoo-ai/releases/download/#{version}/amoo-#{version}-macos-universal.tar.gz"
    sha256 "3fd3c03c3b548d8d8af980177cc9094a1bf345b60c81c6749245a60596798879"
  end

  on_linux do
    url "https://github.com/ArjangConsulting/amoo-ai/releases/download/#{version}/amoo-#{version}-linux-static.tar.gz"
    sha256 "7d77ab811e9e45e0965fb14ec7354e223370f1fddc90b09e73a1345fc446be12"
  end

  def install
    bin.install "amoo"
    prefix.install "CompanionApps"
    (share/"amoo").install "scripts/install-mcp.sh"
    # The amoo plugin: subagents + skills that `amoo agent install` renders for each AI client,
    # and that `gemini extensions link` / local marketplaces can point at directly.
    (share/"amoo/plugins").install "plugins/amoo"
  end

  def caveats
    <<~EOS
      Add the amoo subagent to your AI coding clients (Claude Code, Cursor, Codex, Copilot,
      Gemini CLI, OpenCode); it asks which ones:
        amoo agent install
      Prepare simulators from a prebuilt app (and set up your AI clients) with a guided flow:
        amoo init
      Or install the amoo plugin from your client's marketplace:
        https://github.com/ArjangConsulting/amoo-ai#use-amoo-from-any-ai-agent
    EOS
  end

  test do
    assert_match "Usage: amoo <command> [options]", shell_output("#{bin}/amoo --help")
    assert_match(/\A\d+\.\d+\.\d+/, shell_output("#{bin}/amoo --version"))
    assert_path_exists share/"amoo/install-mcp.sh"
    assert_path_exists share/"amoo/plugins/amoo/agents/amoo.md"
    assert_path_exists prefix/"CompanionApps/Android/gradlew"
    assert_path_exists prefix/"CompanionApps/Android/prebuilt/app-debug.apk"
    assert_path_exists prefix/"CompanionApps/Android/prebuilt/app-debug-androidTest.apk"
    if OS.mac?
      assert_path_exists prefix/"CompanionApps/iOS/project.yml"
      assert_path_exists prefix/"CompanionApps/iOS/prebuilt/iphonesimulator/Products"
      assert_path_exists prefix/"CompanionApps/iOS/prebuilt/iphoneos/Products"
      assert_path_exists prefix/"CompanionApps/iOS/sign-prebuilt.py"
    end
  end
end
