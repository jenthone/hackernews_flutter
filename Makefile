SUBDIRS = domain data presentation

define recursive_in_subs
	for dir in $(SUBDIRS); do $(MAKE) $(1) -C $$dir; done
endef

dependencies:
	$(call recursive_in_subs, dependencies)

clean:
	$(call recursive_in_subs, clean)

build-runner:
	$(call recursive_in_subs, build-runner)

analyze:
	$(call recursive_in_subs, analyze)

dart-fix-quietly:
	flutter pub global activate dartfix
	$(call recursive_in_subs, dart-fix-quietly)

build-android:
	$(MAKE) build-android -C presentation

setup: clean dependencies build-runner

run:
	$(MAKE) run -C presentation