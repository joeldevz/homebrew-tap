class Neurox < Formula
  desc "Persistent memory for AI coding agents — brain-inspired, local-first"
  homepage "https://github.com/joeldevz/neurox"
  version "0.5.4"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/joeldevz/neurox/releases/download/v0.5.4/neurox_0.5.4_darwin_arm64.tar.gz"
      sha256 "762824e13a0c2b2ba3867b13c65823a3fcf8a5b89017a4dd87519bb87bd3ab20"
    else
      url "https://github.com/joeldevz/neurox/releases/download/v0.5.4/neurox_0.5.4_darwin_amd64.tar.gz"
      sha256 "1aeca388c5621c8135f56941acd853e90aae3ad985038b5e57915fc0a4c9d7fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/joeldevz/neurox/releases/download/v0.5.4/neurox_0.5.4_linux_arm64.tar.gz"
      sha256 "cbea7be4cd3efaec5a4b214bd6a4d0a821b5459bb0fa804aac8660cf4afe06c8"
    else
      url "https://github.com/joeldevz/neurox/releases/download/v0.5.4/neurox_0.5.4_linux_amd64.tar.gz"
      sha256 "67e7a77dafd72a3e6d47310da172da7995673f0ff61156165e9dfd9d37e6ef4d"
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
