require 'formula'

class Csound < Formula
  homepage 'http://csound.github.io'
  url 'https://github.com/csound/csound/archive/6.10.0.tar.gz'
  sha256 'a241043521572d00ae3a926611ac52fd6a7e3fe6bafdbe707867aafe32f6d8a3'
  head 'https://github.com/csound/csound.git', :branch => 'develop'
  version '6.10.0'

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
