```
 ___  ________   ________  ___  ___  _______   ________      
|\  \|\   ____\ |\   ____\|\  \|\  \|\  ___ \ |\   ____\     
\ \  \ \  \___|_\ \  \___|\ \  \\\  \ \   __/|\ \  \___|_    
 \ \  \ \_____  \\ \_____  \ \  \\\  \ \  \_|/_\ \_____  \   
  \ \  \|____|\  \\|____|\  \ \  \\\  \ \  \_|\ \|____|\  \  
   \ \__\____\_\  \ ____\_\  \ \_______\ \_______\____\_\  \ 
    \|__|\_________\\_________\|_______|\|_______|\_________\
        \|_________\|_________|                  \|_________|
                                                             
```                                                             

<!-- vscode-markdown-toc -->
* [root manifest not found](#rootmanifestnotfound)

<!-- vscode-markdown-toc-config
	numbering=false
	autoSave=true
	/vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->

## <a name='rootmanifestnotfound'></a>root manifest not found
- When? Calling swift build and swift test

## Cannot use module that contains top-level code
- Issue: `'UIApplicationMain' attribute cannot be used in a module that contains top-level code`
- resolved by: Deleting main.swift
- Put metal main that contains `@NSApplicationMain` in AppDelegate.swift

## No Info.plist file in application bundle
- When trying to run Metal Application
- [See here](https://github.com/NixOS/nixpkgs/issues/24211)
- Create an [app bundle](https://developer.apple.com/library/archive/documentation/CoreFoundation/Conceptual/CFBundles/BundleTypes/BundleTypes.html#//apple_ref/doc/uid/10000123i-CH101-SW1)

```
