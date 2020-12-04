SUBDIRS = domain data presentation

define recursive_in_subs
	for dir in $(SUBDIRS); do \
        $(MAKE) $(1) -C $$dir; \
    done
endef

dependencies:
	$(call recursive_in_subs, dependencies)

analyze:
	$(call recursive_in_subs, analyze)

build-runner:
	$(MAKE) build-runner -C data

dart-fix-quietly:
	flutter pub global activate dartfix
	$(call recursive_in_subs, dart-fix-quietly)