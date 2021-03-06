require 'package'

class Xinit < Package
  description 'The xinit package contains a usable script to start the xserver.'
  homepage 'https://www.x.org'
  version '1.4.0-1'
  source_url 'https://x.org/pub/individual/app/xinit-1.4.0.tar.bz2'
  source_sha256 '230835eef2f5978a1e1344928168119373f6df1d0a32c09515e545721ee582ef'

  binary_url ({
  })
  binary_sha256 ({
  })

  depends_on 'xclock'
  depends_on 'xterm'
  depends_on 'xauth'
  depends_on 'twm'
  depends_on 'xwayland'

  def self.build
    system "./configure",
           "--prefix=#{CREW_PREFIX}",
           "--libdir=#{CREW_LIB_PREFIX}"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
