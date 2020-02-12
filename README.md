# [Croesus iOS](https://github.com/IanWanyoike/Croesus)

<img height="300px" src="/Screenshots/all.png?raw=true">

## Build Instructions
    
Download the source code.

```sh
$ git clone https://github.com/IanWanyoike/Croesus.git
$ cd Croesus
```
    
Build the [CocoaPods](http://cocoapods.org) dependencies.
    
```sh
$ pod repo update
$ pod install
```
    
Open **`Croesus.xcworkspace`** in Xcode and build. 

*Note*: **Don't open the `.xcodeproj`** because we use CocoaPods.
