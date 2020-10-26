# Generate localizations

dart scripts/genIntlJson.dart && dart scripts/genIntlKeys.dart && flutter pub get

# Android bundle scripts

flutter build appbundle -t lib/main.mobile.dart
bundletool build-apks --bundle=build/app/outputs/bundle/release/app-release.aab --output=build/release.apks
adb uninstall com.onemdev.invmovieconcept1
bundletool install-apks --apks=build/release.apks
adb shell am start -n com.onemdev.invmovieconcept1/com.onemdev.invmovieconcept1.MainActivity

flutter build apk -t lib/main.mobile.dart && adb install ./build/app/outputs/apk/release/app-release.apk

flutter build apk && adb install ./build/app/outputs/apk/release/app-release.apk
