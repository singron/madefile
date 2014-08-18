MADEFILE_DIR ?= .madefile

MADEFILE_ORIG_DEFAULT_GOAL := $(.DEFAULT_GOAL)

$(MADEFILE_DIR):
	mkdir -p $@

.DEFAULT_GOAL := $(MADEFILE_ORIG_DEFAULT_GOAL)

define madefile
$(eval $(call madefile-command,$1))
endef

define madefile-include
$(eval $(call madefile-include-command,$1))
endef

define madefile-include-command
$(call madefile-command,$1)
include $(call madefile-path,$1/Madefile)
endef

define madefile-command
MADEFILE_ORIG_DEFAULT_GOAL := $$(.DEFAULT_GOAL)
$(MADEFILE_DIR)/$1/Madefile: $(MADEFILE_DIR)
	$(call download-madefile,$1)

.DEFAULT_GOAL := $$(MADEFILE_ORIG_DEFAULT_GOAL)
endef

define download-madefile
cd $$(MADEFILE_DIR) && git clone https://$1.git $1 || git clone git@$1.git $1
endef

define madefile-path
$(MADEFILE_DIR)/$1
endef
