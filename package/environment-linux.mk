#
# set up linux environment for other makefiles
#
# -----------------------------------------------------------------------------

#
# gfutures
#
ifeq ($(BOXMODEL),$(filter $(BOXMODEL),bre2ze4k hd51 hd60 hd61))

ifeq ($(BOXMODEL),bre2ze4k)
KERNEL_VER         = 4.10.12
MTD_BLACK          = mmcblk0
MTD_BOOTFS         = mmcblk0p1
endif

ifeq ($(BOXMODEL),hd51)
KERNEL_VER         = 4.10.12
MTD_BLACK          = mmcblk0
MTD_BOOTFS         = mmcblk0p1
endif

ifeq ($(BOXMODEL),hd60)
KERNEL_VER         = 4.4.35
KERNEL_DATE        = 20181228
MTD_BLACK          = mmcblk0
MTD_BOOTFS         = mmcblk0p4
endif

ifeq ($(BOXMODEL),hd61)
KERNEL_VER         = 4.4.35
KERNEL_DATE        = 20181228
MTD_BLACK          = mmcblk0
MTD_BOOTFS         = mmcblk0p4
endif

ifeq ($(BOXMODEL),$(filter $(BOXMODEL),bre2ze4k hd51))
KERNEL_IMAGE_TYPE  = zImage
KERNEL_SOURCE      = linux-$(KERNEL_VER)-arm.tar.gz
else
KERNEL_IMAGE_TYPE  = uImage
KERNEL_SOURCE      = linux-$(KERNEL_VER)-$(KERNEL_DATE)-arm.tar.gz
endif

ifeq ($(BOXMODEL),$(filter $(BOXMODEL),bre2ze4k hd51))
KERNEL_DTB         = bcm7445-bcm97445svmb.dtb
else
KERNEL_DTB         = hi3798mv200.dtb
endif

KERNEL_SITE        = http://downloads.mutant-digital.net
KERNEL_DIR         = linux-$(KERNEL_VER)

endif

# -----------------------------------------------------------------------------

#
# Air Digital
#
ifeq ($(BOXMODEL),h7)

KERNEL_VER         = 4.10.12
MTD_BLACK          = mmcblk0
MTD_BOOTFS         = mmcblk0p1
KERNEL_IMAGE_TYPE  = zImage
KERNEL_SOURCE      = linux-$(KERNEL_VER)-arm.tar.gz
KERNEL_DTB         = bcm7445-bcm97445svmb.dtb
KERNEL_SITE        = http://www.zgemma.org/downloads/
KERNEL_DIR         = linux-$(KERNEL_VER)

endif

# -----------------------------------------------------------------------------

#
# VU Plus
#
ifeq ($(BOXMODEL),$(filter $(BOXMODEL),vuduo vuduo4k vuduo4kse vusolo4k vuultimo4k vuuno4k vuuno4kse vuzero4k))

ifeq ($(BOXMODEL),vuduo)
KERNEL_VER         = 3.9.6
MTD_BLACK          = $(EMPTY)
MTD_BOOTFS         = $(EMPTY)
endif

ifeq ($(BOXMODEL),vuduo4k)
KERNEL_VER         = 4.1.45-1.17
KERNEL_SOURCE_VER  = 4.1-1.17
MTD_BLACK          = mmcblk0
MTD_BOOTFS         = mmcblk0p6
endif

ifeq ($(BOXMODEL),vuduo4kse)
KERNEL_VER         = 4.1.45-1.17
KERNEL_SOURCE_VER  = 4.1-1.17
MTD_BLACK          = mmcblk0
MTD_BOOTFS         = mmcblk0p6
endif

ifeq ($(BOXMODEL),vusolo4k)
KERNEL_VER         = 3.14.28-1.8
KERNEL_SOURCE_VER  = 3.14-1.8
MTD_BLACK          = mmcblk0
MTD_BOOTFS         = mmcblk0p1
endif

ifeq ($(BOXMODEL),vuultimo4k)
KERNEL_VER         = 3.14.28-1.12
KERNEL_SOURCE_VER  = 3.14-1.12
MTD_BLACK          = mmcblk0
MTD_BOOTFS         = mmcblk0p1
endif

ifeq ($(BOXMODEL),vuuno4k)
KERNEL_VER         = 3.14.28-1.12
KERNEL_SOURCE_VER  = 3.14-1.12
MTD_BLACK          = mmcblk0
MTD_BOOTFS         = mmcblk0p1
endif

ifeq ($(BOXMODEL),vuuno4kse)
KERNEL_VER         = 4.1.20-1.9
KERNEL_SOURCE_VER  = 4.1-1.9
MTD_BLACK          = mmcblk0
MTD_BOOTFS         = mmcblk0p1
endif

ifeq ($(BOXMODEL),vuzero4k)
KERNEL_VER         = 4.1.20-1.9
KERNEL_SOURCE_VER  = 4.1-1.9
MTD_BLACK          = mmcblk0
MTD_BOOTFS         = mmcblk0p4
endif

ifeq ($(BOXMODEL),vuduo)
KERNEL_IMAGE_TYPE  = vmlinux
KERNEL_SOURCE      = stblinux-$(KERNEL_VER).tar.bz2
else
KERNEL_IMAGE_TYPE  = zImage
KERNEL_SOURCE      = stblinux-${KERNEL_SOURCE_VER}.tar.bz2
endif

KERNEL_DTB         = $(EMPTY)
KERNEL_SITE        = http://archive.vuplus.com/download/kernel
KERNEL_DIR         = linux

endif

# -----------------------------------------------------------------------------

#
# Edision
#
ifeq ($(BOXMODEL),$(filter $(BOXMODEL),osmio4k osmio4kplus))

ifeq ($(BOXMODEL),osmio4k)
KERNEL_VER         = 5.9.0
KERNEL_SOURCE_VER  = 5.9
MTD_BLACK          = mmcblk1
MTD_BOOTFS         = mmcblk1p1
endif

ifeq ($(BOXMODEL),osmio4kplus)
KERNEL_VER         = 5.9.0
KERNEL_SOURCE_VER  = 5.9
MTD_BLACK          = mmcblk1
MTD_BOOTFS         = mmcblk1p1
endif

KERNEL_IMAGE_TYPE  = zImage
KERNEL_SOURCE      = linux-edision-$(KERNEL_SOURCE_VER).tar.gz
KERNEL_DTB         = $(EMPTY)
KERNEL_SITE        = http://source.mynonpublic.com/edision
KERNEL_DIR         = linux-brcmstb-$(KERNEL_SOURCE_VER)

endif

# -----------------------------------------------------------------------------

#
# Orange Pi
#
ifeq ($(BOXMODEL),$(filter $(BOXMODEL),orangepioneplus))

ifeq ($(BOXMODEL),orangepioneplus)
KERNEL_VER         = 5.10.4
KERNEL_SOURCE_VER  = 5.10.4
MTD_BLACK          = mmcblk0
MTD_BOOTFS         = mmcblk0p0
endif

KERNEL_IMAGE_TYPE  = Image
KERNEL_SOURCE      = linux-$(KERNEL_SOURCE_VER).tar.xz
KERNEL_DTB         = dtbs
KERNEL_SITE        = https://cdn.kernel.org/pub/linux/kernel/v5.x
KERNEL_DIR         = linux-$(KERNEL_SOURCE_VER)
endif

KERNEL_OBJ         = linux-$(KERNEL_VER)-kernel-obj
KERNEL_OBJ_DIR     = $(BUILD_DIR)/$(KERNEL_OBJ)
KERNEL_MODULES     = linux-$(KERNEL_VER)-modules
KERNEL_MODULES_DIR = $(BUILD_DIR)/linux-$(KERNEL_VER)-modules/lib/modules/$(KERNEL_VER)
TARGET_MODULES_DIR = $(TARGET_DIR)/lib/modules/$(KERNEL_VER)

KERNEL_OUTPUT      = $(KERNEL_OBJ_DIR)/arch/$(KERNEL_ARCH)/boot/$(KERNEL_IMAGE_TYPE)
KERNEL_INPUT_DTB   = $(KERNEL_OBJ_DIR)/arch/$(KERNEL_ARCH)/boot/dts/$(KERNEL_DTB)

ifeq ($(BOXMODEL),$(filter $(BOXMODEL),orangepioneplus))
KERNEL_OUTPUT_DTB  = $(KERNEL_OBJ_DIR)/arch/$(KERNEL_ARCH)/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dtb
else
KERNEL_OUTPUT_DTB  = $(KERNEL_OBJ_DIR)/arch/$(KERNEL_ARCH)/boot/zImage_dtb
endif

ifeq ($(VU_MULTIBOOT),1)
KERNEL_CONFIG      = $(BOXMODEL)_defconfig_multi
else
KERNEL_CONFIG      = $(BOXMODEL)_defconfig
endif

LINUX_DIR          = $(BUILD_DIR)/$(KERNEL_DIR)

# -----------------------------------------------------------------------------

# translate toolchain arch to kernel arch
ifeq ($(TARGET_ARCH),arm)
KERNEL_ARCH = arm
else ifeq ($(TARGET_ARCH),aarch64)
KERNEL_ARCH = arm64
else ifeq ($(TARGET_ARCH),mips)
KERNEL_ARCH = mips
endif

# -----------------------------------------------------------------------------

KERNEL_MAKEVARS = \
	ARCH=$(KERNEL_ARCH) \
	CROSS_COMPILE=$(TARGET_CROSS) \
	INSTALL_MOD_PATH=$(BUILD_DIR)/$(KERNEL_MODULES) \
	O=$(KERNEL_OBJ_DIR)

# Compatibility variables
KERNEL_MAKEVARS += \
	KDIR=$(LINUX_DIR) \
	KSRC=$(LINUX_DIR) \
	SRC=$(LINUX_DIR) \
	KERNDIR=$(LINUX_DIR) \
	KERNELDIR=$(LINUX_DIR) \
	KERNEL_SRC=$(LINUX_DIR) \
	KERNEL_SOURCE=$(LINUX_DIR) \
	LINUX_SRC=$(LINUX_DIR) \
	KVER=$(KERNEL_VER) \
	KERNEL_VERSION=$(KERNEL_VER)

# -----------------------------------------------------------------------------

define LINUX_RUN_DEPMOD
	if test -d $(TARGET_DIR)/lib/modules/$(KERNEL_VER) \
		&& grep -q "CONFIG_MODULES=y" $(KERNEL_OBJ_DIR)/.config; then \
		PATH=$(PATH):/sbin:/usr/sbin depmod -a -b $(TARGET_DIR) $(KERNEL_VER); \
	fi
endef
