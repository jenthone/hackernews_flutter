SUBDIRS = domain data presentation

define recursive_in_subs
	for dir in $(SUBDIRS); do $(MAKE) $(1) -C $$dir; done
endef

dependencies:
	$(call recursive_in_subs, dependencies)

build-runner:
	$(MAKE) build-runner -C data

analyze:
	$(call recursive_in_subs, analyze)

dart-fix-quietly:
	flutter pub global activate dartfix
	$(call recursive_in_subs, dart-fix-quietly)

build-android:
	$(MAKE) build-android -C presentation

setup: dependencies build-runner