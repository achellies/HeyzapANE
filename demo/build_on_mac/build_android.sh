pushd ..
rm -rf dist bin
mkdir dist bin
/Applications/flex_sdk/bin/mxmlc -load-config+=build_on_mac/demo.xml -debug=true -incremental=true +configname=airmobile -o bin/demo.swf
/Applications/AdobeAirSDK/bin/adt -package -target apk-debug -connect -storetype pkcs12 -keystore cert/demo.p12 -storepass fd dist/demo-debug.apk application.xml -C bin . -C icons/android . -extdir ext
/Applications/android-sdk/platform-tools/adb install -r dist/demo-debug.apk
popd
