
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

AESD_ASSIGNMENTS_VERSION = 9e2a4c752427f8ad38795da5cb0ae6425bb60c08
# Note: ssh URL required (not https) for automated build/test system
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-Andrushika.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0644 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
