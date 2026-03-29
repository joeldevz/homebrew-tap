class Neurox < Formula
  desc "Persistent memory for AI coding agents — brain-inspired, local-first"
  homepage "https://github.com/joeldevz/neurox"
  version "0.5.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/joeldevz/neurox/releases/download/v#{version}/neurox_#{version}_darwin_arm64.tar.gz"
      # sha256 will be filled after first release
    else
      url "https://github.com/joeldevz/neurox/releases/download/v#{version}/neurox_#{version}_darwin_amd64.tar.gz"
      # sha256 will be filled after first release
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/joeldevz/neurox/releases/download/v#{version}/neurox_#{version}_linux_arm64.tar.gz"
      # sha256 will be filled after first release
    else
      url "https://github.com/joeldevz/neurox/releases/download/v#{version}/neurox_#{version}_linux_amd64.tar.gz"
      # sha256 will be filled after first release
    end
  end

  def install
    # The tarball contains a single binary named neurox_<os>_<arch>
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
