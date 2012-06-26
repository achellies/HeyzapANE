This folder contains some very simple shell scripts to build the demo on MacOS.

Edit the scripts to set the correct paths to the used tools.

For iOS set the correct path to your Apple certificate and mobileprovision file.

If the iOS version doesn't link (Heyzap framework missing) this means you need
to edit ane/ios/platform.xml and add:

<option>-F/<full path to heyzap folder>/heyzap/demo/lib</option>
