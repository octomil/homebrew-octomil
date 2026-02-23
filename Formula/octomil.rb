# typed: false
# frozen_string_literal: true

class Octomil < Formula
  desc "On-device ML inference — serve models locally with one command"
  homepage "https://octomil.com"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/octomil/octomil-python/releases/download/v#{version}/octomil-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/octomil/octomil-python/releases/download/v#{version}/octomil-darwin-amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/octomil/octomil-python/releases/download/v#{version}/octomil-linux-arm64.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/octomil/octomil-python/releases/download/v#{version}/octomil-linux-amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "octomil"
    # Install bundled libraries alongside the binary
    libexec.install Dir["*"] - ["octomil"]
    # Rewrite the bin symlink to point into libexec
    bin.install_symlink libexec/"octomil"
  end

  test do
    assert_match "octomil", shell_output("#{bin}/octomil --version")
  end
end
