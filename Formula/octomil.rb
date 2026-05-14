# typed: false
# frozen_string_literal: true

class Octomil < Formula
  desc "On-device ML inference — serve models locally with one command"
  homepage "https://octomil.com"
  version "4.17.11"
  license "MIT"

  on_macos do
    url "https://github.com/octomil/octomil-python/releases/download/v#{version}/octomil-darwin-arm64.tar.gz"
    sha256 "6dc6b07c57467c2b0efeaea7a0c469d0cbf29d13eec958df2e5b1d3c63f5eb8c"
  end

  on_linux do
    url "https://github.com/octomil/octomil-python/releases/download/v#{version}/octomil-linux-amd64.tar.gz"
    sha256 "c45cb44a5cbe0ea0b3c72d217fd39ae25bb129bae6ec0abd30007a2ca89a7c43"
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"octomil"
  end

  test do
    assert_match "octomil", shell_output("#{bin}/octomil --version")
  end
end
