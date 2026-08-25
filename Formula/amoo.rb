class Amoo < Formula
  desc "AI-driven mobile testing framework for iOS and Android"
  homepage "https://github.com/ArjangConsulting/amoo-ai"
  license "MIT"
  version "0.1.0"

  on_macos do
    url "https://github.com/ArjangConsulting/amoo-ai/releases/download/0.1.0/amoo-0.1.0-macos-universal.tar.gz"
    sha256 "d922c62200cd8b587dbed0e951b6a47fc41045b95b9074a875f05628f5d58c45"
  end

  on_linux do
    url "https://github.com/ArjangConsulting/amoo-ai/releases/download/0.1.0/amoo-0.1.0-linux-static.tar.gz"
    sha256 "16151db2b8e266e5da6395e1a3a272d930f58ea746b0be306a3942a24e6f6a16"
  end

  def install
    bin.install "amoo"
  end

  test do
    assert_match "Usage: amoo <command> [options]", shell_output("#{bin}/amoo --help")
    assert_match(/\A\d+\.\d+\.\d+/, shell_output("#{bin}/amoo --version"))
  end
end
