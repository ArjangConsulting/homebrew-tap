class Amoo < Formula
  desc "AI-driven mobile testing framework for iOS and Android"
  homepage "https://github.com/ArjangConsulting/amoo-ai"
  license "MIT"

  head "https://github.com/ArjangConsulting/amoo-ai.git", branch: "main"

  stable do
    on_macos do
      url "https://github.com/ArjangConsulting/amoo-ai/releases/download/PLACEHOLDER/amoo-PLACEHOLDER-macos-universal.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000"
    end

    on_linux do
      url "https://github.com/ArjangConsulting/amoo-ai/releases/download/PLACEHOLDER/amoo-PLACEHOLDER-linux-static.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "amoo"
  end

  test do
    assert_match "Usage: amoo <command> [options]", shell_output("#{bin}/amoo --help")
    assert_match(/\A\d+\.\d+\.\d+/, shell_output("#{bin}/amoo --version"))
  end
end
