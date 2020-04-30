![Vizury Logo](resources/VizuryLogo.png)
# VizuryEventLogger

[![Version](https://img.shields.io/cocoapods/v/VizuryEventLogger.svg?style=flat)](http://cocoapods.org/pods/VizuryEventLogger)
[![License](https://img.shields.io/cocoapods/l/VizuryEventLogger.svg?style=flat)](http://cocoapods.org/pods/VizuryEventLogger)

Vizury is a commerce marketing platform and its personalized retargeting stack is used by digital companies to grow marketing ROI and enhance transactions. 



## Summary
 This is iOS SDK integration guide. The SDK supports iOS9 and above.

## Basic Integration

### Integration through CocoaPods
CocoaPods is a dependency manager for Objective C & Swift projects and makes integration easier.

1. If you don't have CocoaPods installed, you can do it by executing the following line in your terminal.

    ```sudo gem install cocoapods```
    
2. If you don't have a Podfile, create a plain text file named Podfile in the Xcode project directory with the following content, making sure to set the platform and version that matches your app.

    ```pod 'VizuryEventLogger'```<br>
    ```pod 'VizuryRichNotification'```
    
    To resolve unwanted issues, please add the following Firebase pod:<br>
    ```pod 'Firebase/Messaging'```
    
3. Install `VizuryEventLogger` and `VizuryRichNotification` SDK by executing the following in the Xcode project directory.

    ```pod install```
    
4. Now, open your project workspace and check if `VizuryEventLogger` and `VizuryRichNotification` SDK is properly added.

### Vizury SDK Initialization

  In your `AppDelegate` file import the `VizuryEventLogger`

#### Objective-C
----  
 ```objc
 #import <VizuryEventLogger/VizuryEventLogger.h>
 ```
 
 Add the following in `didFinishLaunchingWithOptions` method of AppDelegate to initialize the SDK
 
```objc
  [VizuryEventLogger initializeEventLoggerInApplication:(UIApplication*)application
                            WithPackageId:(NSString *)packageId
                            ServerURL:(NSString *)serverURL
                            WithCachingEnabled:(BOOL) caching
                            AndWithFCMEnabled:(BOOL) isFCMEnabled];
```

#### Swift
---- 
 ```objc
 #import VizuryEventLogger
 ```
 
 Update your AppDelegate 
 
 ```swift
 class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate
 ```
 
 Add the following in `didFinishLaunchingWithOptions` method of AppDelegate to initialize the SDK
 
```objc
VizuryEventLogger.initializeEventLogger(in: application,
			withPackageId: packageId, 
			serverURL: serverUrl,
			withCachingEnabled: caching, 
			AndWithFCMEnabled: isFCMEnabled)
```

```
Where 
  packageId     : packageId obtained from vizury
  serverURL     : serverURL obtained from vizury
  caching       : pass true if your app supports offline usage and you want to send user behaviour data 
                  to vizury while he was offline. Pass false otherwise
  isFCMEnabled  : true/false depending on if you want to use vizury for push
``` 
 
Thats it!! SDK is successfully integrated and initialized in the project, and ready to use.

## Developer Docs
Please refer to our developer docs to know how to make use of our SDK to track Events and User Attributes, to implement Push Notification: https://bitbucket.org/vizury/vizury-ios-sdk/src/master/.

## Support
Please visit this repository's [Github issue tracker](https://github.com/ayon-affle/vizury-ios-sdk/issues) for bug reports specific to our iOS SDK.
For other issues and support please contact Vizury support from your dashboard.

