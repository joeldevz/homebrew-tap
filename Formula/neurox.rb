class Neurox < Formula
  desc "Persistent memory for AI coding agents — brain-inspired, local-first"
  homepage "https://github.com/joeldevz/neurox"
  version "0.5.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/joeldevz/neurox/releases/download/v#{version}/neurox_#{version}_darwin_arm64.tar.gz"
      sha256 "15bc8d9b8c7946c7e6d890c1973edf0f3fcf5e6a3c5262ab0d963d47dbc7be5b"
    else
      url "https://github.com/joeldevz/neurox/releases/download/v#{version}/neurox_#{version}_darwin_amd64.tar.gz"
      sha256 "43a4e44350efe15d80760eaf4c15c3f3af4249c510d8eb9076800d1ba9d7a234"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/joeldevz/neurox/releases/download/v#{version}/neurox_#{version}_linux_arm64.tar.gz"
      sha256 "d88f8a8f756861bf37b6bce2e085ed9e7dfea0a7e6f11f6beafe51769be3cacd"
    else
      url "https://github.com/joeldevz/neurox/releases/download/v#{version}/neurox_#{version}_linux_amd64.tar.gz"
      sha256 "1094ebae031a90fc764d48c82766ba474ddc43e43e59e2f9dcbfe2b62e8b6cb8"
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
