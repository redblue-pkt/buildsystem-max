#
# lirc
#
LIRC_VER    = 0.10.1
LIRC_DIR    = lirc-$(LIRC_VER)
LIRC_SOURCE = lirc-$(LIRC_VER).tar.bz2
LIRC_SITE   = https://sourceforge.net/projects/lirc/files/LIRC/$(LIRC_VER)
LIRC_DEPS   = bootstrap kernel libftdi libusb-compat libxslt alsa-lib

LIRC_CONF_OPTS = \
	--enable-devinput \
	--enable-uinput \
	--with-gnu-ld \
	--without-x

LIRC_MAKE_FLAGS = \
	DEVINPUT_HEADER=$(LINUX_DIR)/include

$(D)/lirc:
	$(START_BUILD)
	$(PKG_REMOVE)
	$(call PKG_DOWNLOAD,$(PKG_SOURCE))
	$(call PKG_UNPACK,$(BUILD_DIR))
	$(PKG_APPLY_PATCHES)
	$(PKG_CHDIR); \
		export XSLTPROC=yes; \
		export HAVE_WORKING_POLL=yes; \
		export DEVINPUT_HEADER=$(LINUX_DIR)/include/linux/input.h; \
		export PYTHON=:; \
		autoreconf -vfi; \
		$(CONFIGURE); \
		$(MAKE); \
		$(MAKE) install DESTDIR=$(TARGET_DIR)
		$(INSTALL_DATA) $(PKG_FILES_DIR)/lirc_options.conf $(TARGET_DIR)/etc/lirc.conf
	$(PKG_REMOVE)
	$(TOUCH)

