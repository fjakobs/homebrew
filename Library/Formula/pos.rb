require 'formula'

class Pos <Formula
  @url='http://www.finkproject.org/bindist/dists/fink-0.9.0/main/source/utils/pos-1.2.tgz'
  @md5='c667fb4ca38c96494f888ade9fb4e40a'

  def cdf_script
    return <<-END
#!/bin/bash
cd "$(posd)"
END
  end
    
  def install
    bin.install %w[bin/fdc bin/posd]
    (bin+'cdf').write cdf_script
    
    doc.install "README.txt"
    share.install %w[Finder_Toolbar_Applications.dmg.gz iTerm.webloc]
  end
end
