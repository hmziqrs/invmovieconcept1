# Android bundle scripts

flutter build appbundle -t lib/main.mobile.dart
bundletool build-apks --bundle=build/app/outputs/bundle/release/app-release.aab --output=build/release.apks
adb uninstall com.onemdev.invmovieconcept1
bundletool install-apks --apks=build/release.apks
adb shell am start -n com.onemdev.invmovieconcept1/com.onemdev.invmovieconcept1.MainActivity
