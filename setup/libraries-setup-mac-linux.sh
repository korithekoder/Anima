cd ..
echo Making the main haxelib and setup folder...
mkdir ~/haxelib && haxelib setup ~/haxelib
echo Installing basic libraries...
echo This might take a few moments depending on your internet speed.
echo Make sure that you have at least Haxe 4 installed for this .sh file to work!
haxelib install lime 8.2.2
haxelib install openfl 9.4.1
haxelib install flixel 5.9.0
haxelib install flixel-addons 3.3.0
haxelib install flixel-tools 1.5.1
haxelib install hscript-iris 1.1.3
haxelib install tjson 1.4.0
haxelib install hxdiscord_rpc 1.3.0
haxelib install hxvlc 1.9.6
haxelib git flxanimate https://github.com/Dot-Stuff/flxanimate 768740a56b26aa0c072720e0d1236b94afe68e3e
echo The libraries setup has been successfully complete!
