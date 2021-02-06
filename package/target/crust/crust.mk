#
# crust
#
CRUST_VER    = git
CRUST_DIR    = crust.git
CRUST_SOURCE = crust.git
CRUST_SITE   = https://github.com/crust-firmware
CRUST_DEPS   = bootstrap

OR1K_TOOLCHAIN = /opt/toolchains/openrisc--musl--stable-2020.08-1/bin

ifeq ($(BOXMODEL),$(filter $(BOXMODEL),orangepioneplus))
CRUST_PLAT = orangepi_one_plus_defconfig
endif

$(D)/crust:
	$(START_BUILD)
	$(PKG_REMOVE)
	$(call PKG_DOWNLOAD,$(PKG_SOURCE))
	$(call PKG_UNPACK,$(BUILD_DIR))
	$(PKG_APPLY_PATCHES)
	$(PKG_CHDIR); \
		$(MAKE) $(CRUST_PLAT); \
		$(MAKE) CROSS_COMPILE=$(OR1K_TOOLCHAIN)/or1k-linux- HOST_COMPILE=$(TARGET_CROSS) PLAT=$(CRUST_PLAT); \
		$(MAKE) scp; \
		$(INSTALL_EXEC) -D $(PKG_BUILD_DIR)/build/scp/scp.bin $(TARGET_DIR)/boot
	$(PKG_REMOVE)
	$(TOUCH)

