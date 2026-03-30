class Neurox < Formula
  desc "Persistent memory for AI coding agents — brain-inspired, local-first"
  homepage "https://github.com/joeldevz/neurox"
  version "0.5.3"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/joeldevz/neurox/releases/download/v0.5.3/neurox_0.5.3_darwin_arm64.tar.gz"
      sha256 "dee08378135935e6ad220fb30d9e2720f98d04fb697ebb57d937d35a18fd2c25"
    else
      url "https://github.com/joeldevz/neurox/releases/download/v0.5.3/neurox_0.5.3_darwin_amd64.tar.gz"
      sha256 "c483490b810c3f79e0906ac7721170801fe2e47c057c40dbf0d500bcf3ccfd33"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/joeldevz/neurox/releases/download/v0.5.3/neurox_0.5.3_linux_arm64.tar.gz"
      sha256 "2ce0b37c7bd8ea54ca243a2de1ef8c83c73be5ea6e2740623adcd9d08638e673"
    else
      url "https://github.com/joeldevz/neurox/releases/download/v0.5.3/neurox_0.5.3_linux_amd64.tar.gz"
      sha256 "2b1a61cbf1f0deb7796edb82241ccf6b301c6edb4c92cb575fb0e5a060608316"
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
