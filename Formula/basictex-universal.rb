class BasictexUniversal < Formula
  desc "Compact TeX distribution as alternative to the full TeX Live / MacTeX"
  homepage "https://www.tug.org/mactex/aboutarm.html"
  url "https://www.tug.org/mactex/BasicTeX-2020-Universal.pkg"
  sha256 "3b6080e94b7a8e3fa07e55e844e74afa6650ced0a27ce90b2d87855f23750b82"



  args1 = %W[
    --expand
    BasicTeX-2020-Universal.pkg
    ./tmp/
  ]

  def install
    system "pkgutil", "--expand", "BasicTeX-2020-Universal.pkg", "./tmp/"
    system "pax", "-rz", "-f", "./tmp/BasicTeX-2020-Universal-Start.pkg/Payload"
    system "mv", "./usr/local/texlive/", "~/.local/"
  end

  def caveats
    <<~EOS
      TexLive Universal Binary has been installed.
      Path: $HOME/.local/texlive/2020basic/bin/custom/

      To enable this path, please export.
    EOS
  end

  test do
    system "false"
  end
end
