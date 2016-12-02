#!/bin/bash
# install ImageMagick-7.0.3.8 on centos
echo "start download ImageMagick-7.0.37"
if curl -O https://fossies.org/linux/misc/ImageMagick-7.0.3-8.tar.gz
then
 tar -zxvf ImageMagick-7.0.3-8.tar.gz
 # png jpg 等依赖包
 yum install -y tcl-devel.x86_64 ghostscript-devel.x86_64 bzip2-devel.x86_64 freetype-devel.x86_64 libtiff-devel.x86_64
 yum install -y libjpeg-devel
 yum install -y glib2-devel.x86_64 fontconfig-devel.x86_64 zlib-devel.x86_64 libwmf-devel.x86_64
 yum install -y gcc
 cd ImageMagick-7.0.3-8
 if ./configure --prefix=/usr --with-bzlib=yes --with-fontconfig=yes --with-freetype=yes --with-gslib=yes --with-gvc=yes --with-jpeg=yes --with-jp2=yes --with-png=yes --with-tiff=yes
  then
  make clean
   if make && make install
    then
      ldconfig /usr/ && echo "install complete"&& convert -version && exit 0
   fi
     echo "make && make install erro" && exit 0
 fi
 echo "configure error" && exit 0
fi
echo "download ImageMagick-7.0.3.7 error"


 # if error when make about jpeg
 # curl -o http://www.ijg.org/files/jpegsrc.v9.tar.gz
 #cd jpeg-9
 #./configure
 #make libdir=/usr/lib64
 #make libdir=/usr/lib64 install
