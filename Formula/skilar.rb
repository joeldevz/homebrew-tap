# typed: false
# frozen_string_literal: true

class Skilar < Formula
  desc "AI agent skills installer for OpenCode and Claude Code"
  homepage "https://github.com/joeldevz/skilar"
  version "1.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/joeldevz/skilar/releases/download/v1.0.3/skilar_1.0.3_darwin_amd64.tar.gz"
      sha256 "a1b63051dcf729188ac78a9ac3da869f6adbc159eda3b700153c82a926724b52"

      def install
        bin.install "skilar"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/joeldevz/skilar/releases/download/v1.0.3/skilar_1.0.3_darwin_arm64.tar.gz"
      sha256 "74e5978718dd503c8615bc530c0f391d08659b3c757e095359f5bf40d220e6bf"

      def install
        bin.install "skilar"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/joeldevz/skilar/releases/download/v1.0.3/skilar_1.0.3_linux_amd64.tar.gz"
      sha256 "2a9b3cf5be17b94a89ca5efacd06071da0057e717ca3d9189f45d49d772a2787"

      def install
        bin.install "skilar"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/joeldevz/skilar/releases/download/v1.0.3/skilar_1.0.3_linux_arm64.tar.gz"
      sha256 "2c742c0ddf2b5becd6f60e69e35c0794c1951d325c7e39dcbf2c076f7ba95c1b"

      def install
        bin.install "skilar"
      end
    end
  end

  test do
    system "#{bin}/skilar", "--version"
  end
end
