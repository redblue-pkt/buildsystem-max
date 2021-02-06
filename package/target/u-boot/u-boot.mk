#
# u-boot
#
U_BOOT_VER    = 2021.01
U_BOOT_DIR    = u-boot-$(U_BOOT_VER)
U_BOOT_SOURCE = u-boot-$(U_BOOT_VER).tar.bz2
U_BOOT_SITE   = https://ftp.denx.de/pub/u-boot
U_BOOT_DEPS   = bootstrap arm-trusted-firmware crust

ifeq ($(BOXMODEL),$(filter $(BOXMODEL),orangepioneplus))
U_BOOT_CPU    = h6
U_BOOT_DEF    = orangepi_one_plus
U_BOOT_SCR    = orangepi-one-plus
U_BOOT_ENV    = orangepi_one_plus_env.txt
endif

UBOOT_CONFIGURE_VARS += USE_PRIVATE_LIBGCC=yes

UBOOT_MAKE_FLAGS = \
	HOSTCC="$(HOSTCC)" \
	HOSTCFLAGS="$(HOST_CFLAGS) $(HOST_CPPFLAGS) -std=gnu11" \
	HOSTLDFLAGS="$(HOST_LDFLAGS)"

UBOOT_MAKE_FLAGS += \
	BL31=$(TARGET_DIR)/boot/bl31.bin \
	SCP=$(TARGET_DIR)/boot/scp.bin

$(D)/u-boot:
	$(START_BUILD)
	$(PKG_REMOVE)
	$(call PKG_DOWNLOAD,$(PKG_SOURCE))
	$(call PKG_UNPACK,$(BUILD_DIR))
	$(APPLY_PATCHES) $(BUILD_DIR)/$(U_BOOT_DIR) $(PKG_PATCHES_DIR)/$(U_BOOT_CPU)
	$(PKG_CHDIR); \
		$(MAKE) $(UBOOT_CONFIGURE_VARS) $(U_BOOT_DEF)_defconfig; \
		$(MAKE) $(UBOOT_MAKE_FLAGS) CROSS_COMPILE=$(TARGET_CROSS); \
		$(INSTALL_EXEC) -D $(PKG_BUILD_DIR)/u-boot-sunxi-with-spl.bin $(TARGET_DIR)/boot/u-boot-$(U_BOOT_SCR)-with-spl.bin; \
		cp -rf $(PKG_FILES_DIR)/$(U_BOOT_ENV) $(TARGET_DIR)/boot
	$(PKG_REMOVE)
	$(TOUCH)

