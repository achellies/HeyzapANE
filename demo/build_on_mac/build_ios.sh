pushd ..
rm -rf dist bin
mkdir dist bin
/Applications/flex_sdk/bin/mxmlc -load-config+=build_on_mac/demo.xml -debug=true -incremental=true +configname=airmobile -o bin/demo.swf
/Applications/AdobeAirSDK/bin/adt -package -target ipa-debug-interpreter -connect -storetype pkcs12 -keystore ~/cert/iPhone.p12 -storepass fd -provisioning-profile ~/cert/iPhone.mobileprovision dist/demo-debug-interpreter.ipa application.xml -C bin . -C icons/ios . -extdir ext
popd

