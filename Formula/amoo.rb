class Amoo < Formula
  desc "AI-driven mobile testing framework for iOS and Android"
  homepage "https://github.com/ArjangConsulting/amoo-ai"
  license "MIT"
  version "0.1.0"

  on_macos do
    url "https://github.com/ArjangConsulting/amoo-ai/releases/download/0.1.0/amoo-0.1.0-macos-universal.tar.gz"
    sha256 "f4bff683e237897d08708d7b76fb27d08b69fa051a63966715df59cf3151285a"
  end

  on_linux do
    url "https://github.com/ArjangConsulting/amoo-ai/releases/download/0.1.0/amoo-0.1.0-linux-static.tar.gz"
    sha256 "899453987f3831fbce774d75c2655b6830bc7c2b559a2edce1220654704b368f"
  end

  def install
    bin.install "amoo"
  end

  test do
    assert_match "Usage: amoo <command> [options]", shell_output("#{bin}/amoo --help")
    assert_match(/\A\d+\.\d+\.\d+/, shell_output("#{bin}/amoo --version"))
  end
end
