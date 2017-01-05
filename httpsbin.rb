class Httpsbin < Formula
  desc "Run a requestbin alternative httpsbin on your localhost"
  homepage "https://github.com/sairam/httpsbin"
  url "https://github.com/sairam/httpsbin/releases/download/0.1/httpsbin_Darwin_x86_64.tar.gz"
  sha256 "2425f3d23d23700d94481bc90c8024e80299f714934ef3b5698ff73bb27122df"
  head "https://github.com/sairam/httpsbin.git"
  version "0.1"

  def install
    (libexec/"bin").install "httpsbin"
    etc.install "config.toml", "httpsbin"

    datadir.mkpath
    datadir.install "tmpl"

    (bin/"httpsbin").write <<-EOS.undent
    #!/bin/bash
    cd "#{datadir}"
    exec "#{libexec/"bin/httpsbin"}" "#{etc/"httpsbin"}
    EOS
  end

  def datadir
    var/"httpsbin"
  end

end
