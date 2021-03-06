#
# sshfs
#
SSHFS_VER    = 2.9
SSHFS_DIR    = sshfs-$(SSHFS_VER)
SSHFS_SOURCE = sshfs-$(SSHFS_VER).tar.gz
SSHFS_SITE   = https://github.com/libfuse/sshfs/releases/download/sshfs-$(SSHFS_VER)
SSHFS_DEPS   = bootstrap glib2 libfuse

$(D)/sshfs:
	$(START_BUILD)
	$(PKG_REMOVE)
	$(call PKG_DOWNLOAD,$(PKG_SOURCE))
	$(call PKG_UNPACK,$(BUILD_DIR))
	$(PKG_APPLY_PATCHES)
	$(PKG_CHDIR); \
		$(CONFIGURE); \
		$(MAKE); \
		$(MAKE) install DESTDIR=$(TARGET_DIR)
	$(PKG_REMOVE)
	$(TOUCH)
