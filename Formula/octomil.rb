# typed: false
# frozen_string_literal: true

class Octomil < Formula
  desc "On-device ML inference — serve models locally with one command"
  homepage "https://octomil.com"
  version "2.4.0"
  license "MIT"

  on_macos do
    url "https://github.com/octomil/octomil-python/releases/download/v#{version}/octomil-darwin-arm64.tar.gz"
    sha256 "1d263d6444bd47591a35b17b7b527d13273ea623f6c68f82e67ac810dcf0382e"
  end

  on_linux do
    url "https://github.com/octomil/octomil-python/releases/download/v#{version}/octomil-linux-amd64.tar.gz"
    sha256 "aa27f8467ba5ef7799323738863b53b7929e9170cf68119352bb2f551c421078"
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"octomil"
  end

  test do
    assert_match "octomil", shell_output("#{bin}/octomil --version")
  end
end
