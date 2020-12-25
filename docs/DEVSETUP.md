```
 ________  _______   ___      ___ ________  _______  _________  ___  ___  ________   
|\   ___ \|\  ___ \ |\  \    /  /|\   ____\|\  ___ \|\___   ___\\  \|\  \|\   __  \  
\ \  \_|\ \ \   __/|\ \  \  /  / | \  \___|\ \   __/\|___ \  \_\ \  \\\  \ \  \|\  \ 
 \ \  \ \\ \ \  \_|/_\ \  \/  / / \ \_____  \ \  \_|/__  \ \  \ \ \  \\\  \ \   ____\
  \ \  \_\\ \ \  \_|\ \ \    / /   \|____|\  \ \  \_|\ \  \ \  \ \ \  \\\  \ \  \___|
   \ \_______\ \_______\ \__/ /      ____\_\  \ \_______\  \ \__\ \ \_______\ \__\   
    \|_______|\|_______|\|__|/      |\_________\|_______|   \|__|  \|_______|\|__|   
                                    \|_________|                                     
```                                                                                     
                                                                                     
                                                                                    

<!-- vscode-markdown-toc -->
* 1. [VSCode + Swift](#VSCodeSwift)
* 2. [Extra stuff in settings.json](#Extrastuffinsettings.json)
* 3. [Better to use xcode](#Bettertousexcode)

<!-- vscode-markdown-toc-config
	numbering=true
	autoSave=true
	/vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->

##  1. <a name='VSCodeSwift'></a>VSCode + Swift
- https://medium.com/swlh/ios-development-on-vscode-27be37293fe1

Basically

* Ensure sourcekit-lsp setup: `xcrun sourcekit-lsp`
* Extension: `SourceKit-LSP`
* Settings.json: 

```
    "sourcekit-lsp.serverPath": "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp",
```

##  2. <a name='Extrastuffinsettings.json'></a>Extra stuff in settings.json

```
"sourcekit-lsp.serverArguments": [
"-Xswiftc",
"-sdk",
"-Xswiftc",
"/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk",
"-Xswiftc",
"-target",
"-Xswiftc",
"x86_64-apple-ios13.6-simulator",
],
```

##  3. <a name='Bettertousexcode'></a>Better to use xcode
- Xcode sucks but it's better than vscode for this 