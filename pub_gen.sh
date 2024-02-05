if [ "$1" = "core" ] || [ "$1" = "" ]; then
    echo "================== Pub Gen Core =================="
    cd core
    flutter pub get
    dart run build_runner build --delete-conflicting-outputs
    dart run module_generator:generate_export
    cd ../
fi
if [ "$1" = "customer" ] || [ "$1" = "" ]; then
    echo "================== Pub Gen Customer =================="
    cd customer
    dart run module_generator:generate_app_localizations
    flutter pub get
    dart run module_generator:generate_asset customer
    dart run build_runner build --delete-conflicting-outputs
    cd ../
fi
if [ "$1" = "staff" ] || [ "$1" = "" ]; then
    echo "================== Pub Gen Staff =================="
    cd staff
    dart run module_generator:generate_app_localizations
    flutter pub get
    dart run module_generator:generate_asset staff
    dart run module_generator:generate_export
    dart run build_runner build --delete-conflicting-outputs
    cd ../
fi