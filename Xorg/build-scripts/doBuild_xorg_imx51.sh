#!/bin/bash

set -eE

ALWAYS_CONFIGURE=no

PKG_DIR=`realpath ../pkgs`
export PREFIX=/opt/freescale/ltib/rootfs

BUILD_PKGS="bigreqsproto-1.1.0 compositeproto-0.4.1 damageproto-1.2.0 dmxproto-2.3 dri2proto-2.1 fixesproto-4.1.1 glproto-1.4.10 inputproto-2.0 kbproto-1.0.4 randrproto-1.3.1 recordproto-1.14 renderproto-0.11 resourceproto-1.1.0 scrnsaverproto-1.2.0 xineramaproto-1.2 videoproto-2.3.0 windowswmproto-1.0.4 xcmiscproto-1.2.0 xextproto-7.1.1 xf86bigfontproto-1.2.0 xf86dgaproto-2.1 xf86driproto-2.1.0 xf86vidmodeproto-2.3 xproto-7.0.16 fontsproto-2.1.0 libpthread-stubs-0.3 xcb-proto-1.6 libfontenc-1.0.5 libpciaccess-0.10.9 libXau-1.0.5 libxcb-1.7 xtrans-1.2.5 libICE-1.0.6 libSM-1.1.1 libX11-1.3.2 libXt-1.0.7 libXext-1.1.1 libXi-1.3 xinput-1.5.0 libXtst-1.1.0 libXpm-3.5.8 libXmu-1.0.5 libXaw-1.0.7 libXfixes-4.0.4 libXcomposite-0.4.1 libXrender-0.9.5 libXcursor-1.1.10 libXdamage-1.1.2 libXdmcp-1.0.3 libXfont-1.4.1 libXft-2.1.14 libXinerama-1.1 libxkbfile-1.0.6 libXrandr-1.3.0 libXres-1.0.4 libXScrnSaver-1.2.0 libXv-1.0.5 libXvMC-1.0.5 libXxf86dga-1.1.1 libXxf86vm-1.1.0 luit-1.0.4 libdmx-1.1.0 libFS-1.0.2 xcb-util-0.3.6 makedepend-1.0.2 mkfontdir-1.0.5 mkfontscale-1.0.7 sessreg-1.0.5 setxkbmap-1.1.0 smproxy-1.0.3 util-macros-1.3.0 x11perf-1.5.1 xauth-1.0.4 xbacklight-1.1.1 xbitmaps-1.1.0 xcmsdb-1.0.2 xcursorgen-1.0.3 xcursor-themes-1.0.2 xdpyinfo-1.1.0 xev-1.0.4 pixman-0.22.2 xorg-server-1.7.1 xf86-input-acecad-1.4.0 xf86-input-aiptek-1.3.0 xf86-input-evdev-2.3.0 xf86-input-joystick-1.4.99.2 xf86-input-keyboard-1.4.0 xf86-input-mouse-1.5.0 xf86-input-synaptics-1.2.0 xf86-input-void-1.3.0 xf86-video-dummy-0.3.2 xf86-video-fbdev-0.4.1 xf86-video-vesa-2.2.1 xgamma-1.0.3 xhost-1.0.3 xkbcomp-1.1.1 xkbevd-1.1.0 xkbutils-1.0.2 xkill-1.0.2 xlsatoms-1.0.2 xlsclients-1.0.2 xmodmap-1.0.4 xpr-1.0.3 xprop-1.1.0 xrandr-1.3.2 xrdb-1.0.6 xrefresh-1.0.3 xset-1.1.0 xsetroot-1.0.3 xvinfo-1.1.0 xwd-1.0.3 xwininfo-1.0.5 xwud-1.0.2 bdftopcf-1.0.2 encodings-1.0.3 font-util-1.1.1 font-adobe-100dpi-1.0.1 font-adobe-75dpi-1.0.1 font-adobe-utopia-100dpi-1.0.2 font-adobe-utopia-75dpi-1.0.2 font-adobe-utopia-type1-1.0.2 font-alias-1.0.2 font-arabic-misc-1.0.1 font-bh-100dpi-1.0.1 font-bh-75dpi-1.0.1 font-bh-lucidatypewriter-100dpi-1.0.1 font-bh-lucidatypewriter-75dpi-1.0.1 font-bh-ttf-1.0.1 font-bh-type1-1.0.1 font-bitstream-100dpi-1.0.1 font-bitstream-75dpi-1.0.1 font-bitstream-type1-1.0.1 font-cronyx-cyrillic-1.0.1 font-cursor-misc-1.0.1 font-daewoo-misc-1.0.1 font-dec-misc-1.0.1 font-ibm-type1-1.0.1 font-isas-misc-1.0.1 font-jis-misc-1.0.1 font-micro-misc-1.0.1 font-misc-cyrillic-1.0.1 font-misc-ethiopic-1.0.1 font-misc-meltho-1.0.1 font-misc-misc-1.1.0 font-mutt-misc-1.0.1 xkeyboard-config-2.0 xterm twm-1.0.4"

echo Starting Build...

export PATH=/opt/freescale/usr/local/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin:$PATH
export PKG_CONFIG_PATH="$PREFIX/usr/lib/pkgconfig:$PREFIX/usr/share/pkgconfig"
export ACLOCAL="aclocal -I $PREFIX/usr/share/aclocal"
export BUILD=i686-pc-linux-gnuaout
export HOST=arm-none-linux-gnueabi
export TARGET=arm-none-linux-gnueabi
export CROSS_COMPILE=arm-none-linux-gnueabi-
export CFLAGS="-I$PREFIX/usr/include"
export CPPFLAGS="-I$PREFIX/usr/include"
export LDFLAGS="-L$PREFIX/usr/lib -Wl,--rpath-link=$PREFIX/usr/lib"

# Be sure to use the host's tools
export ac_cv_path_XKBCOMP='/usr/bin/xkbcomp'
export MKFONTSCALE='/usr/bin/mkfontscale'

# Workaround xorg-server asking for the incorrect version of tslib
export TSLIB_CFLAGS=
export TSLIB_LIBS=-lts

export CONFFLAGS="--build=$BUILD --host=$HOST --target=$TARGET AR=\"arm-none-linux-gnueabi-ar\" RANLIB=\"arm-none-linux-gnueabi-ranlib\" STRIP=\"arm-none-linux-gnueabi-strip\" AS=\"arm-none-linux-gnueabi-as\" OBJDUMP=\"arm-none-linux-gnueabi-objdump\" NM=\"arm-none-linux-gnueabi-nm\" --prefix $PREFIX/usr --exec-prefix=$PREFIX/usr --enable-malloc0returnsnull --disable-static --disable-dri2 --with-driver=dri --cache-file=$PWD/configure.cache --with-log-dir=/var/log"

export CONFFLAGS="$CONFFLAGS --without-demos --with-dri-drivers=swrast --disable-glw --with-state-trackers=egl"
export CONFFLAGS="$CONFFLAGS --disable-install-makestrs"
export CONFFLAGS="$CONFFLAGS --enable-kdrive --enable-xfbdev --disable-glx --disable-dri --disable-dri2"
export CONFFLAGS="$CONFFLAGS --disable-gtk"
export CONFFLAGS="$CONFFLAGS --disable-pci-ids"
export CONFFLAGS="$CONFFLAGS --disable-freetype"
export CONFFLAGS="$CONFFLAGS --disable-docs"
export CONFFLAGS="$CONFFLAGS --enable-tslib"

for tool in ADDR2LINE AS CPP GCOV LD NM OBJCOPY OBJDUMP READELF SIZE STRINGS AR SIZE RANLIB STRIP
do
  export $tool=$CROSS_COMPILE`echo $tool | tr '[A-Z]' '[a-z]'`
done

export CPPFILT=$CROSS_COMPILE'c++filt'
export CC=$CROSS_COMPILE'gcc'
export CCLD=$CROSS_COMPILE'ld'
export CXX=$CROSS_COMPILE'g++'

if [ "x$1" != "x" ]
then
  BUILD_PKGS=$1
fi

for pkg in $BUILD_PKGS
do
  if [ ! -d $pkg ]
  then
    gztarball="$PKG_DIR/$pkg.tar.gz"
    bz2tarball="$PKG_DIR/$pkg.tar.bz2"
    if [ -e $bz2tarball ]
    then
      echo Extracting $bz2tarball
      tar jxf $bz2tarball
    else
      echo Extracting $gztarball
      tar zxf $gztarball
    fi
    if [ $pkg == 'xorg-server-1.7.1' ]
    then
      echo Patching xorg-server source
      pushd xorg-server-1.7.1
      patch -p1 < $PKG_DIR/xorg-server-disable-lcd-auto-blank.patch
      popd
    fi
  fi

  echo Building $pkg
  if [ -d $pkg ]
  then
    pushd $pkg
  else
    echo Guessing at package directory of $pkg*
    pushd $pkg*
  fi
  if [ ! -e configure ]
  then
    # No configure provided so call autogen.sh instead
    # as that's the typical behaviour for x.org packages.
    ./autogen.sh $CONFFLAGS
  else
    test $ALWAYS_CONFIGURE != 'no' -o ! -e Makefile && ./configure $CONFFLAGS
  fi
  make
  sudo PATH=$PATH make install
  popd
done

# Finally make a symlink so that $PREFIX on the device points to the correct files
if [ ! -e $PREFIX/$PREFIX ]
then
  sudo mkdir -p $PREFIX/`dirname $PREFIX`
  sudo ln -s / $PREFIX/$PREFIX
fi

# Set up startx
sudo /bin/bash -c "cat > $PREFIX/usr/bin/startx" <<EOF
#!/bin/bash
if [ -z "\$KEYBOARD_DEVICE" ]; then
  KEYBOARD_DEVICE=\`echo /dev/input/by-id/*usb*-event-kbd | cut -d ' ' -f1\`
  if [ ! -e "\$KEYBOARD_DEVICE" ]; then
    KEYBOARD_DEVICE=\`echo /dev/input/by-path/*usb*-event-kbd | cut -d ' ' -f1\`
  fi
fi
if [ -n "\$KEYBOARD_DEVICE" ]; then
  echo using \$KEYBOARD_DEVICE for keyboard input
  KEYBOARD_OPTION="-keybd evdev,,device=\$KEYBOARD_DEVICE,XkbModel=pc105,XkbRules=evdev,XkbLayout=gb,XkbOptions=compose:ralt"
else
  echo No keyboard found, please set KEYBOARD_DEVICE to the correct /dev/input/event device
fi
if [ "\$1" = "-mouse" ]
then
  Xfbdev -wr -ac -mouse mouse,2,device=/dev/input/mice \$KEYBOARD_OPTION &
else
  export TSLIB_TSDEVICE=/dev/input/ts0
  Xfbdev -wr -ac -mouse tslib,,device=/dev/input/ts0 \$KEYBOARD_OPTION &
fi
sleep 3
DISPLAY=:0 xterm&
DISPLAY=:0 twm
killall Xfbdev
EOF

# Set up .twmrc
sudo /bin/bash -c "cat > $PREFIX/root/.twmrc" <<EOF
RandomPlacement
EOF
