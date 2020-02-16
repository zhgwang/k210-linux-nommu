################################################################################
#
# libvncserver
#
################################################################################

LIBVNCSERVER_VERSION = 0.9.12
LIBVNCSERVER_SOURCE = LibVNCServer-$(LIBVNCSERVER_VERSION).tar.gz
LIBVNCSERVER_SITE = https://github.com/LibVNC/libvncserver/archive
LIBVNCSERVER_LICENSE = GPL-2.0+
LIBVNCSERVER_LICENSE_FILES = COPYING
LIBVNCSERVER_INSTALL_STAGING = YES
LIBVNCSERVER_DEPENDENCIES = host-pkgconf lzo
LIBVNCSERVER_CONF_OPTS = -DWITH_LZO=ON

# only used for examples
LIBVNCSERVER_CONF_OPTS += \
	-DWITH_FFMPEG=OFF \
	-DWITH_SDL=OFF

ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
LIBVNCSERVER_CONF_OPTS += -DWITH_THREADS=ON
else
LIBVNCSERVER_CONF_OPTS += -DWITH_THREADS=OFF
endif

# openssl supports needs NPTL thread support
ifeq ($(BR2_PACKAGE_OPENSSL)$(BR2_TOOLCHAIN_HAS_THREADS_NPTL),yy)
LIBVNCSERVER_CONF_OPTS += -DWITH_OPENSSL=ON
LIBVNCSERVER_DEPENDENCIES += openssl
else
LIBVNCSERVER_CONF_OPTS += -DWITH_OPENSSL=OFF
endif

ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
LIBVNCSERVER_CONF_OPTS += -DWITH_GCRYPT=ON
LIBVNCSERVER_DEPENDENCIES += libgcrypt
else
LIBVNCSERVER_CONF_OPTS += -DWITH_GCRYPT=OFF
endif

ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
LIBVNCSERVER_CONF_OPTS += -DWITH_GNUTLS=ON
LIBVNCSERVER_DEPENDENCIES += gnutls
else
LIBVNCSERVER_CONF_OPTS += -DWITH_GNUTLS=OFF
endif

ifeq ($(BR2_PACKAGE_JPEG),y)
LIBVNCSERVER_CONF_OPTS += -DWITH_JPEG=ON
LIBVNCSERVER_DEPENDENCIES += jpeg
else
LIBVNCSERVER_CONF_OPTS += -DWITH_JPEG=OFF
endif

ifeq ($(BR2_PACKAGE_LIBPNG),y)
LIBVNCSERVER_CONF_OPTS += -DWITH_PNG=ON
LIBVNCSERVER_DEPENDENCIES += libpng
else
LIBVNCSERVER_CONF_OPTS += -DWITH_PNG=OFF
endif

ifeq ($(BR2_PACKAGE_SYSTEMD),y)
LIBVNCSERVER_CONF_OPTS += -DWITH_SYSTEMD=ON
LIBVNCSERVER_DEPENDENCIES += systemd
else
LIBVNCSERVER_CONF_OPTS += -DWITH_SYSTEMD=OFF
endif

ifeq ($(BR2_PACKAGE_ZLIB),y)
LIBVNCSERVER_CONF_OPTS += -DWITH_ZLIB=ON
LIBVNCSERVER_DEPENDENCIES += zlib
else
LIBVNCSERVER_CONF_OPTS += -DWITH_ZLIB=OFF
endif

$(eval $(cmake-package))
