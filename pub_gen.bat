echo "================== Pub Gen =================="
dart run module_generator:generate_app_localizations
flutter pub get
dart run build_runner build --delete-conflicting-outputs