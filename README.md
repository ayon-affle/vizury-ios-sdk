![Vizury Logo](resources/VizuryLogo.png)

## Summary
 This is iOS SDK integration guide. The SDK supports iOS9 and above.

## Basic Integration

### Integration through CocoaPods
CocoaPods is a dependency manager for Objective C & Swift projects and makes integration easier.

1. If you don't have CocoaPods installed, you can do it by executing the following line in your terminal.

    ```sudo gem install cocoapods```
    
2. If you don't have a Podfile, create a plain text file named Podfile in the Xcode project directory with the following content, making sure to set the platform and version that matches your app.

    ```pod 'VizuryEventLogger'```
    
    ```pod 'VizuryRichNotification'```
    
3. Install `VizuryEventLogger` and `VizuryRichNotification` SDK by executing the following in the Xcode project directory.

    ```pod install```
    
4. Now, open your project workspace and check if `VizuryEventLogger` and `VizuryRichNotification` SDK is properly added.

### Vizury SDK Initialization

#### Objective-C
---- 
  Import the `VizuryEventLogger`
 
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
 In your AppDelegate file add
 
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
 
