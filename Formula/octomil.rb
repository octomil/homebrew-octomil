# typed: false
# frozen_string_literal: true

class Octomil < Formula
  desc "On-device ML inference — serve models locally with one command"
  homepage "https://octomil.com"
  version "4.17.23"
  license "MIT"

  on_macos do
    url "https://github.com/octomil/octomil-python/releases/download/v#{version}/octomil-darwin-arm64.tar.gz"
    sha256 "237224f9ac3633280644f24d667360404dc5bb3578a377bdcc9042ebeb65c32f"
  end

  on_linux do
    url "https://github.com/octomil/octomil-python/releases/download/v#{version}/octomil-linux-amd64.tar.gz"
    sha256 "f24db4e35fe2d2cb51d33e1575753255a00220632c718d0b224e4f2c03713866"
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"octomil"
  end

  test do
    assert_match "octomil", shell_output("#{bin}/octomil --version")
  end
end
