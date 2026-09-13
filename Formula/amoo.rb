class Amoo < Formula
  desc "AI-driven mobile testing framework for iOS and Android"
  homepage "https://github.com/ArjangConsulting/amoo-ai"
  license "MIT"
  version "0.2.1"

  on_macos do
    url "https://github.com/ArjangConsulting/amoo-ai/releases/download/#{version}/amoo-#{version}-macos-universal.tar.gz"
    sha256 "30cb8b26e6bdb11ec15ff87c4fb3669d415541737b4ef79413920374cf950a12"
  end

  on_linux do
    url "https://github.com/ArjangConsulting/amoo-ai/releases/download/#{version}/amoo-#{version}-linux-static.tar.gz"
    sha256 "18b5d77efd1836062889e8172143e6b43f7655d7cb77900e96d92689c2ac29f0"
  end

  def install
    bin.install "amoo"
    prefix.install "CompanionApps"
    (share/"amoo").install "scripts/install-mcp.sh"
  end

  test do
    assert_match "Usage: amoo <command> [options]", shell_output("#{bin}/amoo --help")
    assert_match(/\A\d+\.\d+\.\d+/, shell_output("#{bin}/amoo --version"))
    assert_path_exists share/"amoo/install-mcp.sh"
    assert_path_exists prefix/"CompanionApps/Android/gradlew"
    assert_path_exists prefix/"CompanionApps/iOS/project.yml" if OS.mac?
  end
end
