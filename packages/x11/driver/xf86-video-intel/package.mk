################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="xf86-video-intel"
PKG_VERSION="028c946"
PKG_REV="1"
PKG_ARCH="x86_64"
PKG_LICENSE="OSS"
PKG_SITE="http://intellinuxgraphics.org/"
PKG_URL="https://cgit.freedesktop.org/xorg/driver/xf86-video-intel/snapshot/$PKG_VERSION.tar.xz"
PKG_SOURCE_DIR="$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain libXcomposite util-macros fontsproto systemd xorg-server"
PKG_SECTION="x11/driver"
PKG_SHORTDESC="xf86-video-intel: The Xorg driver for Intel video chips"
PKG_LONGDESC="The Xorg driver for Intel i810, i815, 830M, 845G, 852GM, 855GM, 865G, 915G, 915GM and 965G video chips."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--disable-backlight \
                           --disable-backlight-helper \
                           --disable-gen4asm \
                           --enable-udev \
                           --disable-tools \
                           --enable-dri \
                           --disable-dri1 \
                           --enable-dri2 \
                           --enable-dri3 \
                           --enable-kms --enable-kms-only \
                           --disable-ums --disable-ums-only \
                           --enable-sna \
                           --enable-uxa \
                           --disable-xvmc \
                           --disable-xaa \
                           --disable-dga \
                           --disable-tear-free \
                           --disable-create2 \
                           --disable-async-swap \
                           --with-default-dri=2 \
                           --with-xorg-module-dir=$XORG_PATH_MODULES"

pre_configure_target() {
# xf86-video-intel is broken enough. dont link with LTO
  strip_lto
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/share/polkit-1
}
