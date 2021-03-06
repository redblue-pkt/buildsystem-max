#
# libjpeg-turbo
#
LIBJPEG_TURBO_VER    = 2.0.6
LIBJPEG_TURBO_DIR    = libjpeg-turbo-$(LIBJPEG_TURBO_VER)
LIBJPEG_TURBO_SOURCE = libjpeg-turbo-$(LIBJPEG_TURBO_VER).tar.gz
LIBJPEG_TURBO_SITE   = https://sourceforge.net/projects/libjpeg-turbo/files/$(LIBJPEG_TURBO_VER)
LIBJPEG_TURBO_DEPS   = bootstrap

LIBJPEG_TURBO_CONF_OPTS = \
	-DWITH_SIMD=False \
	-DWITH_JPEG8=80 \
	| tail -n +90

$(D)/libjpeg-turbo:
	$(START_BUILD)
	$(PKG_REMOVE)
	$(call PKG_DOWNLOAD,$(PKG_SOURCE))
	$(call PKG_UNPACK,$(BUILD_DIR))
	$(PKG_APPLY_PATCHES)
	$(PKG_CHDIR); \
		$(CMAKE); \
		$(MAKE); \
		$(MAKE) install DESTDIR=$(TARGET_DIR)
	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtran rdjpgcom tjbench wrjpgcom)
	$(PKG_REMOVE)
	$(TOUCH)
