class Hopdrop < Formula
  desc "Send files from your Mac to your Android phone over WiFi, one command"
  homepage "https://github.com/radenmahar/hopdrop"
  url "https://github.com/radenmahar/hopdrop.git",
      tag:      "v0.2.0",
      revision: "b0ba1d4c9a65a73f39686a2f17bf455a96d8c00f"
  license "MIT"

  depends_on "node"

  def install
    bin.install "hopdrop"
  end

  def caveats
    <<~EOS
      hopdrop converts Markdown to PDF via md-to-pdf (npm), not bundled here.
      Install it with:
        npm install -g md-to-pdf

      Without it, hopdrop still works for any file using --raw.

      Run 'hopdrop config' to generate your ntfy topic and pair your phone.
    EOS
  end

  test do
    assert_match "hopdrop", shell_output("#{bin}/hopdrop --version")
  end
end
