#
# python-incremental
#
PYTHON_INCREMENTAL_VER    = 17.5.0
PYTHON_INCREMENTAL_DIR    = incremental-$(PYTHON_INCREMENTAL_VER)
PYTHON_INCREMENTAL_SOURCE = incremental-$(PYTHON_INCREMENTAL_VER).tar.gz
PYTHON_INCREMENTAL_SITE   = https://files.pythonhosted.org/packages/source/i/incremental
PYTHON_INCREMENTAL_DEPS   = bootstrap python python-setuptools

$(D)/python-incremental:
	$(START_BUILD)
	$(PKG_REMOVE)
	$(call PKG_DOWNLOAD,$(PKG_SOURCE))
	$(call PKG_UNPACK,$(BUILD_DIR))
	$(PKG_APPLY_PATCHES)
	$(PKG_CHDIR); \
		$(PYTHON_BUILD); \
		$(PYTHON_INSTALL)
	$(PKG_REMOVE)
	$(TOUCH)
