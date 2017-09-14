require 'formula'

class Csound < Formula
  homepage 'http://csound.github.io'
  url 'https://github.com/csound/csound/archive/6.09.1.tar.gz'
  sha256 'e4d2e9870d3b29305c9bc404dc93806e61420a57fc4bc69577676b4934c71777'
  head 'https://github.com/csound/csound.git', :branch => 'develop'
  version '6.09.1'

  depends_on 'cmake' => :build
  depends_on 'swig' => :build

  depends_on 'libsndfile'

  depends_on 'portaudio' => :recommended
  depends_on 'portmidi' => :recommended
  depends_on 'liblo' => :recommended
  depends_on 'boost' => :recommended
  depends_on 'libpng' => :recommended
  depends_on 'stk' => :optional
  depends_on 'fltk' => :optional
  depends_on 'eigen' => :recommended

  option :universal

  def install
    framework = "#{prefix}/Framework"
    inreplace "CMakeLists.txt", "~/Library/Frameworks", framework
    stk = (build.with? "stk") ? 1 : 0
    system "cmake", ".", "-DUSE_GETTEXT=0", "-DBUILD_STK_OPCODES=#{stk}", "-DCMAKE_MACOSX_RPATH=ON", "-DCMAKE_INSTALL_RPATH=#{framework}", *std_cmake_args
    system "make", "install"
  end

  test do
    system "csound"
  end
end
