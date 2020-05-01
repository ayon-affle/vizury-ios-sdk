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
    
    To avoid unwanted issues, please add the following Firebase pod:<br>
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

### Event Logging

When a user browse through the app, various activities happen e.g. visiting a product, adding the product to cart, making purchase, etc. These are called events. Corresponding to each event, app needs to pass certain variables to the SDK which the SDK will automatically pass to Vizury servers.

#### Objective-C
----
Create an attributeDictionary with the attributes associated with the event and call `[VizuryEventLogger logEvent]` with event name and the attributeDictionary.

```objc
    #import <VizuryEventLogger/VizuryEventLogger.h>

    NSDictionary *attributeDictionary  =   [[NSDictionary alloc] initWithObjectsAndKeys:
                                            @"AKSJDASNBD",@"productid",
                                            @"789", @"productPrice",
                                            @"Shirt",@"category",
                                            nil];

    [VizuryEventLogger logEvent:@"productPage" WithAttributes:attributeDictionary];
    
    // sending a JSONObject
    NSDictionary *productDetail = [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"62112",@"product_id",
                                   @"1",@"quantity",
                                   @"50", @"price",
                                   nil];
    
    NSData *productjsonData = [NSJSONSerialization dataWithJSONObject:productDetail options:0 error:nil];
    NSString *productjsonStr = [[NSString alloc] initWithData:productjsonData encoding:NSUTF8StringEncoding];
    
    NSDictionary *productjsonDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                           productjsonStr,@"viz_data",
                                           nil];
    [VizuryEventLogger logEvent:@"productDetails" WithAttributes:productjsonDictionary];
```

#### Swift
----
Create an attributeDictionary with the attributes associated with the event and call `VizuryEventLogger.logEvent with event name and the attributeDictionary.

```swift
        let attributeDictionary = [ "productId":"AKSJDASNBD",
                                        "price" : "999",
                                        "category" : "shirt"]
        VizuryEventLogger.logEvent("productPage", withAttributes: attributeDictionary)
```	

## Push Notifications

For sending push notifications we are using GCM-APNS interface. For this you need to configure the App for push notifications in [Apple Developer Member Center][apple-dev-member-center] and get a configuration file from google.

### Configuring Apple Developer Settings

To enable sending Push Notifications through APNs, you need

a) Create the authentication key.

b) Create an App ID

c) Provisioning profile for that App ID.

You can create them in the [Apple Developer Member Center][apple-dev-member-center] by following [these steps][provisioning-profiles]


### Configuring project for FCM

#### Set up CocoaPods dependencies

* If you don't have an Xcode project yet, create one now
* Create a Podfile if you don't have one

```
$ cd your-project directory
$ pod init
```

* Add the `Firebase/Messaging` pod

```
pod 'Firebase/Messaging'
```

* Install the pods and open the .xcworkspace file to see the project in Xcode

```
$ pod install
$ open your-project.xcworkspace


## Support
Please visit this repository's [Github issue tracker](https://github.com/ayon-affle/vizury-ios-sdk/issues) for bug reports specific to our iOS SDK.
For other issues and support please contact Vizury support from your dashboard.


