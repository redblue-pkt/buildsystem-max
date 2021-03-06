#
# luasoap
#
LUASOAP_VER    = 3.0
LUASOAP_DIR    = luasoap-$(LUASOAP_VER)
LUASOAP_SOURCE = luasoap-$(LUASOAP_VER).tar.gz
LUASOAP_SITE   = https://github.com/downloads/tomasguisasola/luasoap
LUASOAP_DEPS   = bootstrap lua luasocket luaexpat

$(D)/luasoap:
	$(START_BUILD)
	$(PKG_REMOVE)
	$(call PKG_DOWNLOAD,$(PKG_SOURCE))
	$(call PKG_UNPACK,$(BUILD_DIR))
	$(PKG_APPLY_PATCHES)
	$(PKG_CHDIR); \
		$(MAKE) install LUA_DIR=$(TARGET_SHARE_DIR)/lua/$(LUA_ABIVER)
	$(PKG_REMOVE)
	$(TOUCH)
