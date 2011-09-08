require 'formula'

class Gccvb < Formula
  url 'http://mirrors-us.seosue.com/gcc/releases/gcc-4.4.2/gcc-core-4.4.2.tar.bz2'
  homepage ''
  md5 'd50ec5af20508974411d0c83c5f4e396'

  # depends_on 'cmake'

  def install
    # GCC will suffer build errors if forced to use a particular linker.
    ENV.delete 'LD'

    system "./configure", "--build=x86_64-apple-darwin", 
                          "--disable-debug",    
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
      
    # system "cmake . #{std_cmake_parameters}"
    system "make"
    system "make install"
  end

  def test
    # this will fail we won't accept that, make it test the program works!
    system "/usr/bin/false"
  end
end
