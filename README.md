HeyzapANE
=========

Adobe Native Extension (ANE) for Heyzap with support for iOS/Android

Software installation (Windows):
--------------------------------

- Download and install Java 6 (Java 7 will cause signing issues!)
- Download and install Android SDK from http://developer.android.com/sdk/index.html
- Open the SDK manager and install 'Tools' and 'Android 4.0.3 (API 15)' or later
- Download and install FlashDevelop from http://flashdevelop.org/
- Download and unzip ant from http://ant.apache.org/bindownload.cgi and add ant to your search path
- (optional) Download and install Eclipse from http://www.eclipse.org/
- (optional) Download Eclipse Android integration as specified here http://developer.android.com/sdk/eclipse-adt.html

To compile ANE:
---------------

- Edit ane\build.properties and update paths (build.properties.mac and build.properties.win are example files)

- In the ane folder run 'ant'

- If you want to recompile the iOS library (needs MacOS), run:

	ant ios_compile

To compile the Demo:
--------------------

- Open demo\demo.as3proj in FlashDevelop
- Press F5 to run the application

The demo was created by:
------------------------

- In FlashDevelop: Project / New Project ... / AIR Mobile AS3 App

- Follow instructions in AIR_Android/iOS_readme.txt

- In SetupApplication.bat set the certificates:

	set IOS_DIST_CERT_FILE=cert\iPhone.p12
	set IOS_DEV_CERT_FILE=cert\iPhone.p12
	set IOS_DEV_CERT_PASS=fd
	set IOS_PROVISION=cert\iPhone.mobileprovision

- In application.xml change / add the contents of <manifestAdditions> to:

	<manifest android:installLocation="auto">
		<uses-sdk android:minSdkVersion="3"/>
		<uses-permission android:name="android.permission.INTERNET"/>
	</manifest>
	
(Setting minSdkVersion will give an error if you don't have that SDK version downloaded with the Android SDK manager)
	
- In application.xml add to <InfoAdditions> and change the name of the scheme 'mycoolscheme' to something application specific:

	<key>CFBundleURLTypes</key>
	<array>
			<dict>
	        		<key>CFBundleTypeRole</key>
	        		<string>Editor</string>
	        		<key>CFBundleURLIconFile</key>
	        		<string>Icon</string>
	        		<key>CFBundleURLName</key>
	        		<string>mycoolscheme</string>
	        		<key>CFBundleURLSchemes</key>
	        		<array>
	                		<string>mycoolscheme</string>
	       			</array>
			</dict>
	</array>


- In application.xml add before </application>:

	<extensions>
        <extensionID>com.heyzap.extension</extensionID>
    </extensions>
	
- In Packager.bat change:

	call adt -package -target %TYPE%%TARGET% %OPTIONS% %SIGNING_OPTIONS% "%OUTPUT%" "%APP_XML%" %FILE_OR_DIR%

	to:
	
	call adt -package -target %TYPE%%TARGET% %OPTIONS% %SIGNING_OPTIONS% "%OUTPUT%" "%APP_XML%" %FILE_OR_DIR% -extdir ext

- In Run.bat replace:

	adl -screensize %SCREEN_SIZE% "%APP_XML%" "%APP_DIR%"

	with:

	rmdir /q /s ext_unpacked
	mkdir ext_unpacked\HeyzapExtension.ane
	unzip -q ext\HeyzapExtension.ane -d ext_unpacked\HeyzapExtension.ane
	adl -screensize %SCREEN_SIZE% "%APP_XML%" "%APP_DIR%" -extdir ext_unpacked

- In SetupSDK.bat add the variable JAVA_SDK
		
- Add to Packager.bat:

	if errorlevel 1 goto failed
	if "%PLATFORM%" NEQ "android" goto skip-heyzap-res
	call AddHeyzapRes.bat
	if errorlevel 1 goto failed
	:skip-heyzap-res

- Add folder 'ext' and copy HeyzapExtension.ane to it
	
	Right HeyzapExtension.ane and select 'Add To Library'
	Right HeyzapExtension.ane and select 'Options...' and select 'External Library (not included)'
	
- Copy the Heyzap.framework folder to the lib folder

- Edited demo\src\com\heyzap\demo\Main.as, main code is:

	var h : Heyzap = new Heyzap();
	h.load(<open on application start>, <apple id>, <url scheme>); 
	
- Do a checkin using:

	h.checkin("Checking text goes here!");

- Make sure you don't call NativeApplication.nativeApplication.exit() in your deactivation handler (activating Heyzap deactivates your app)

- Make sure you're running Java 6 and not Java 7 (this will cause signing errors!)
