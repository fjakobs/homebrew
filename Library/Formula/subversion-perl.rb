require 'formula'
require Formula.path('subversion')

class SubversionPerl <Subversion
  url Subversion.url
  homepage Subversion.homepage
  md5 Subversion.md5
  
  # Only need this on Snow Leopard; for Leopard the deps package 
  # builds it.
  if MACOS_VERSION >= 10.6
    depends_on 'neon'
  end
  
  def install
    setup_leopard if MACOS_VERSION < 10.6    
    ENV["CFLAGS"] = nil
    
    # Use existing system zlib
    # Use dep-provided other libraries
    # Don't mess with Apache modules (since we're not sudo)
    system "./configure", "--disable-debug",
                          "--prefix=#{prefix}",
                          "--with-ssl",
                          "--with-zlib=/usr/lib",
                          # use our neon, not OS X's 
                          "--disable-neon-version-check",
                          "--disable-mod-activation",
                          "--without-apache-libexecdir",
                          "--without-berkeley-db"                      

    system "make swig-pl"
    system "make install-swig-pl-lib"
  end
end
