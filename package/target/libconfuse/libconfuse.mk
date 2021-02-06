#
# libconfuse
#
LIBCONFUSE_VER    = 3.3
LIBCONFUSE_DIR    = confuse-$(LIBCONFUSE_VER)
LIBCONFUSE_SOURCE = confuse-$(LIBCONFUSE_VER).tar.xz
LIBCONFUSE_SITE   = https://github.com/libconfuse/libconfuse/releases/download/v$(LIBCONFUSE_VER)/
LIBCONFUSE_DEPS   = bootstrap

$(D)/libconfuse:
	$(START_BUILD)
	$(PKG_REMOVE)
	$(call PKG_DOWNLOAD,$(PKG_SOURCE))
	$(call PKG_UNPACK,$(BUILD_DIR))
	$(PKG_APPLY_PATCHES)
	$(PKG_CHDIR); \
		autoreconf -fi; \
		$(CONFIGURE); \
		$(MAKE); \
		$(MAKE) install DESTDIR=$(TARGET_DIR)
	$(REWRITE_LIBTOOL_LA)
	$(PKG_REMOVE)
	$(TOUCH)
