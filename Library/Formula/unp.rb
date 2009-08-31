require 'brewkit'

class Unp <Formula
  @url='http://ftp.de.debian.org/debian/pool/main/u/unp/unp_1.0.11.tar.gz'
  @homepage='http://packages.debian.org/de/etch/unp'
  @md5='ecea662bd7e7efe7f7e2213bf21d9646'

 def deps
   BinaryDep.new 'p7zip'
 end

  def install
    system "mkdir -p #{prefix}/bin"
    system "cp unp #{prefix}/bin"
    system "cp ucat #{prefix}/bin"
    
    system "mkdir -p #{prefix}/share/man/man1"
    system "cp debian/unp.1 #{prefix}/share/man/man1"
    
    system "mkdir -p #{prefix}/share/doc/unp"
    system "cp debian/README.Debian #{prefix}/share/doc/unp"
    system "cp debian/copyright #{prefix}/share/doc/unp"
    system "cp debian/changelog #{prefix}/share/doc/unp"
  end
end
