rem @echo off

echo Making copy of apk...
move %OUTPUT% dist\tmp.zip
if errorlevel 1 goto error

echo Removing META-INF folder...
zip -d dist\tmp.zip META-INF\*
if errorlevel 1 goto error

echo Adding heyzap_res folder...
zip -r dist\tmp.zip res
if errorlevel 1 goto error

echo Signing...
"%JAVA_SDK%\bin\jarsigner" -storetype pkcs12 -storepass fd -keystore cert\demo.p12 -sigfile CERT dist\tmp.zip 1
if errorlevel 1 goto error

echo Aligning zip file...
"%ANDROID_SDK%\tools\zipalign" -v 4 dist\tmp.zip %OUTPUT%
if errorlevel 1 goto error

echo Removing temporary zip...
del dist\tmp.zip
if errorlevel 1 goto error

goto end

:error
pause
exit 1

:end