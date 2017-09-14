require 'formula'

class Rtmidi < Formula
  homepage 'http://www.music.mcgill.ca/~gary/rtmidi'
  url 'http://www.music.mcgill.ca/~gary/rtmidi/release/rtmidi-3.0.0.tar.gz'
  sha256 '407be2a6ff5671becf5faaf5909b93054aee84c925347cd5234edb096ad2df26'

  def install
    ENV.j1
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    #lib.install %w{ librtmidi.2.0.0.dylib, librtmidi.a, librtmidi.dylib  }
    lib.install Dir['librtmidi*']
    include.install Dir['*.h']
  end

#  test do
#    system "false"
#  end
end
