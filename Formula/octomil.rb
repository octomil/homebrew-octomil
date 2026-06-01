# typed: false
# frozen_string_literal: true

class Octomil < Formula
  desc "On-device ML inference — serve models locally with one command"
  homepage "https://octomil.com"
  version "4.17.26"
  license "MIT"

  on_macos do
    url "https://github.com/octomil/octomil-python/releases/download/v#{version}/octomil-darwin-arm64.tar.gz"
    sha256 "28996d181990502b5c65652ede8c3255755cd9524cdd07bd3a10c36d155d6cd2"
  end

  on_linux do
    url "https://github.com/octomil/octomil-python/releases/download/v#{version}/octomil-linux-amd64.tar.gz"
    sha256 "345c249d67846bdadc76a27eb8692179f1b6a6c36dc3b796b667ae34e9e10987"
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"octomil"
  end

  test do
    assert_match "octomil", shell_output("#{bin}/octomil --version")
  end
end
