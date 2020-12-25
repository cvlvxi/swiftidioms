```
 ________  ________  ________  ___  __    ________  ________  _______   ________      
|\   __  \|\   __  \|\   ____\|\  \|\  \ |\   __  \|\   ____\|\  ___ \ |\   ____\     
\ \  \|\  \ \  \|\  \ \  \___|\ \  \/  /|\ \  \|\  \ \  \___|\ \   __/|\ \  \___|_    
 \ \   ____\ \   __  \ \  \    \ \   ___  \ \   __  \ \  \  __\ \  \_|/_\ \_____  \   
  \ \  \___|\ \  \ \  \ \  \____\ \  \\ \  \ \  \ \  \ \  \|\  \ \  \_|\ \|____|\  \  
   \ \__\    \ \__\ \__\ \_______\ \__\\ \__\ \__\ \__\ \_______\ \_______\____\_\  \ 
    \|__|     \|__|\|__|\|_______|\|__| \|__|\|__|\|__|\|_______|\|_______|\_________\
                                                                          \|_________|
```                                                                                      
                                                                                      

<!-- vscode-markdown-toc -->
* [How to add packages?](#Howtoaddpackages)
* [CLI tool](#CLItool)
* [Creating your own package](#Creatingyourownpackage)
* [Building package](#Buildingpackage)
* [Issue: Running package](#Issue:Runningpackage)
* [Issues with Appcode / Xcode](#IssueswithAppcodeXcode)

<!-- vscode-markdown-toc-config
	numbering=false
	autoSave=true
	/vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->

## <a name='Howtoaddpackages'></a>How to add packages?

- [Official Package Documentation](https://developer.apple.com/documentation/swift_packages)
- [Swift Package Manager](https://github.com/apple/swift-package-manager)

## <a name='CLItool'></a>CLI tool


```
swift package --help
```

## <a name='Creatingyourownpackage'></a>Creating your own package

```
swift package init 
```

- Creates a `Package.swift` and folders `Sources` `Tests`

## <a name='Buildingpackage'></a>Building package

```
swift build
```

## <a name='Issue:Runningpackage'></a>Issue: Running package

```
 swift run
error: no executable product available
```

## <a name='IssueswithAppcodeXcode'></a>Issues with Appcode / Xcode
- Swift really has a horrrible dev environment...


# CocoaPods Package Manager
- See here [Package manager](https://cocoapods.org/)

``` sudo gem install cocoapods```