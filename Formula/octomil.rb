# typed: false
# frozen_string_literal: true

class Octomil < Formula
  desc "On-device ML inference — serve models locally with one command"
  homepage "https://octomil.com"
  version "4.17.39"
  license "MIT"

  on_macos do
    url "https://github.com/octomil/octomil-python/releases/download/v#{version}/octomil-darwin-arm64.tar.gz"
    sha256 "a82d8c839f95cb1f1d343bc79b83b87b059f4f69a2c0ffba3649c4788d9b4f87"
  end

  on_linux do
    url "https://github.com/octomil/octomil-python/releases/download/v#{version}/octomil-linux-amd64.tar.gz"
    sha256 "b70c5af15e18fe07575ca58432ccbc0115f892c9b1c8b983490f9284f05774d8"
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"octomil"
  end

  test do
    assert_match "octomil", shell_output("#{bin}/octomil --version")
  end
end
