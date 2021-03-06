#
# ca-bundle
#
CA_BUNDLE_VER    = 1.0
CA_BUNDLE_DIR    = /etc/ssl/certs
CA_BUNDLE_SOURCE = cacert.pem
CA_BUNDLE_SITE   = https://curl.haxx.se/ca
CA_BUNDLE_DEPS   = bootstrap

CA_BUNDLE_CRT    = ca-certificates.crt

$(D)/ca-bundle:
	$(START_BUILD)
	$(call PKG_DOWNLOAD,$(PKG_SOURCE))
	cd $(DL_DIR); \
		curl --silent --remote-name --time-cond $(CA_BUNDLE_SOURCE) $(CA_BUNDLE_SITE)/$(CA-BUNDLE_SOURCE) || true
	$(INSTALL_DATA) -D $(DL_DIR)/$(CA_BUNDLE_SOURCE) $(TARGET_DIR)/$(CA_BUNDLE_DIR)/$(CA_BUNDLE_CRT)
	$(TOUCH)
