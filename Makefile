SYSTEMD_UNIT_DIR ?= /lib/systemd/system
TMPFILES_DIR ?= /usr/lib/tmpfiles.d

TARGET := $(DESTDIR)/$(PREFIX)
TARGET_SBIN := $(TARGET)/usr/sbin
TARGET_SYSTEMD_UNIT_DIR := $(TARGET)/$(SYSTEMD_UNIT_DIR)
TARGET_TMPFILES_DIR := $(TARGET)/$(TMPFILES_DIR)
TARGET_LIBEXEC_DIR := $(TARGET)/usr/libexec

install:
	install -d $(TARGET_SBIN)
	install update-system $(TARGET_SBIN)

	install -d $(TARGET_SYSTEMD_UNIT_DIR)
	install update-system.service update-system.timer $(TARGET_SYSTEMD_UNIT_DIR)

	install -d $(TARGET_TMPFILES_DIR)
	install update-system.tmpfiles.conf $(TARGET_TMPFILES_DIR)/update-system.conf

	install -d $(TARGET_LIBEXEC_DIR)
	install dispatch-conf-ediff $(TARGET_LIBEXEC_DIR)
	install sendxmpp-elog $(TARGET_LIBEXEC_DIR)
