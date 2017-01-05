class Httpsbin < Formula
  desc "TODO"
  homepage "https://github.com/sairam/httpsbin"
  url "https://github.com/sairam/httpsbin/releases/download/0.1/httpsbin_#{%x(uname -s).gsub(/\n/, '')}_#{%x(uname -m).gsub(/\n/, '')}.tar.gz"
  head "https://github.com/sairam/httpsbin.git"
  version "0.1"

  def install
    bin.install "httpsbin"
  end
end
