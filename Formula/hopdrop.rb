class Hopdrop < Formula
  desc "Send files from your Mac to your Android phone over WiFi, one command"
  homepage "https://github.com/radenmahar/hopdrop"
  url "https://github.com/radenmahar/hopdrop.git",
      tag:      "v0.4.0",
      revision: "e4c40d3597f89ded5e3acf97dce70a7f15bf64e8"
  license "MIT"

  depends_on "node"

  def install
    bin.install "hopdrop"
  end

  def caveats
    <<~EOS
      hopdrop converts Markdown to PDF via md-to-pdf (npm), not bundled here.
      Install it without the ~1GB bundled Chromium (hopdrop reuses an
      already-installed Chrome/Brave/Edge instead):
        PUPPETEER_SKIP_DOWNLOAD=true npm install -g md-to-pdf

      Without md-to-pdf, or without Chrome/Brave/Edge installed, hopdrop
      still works for any file using --raw.

      Run 'hopdrop config' to generate your ntfy topic and pair your phone.
    EOS
  end

  test do
    assert_match "hopdrop", shell_output("#{bin}/hopdrop --version")
  end
end
