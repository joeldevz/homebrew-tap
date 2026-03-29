class Neurox < Formula
  desc "Persistent memory for AI coding agents — brain-inspired, local-first"
  homepage "https://github.com/joeldevz/neurox"
  version "0.5.2"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/joeldevz/neurox/releases/download/v0.5.2/neurox_0.5.2_darwin_arm64.tar.gz"
      sha256 "ba9798edef5eed408e0ea7e97810f1c5ef02210e476d1020bbd4359c93406bef"
    else
      url "https://github.com/joeldevz/neurox/releases/download/v0.5.2/neurox_0.5.2_darwin_amd64.tar.gz"
      sha256 "568de635e21f3df3c5f502e8f270018dd7ffcf6e5ae00b1e81b1fe2201e91fc4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/joeldevz/neurox/releases/download/v0.5.2/neurox_0.5.2_linux_arm64.tar.gz"
      sha256 "0ad2d67c37082b67e2ad6fcb4a7cd815aa75b1887fe3ad8b5b6f76ec495ee452"
    else
      url "https://github.com/joeldevz/neurox/releases/download/v0.5.2/neurox_0.5.2_linux_amd64.tar.gz"
      sha256 "d0fe0aa1306e87d32c881c937ea8ebb2efd171307c36ccd4867f2df8809a4922"
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
