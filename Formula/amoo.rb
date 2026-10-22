class Amoo < Formula
  desc "AI-driven mobile testing framework for iOS and Android"
  homepage "https://github.com/ArjangConsulting/amoo-ai"
  license "MIT"
  version "0.3.0"

  on_macos do
    url "https://github.com/ArjangConsulting/amoo-ai/releases/download/0.3.0/amoo-0.3.0-macos-universal.tar.gz"
    sha256 "3aa3506d6fda743e5751a656ca71e6b5b765a0fddcc481291fbbb05abd60642b"
  end

  on_linux do
    url "https://github.com/ArjangConsulting/amoo-ai/releases/download/0.3.0/amoo-0.3.0-linux-static.tar.gz"
    sha256 "93eba5963abe5370295fcd76bff41a3944913dace19246ba7c9961be8154a3fa"
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
