################################################################################
#
# kodi-inputstream-rtmp
#
################################################################################

KODI_INPUTSTREAM_RTMP_VERSION = 2.0.6-Leia
KODI_INPUTSTREAM_RTMP_SITE = $(call github,xbmc,inputstream.rtmp,$(KODI_INPUTSTREAM_RTMP_VERSION))
KODI_INPUTSTREAM_RTMP_LICENSE = GPL-2.0+
KODI_INPUTSTREAM_RTMP_LICENSE_FILES = src/RTMPStream.cpp
KODI_INPUTSTREAM_RTMP_DEPENDENCIES = kodi rtmpdump

$(eval $(cmake-package))
