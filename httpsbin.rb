class Httpsbin < Formula
  desc "Run a requestbin alternative httpsbin on your localhost"
  homepage "https://github.com/sairam/httpsbin"
  url "https://github.com/sairam/httpsbin/releases/download/0.2/httpsbin_Darwin_x86_64.tar.gz"
  sha256 "93114492380df280db8d1e7f4092029d4abf38f3259e3a5088d3c2e3df5cc20d"
  head "https://github.com/sairam/httpsbin.git"
  version "0.2"

  def install
    (libexec/"bin").install "httpsbin"
    etc.install ({"config.toml"=> "httpsbin"})

    datadir.mkpath unless datadir.exist?
    rm_rf datadir/"tmpl"
    datadir.install "tmpl"

    rm_rf datadir/"static"
    datadir.install "static"

    (bin/"httpsbin").write <<-EOS.undent
    #!/bin/bash
    cd "#{datadir}"
    exec "#{libexec/"bin/httpsbin"}" #{etc/"httpsbin"}
    EOS
  end

  def datadir
    var/"httpsbin"
  end

end
