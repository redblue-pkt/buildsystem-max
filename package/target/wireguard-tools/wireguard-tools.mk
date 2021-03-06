#
# wireguard-tools
#
WIREGUARD_TOOLS_VER    = 1.0.20200827
WIREGUARD_TOOLS_DIR    = wireguard-tools-$(WIREGUARD_TOOLS_VER)
WIREGUARD_TOOLS_SOURCE = wireguard-tools-$(WIREGUARD_TOOLS_VER).tar.xz
WIREGUARD_TOOLS_SITE   = https://git.zx2c4.com/wireguard-tools/snapshot
WIREGUARD_TOOLS_DEPS   = bootstrap kernel libmnl openresolv

WIREGUARD_TOOLS_MAKE_OPTS = WITH_SYSTEMDUNITS=no WITH_BASHCOMPLETION=yes WITH_WGQUICK=yes

$(D)/wireguard-tools:
	$(START_BUILD)
	$(PKG_REMOVE)
	$(call PKG_DOWNLOAD,$(PKG_SOURCE))
	$(call PKG_UNPACK,$(BUILD_DIR))
	$(PKG_APPLY_PATCHES)
	$(PKG_CHDIR); \
		$(TARGET_CONFIGURE_ENV) \
		$(MAKE) -C src $(WIREGUARD_TOOLS_MAKE_OPTS) PREFIX=/usr; \
		$(MAKE) -C src install $(WIREGUARD_TOOLS_MAKE_OPTS) DESTDIR=$(TARGET_DIR) MANDIR=$(REMOVE_mandir)
	$(PKG_REMOVE)
	$(TOUCH)
