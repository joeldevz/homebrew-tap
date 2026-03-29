class Neurox < Formula
  desc "Persistent memory for AI coding agents — brain-inspired, local-first"
  homepage "https://github.com/joeldevz/neurox"
  version "0.5.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/joeldevz/neurox/releases/download/v0.5.0/neurox_0.5.0_darwin_arm64.tar.gz"
      sha256 "0d3522ddd603e1817969f805d59c3d6130fc411ed3c748047a3fb0d204a719bb"
    else
      url "https://github.com/joeldevz/neurox/releases/download/v0.5.0/neurox_0.5.0_darwin_amd64.tar.gz"
      sha256 "fe57f795e2d959ee82cbb5a89ac226e1dad46278717d3dee2eb3cd3c52772749"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/joeldevz/neurox/releases/download/v0.5.0/neurox_0.5.0_linux_arm64.tar.gz"
      sha256 "024d4c507e9fd54438897aae0719d9705677437c188760ddee886cbf434b19b1"
    else
      url "https://github.com/joeldevz/neurox/releases/download/v0.5.0/neurox_0.5.0_linux_amd64.tar.gz"
      sha256 "f8b35b5feb162806e8c6e7434f5db52dac7a04fc9744b634aa13e46d8fe4f3a7"
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
