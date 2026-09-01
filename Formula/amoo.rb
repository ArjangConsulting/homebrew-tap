class Amoo < Formula
  desc "AI-driven mobile testing framework for iOS and Android"
  homepage "https://github.com/ArjangConsulting/amoo-ai"
  license "MIT"
  version "0.2.0"

  on_macos do
    url "https://github.com/ArjangConsulting/amoo-ai/releases/download/0.2.0/amoo-0.2.0-macos-universal.tar.gz"
    sha256 "fb7bdb5b1e87665d38506f5d5cad175981309a45ac05aba24e49f9f86b8b282b"
  end

  on_linux do
    url "https://github.com/ArjangConsulting/amoo-ai/releases/download/0.2.0/amoo-0.2.0-linux-static.tar.gz"
    sha256 "7bf29bc0581364f91fa7fabaa06ec56a4e43545a2e2e6f3bb028570850f17645"
  end

  def install
    bin.install "amoo"
    prefix.install "CompanionApps"
  end

  test do
    assert_match "Usage: amoo <command> [options]", shell_output("#{bin}/amoo --help")
    assert_match(/\A\d+\.\d+\.\d+/, shell_output("#{bin}/amoo --version"))
    assert_path_exists prefix/"CompanionApps/Android/gradlew"
    assert_path_exists prefix/"CompanionApps/iOS/project.yml" if OS.mac?
  end
end
