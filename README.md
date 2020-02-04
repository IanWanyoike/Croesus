# [Croesus iOS](https://github.com/IanWanyoike/Croesus)

## Build Instructions
    
Download the source code.

    $ git clone https://github.com/IanWanyoike/Croesus.git
    $ cd Croesus
    
Build the [CocoaPods](http://cocoapods.org) dependencies.
    
    $ pod repo update
    $ pod install
    
Open **`Croesus.xcworkspace`** in Xcode and build. 

*Note*: **Don't open the `.xcodeproj`** because we use CocoaPods.