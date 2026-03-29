class Neurox < Formula
  desc "Persistent memory for AI coding agents — brain-inspired, local-first"
  homepage "https://github.com/joeldevz/neurox"
  version "0.5.1"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/joeldevz/neurox/releases/download/v0.5.1/neurox_0.5.1_darwin_arm64.tar.gz"
      sha256 "d2c97130a1e045f0adbfd55618cc8c26fa415ed82fc7040e3ad74a30166011f9"
    else
      url "https://github.com/joeldevz/neurox/releases/download/v0.5.1/neurox_0.5.1_darwin_amd64.tar.gz"
      sha256 "4b557a46503c20a680093c92b92f44e17ef2c09bacf41f8e0ba84b5e9cd6dbdf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/joeldevz/neurox/releases/download/v0.5.1/neurox_0.5.1_linux_arm64.tar.gz"
      sha256 "24fccf98bb51e8e708415dabbcf9ce4e1c9b43a72c9a21da9076a42f58eec7b9"
    else
      url "https://github.com/joeldevz/neurox/releases/download/v0.5.1/neurox_0.5.1_linux_amd64.tar.gz"
      sha256 "2e240fa01a71d984536165b4fee0af940bbfcf5de6f6980edcab0f1cbf1e2ea8"
    end
  end

  def install
    binary = Dir["neurox_*"].first
    if binary
      bin.install binary => "neurox"
    else
      bin.install "neurox"
    end
  end

  test do
    assert_match "neurox v#{version}", shell_output("#{bin}/neurox version")
  end
end
