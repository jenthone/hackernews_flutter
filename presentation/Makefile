dependencies:
	flutter pub get
clean:
	flutter clean
build-runner:
	flutter packages pub run build_runner build --delete-conflicting-outputs
analyze:
	flutter analyze
dart-fix-quietly:
	flutter pub global run dartfix --pedantic lib --overwrite
build-android:
	flutter build apk
run:
	flutter run lib/main.dart