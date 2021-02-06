#
# libftdi
#
LIBFTDI_VER    = 1.5
LIBFTDI_DIR    = libftdi1-$(LIBFTDI_VER)
LIBFTDI_SOURCE = libftdi1-$(LIBFTDI_VER).tar.bz2
LIBFTDI_SITE   = http://www.intra2net.com/en/developer/libftdi/download/
LIBFTDI_DEPS   = bootstrap libusb libconfuse

LIBFTDI_CONF_OPTS = \
	-DSTATICLIBS=ON \
	-DDOCUMENTATION=FALSE \
	-DEXAMPLES=FALSE \
	-DFTDIPP=FALSE \
	-DPYTHON_BINDINGS=FALSE

$(D)/libftdi:
	$(START_BUILD)
	$(PKG_REMOVE)
	$(call PKG_DOWNLOAD,$(PKG_SOURCE))
	$(call PKG_UNPACK,$(BUILD_DIR))
	$(PKG_APPLY_PATCHES)
	$(PKG_CHDIR); \
		$(CMAKE); \
		$(MAKE); \
		$(MAKE) install DESTDIR=$(TARGET_DIR)
	cd $(TARGET_DIR) && rm -rf usr/lib/cmake
	$(PKG_REMOVE)
	$(TOUCH)
