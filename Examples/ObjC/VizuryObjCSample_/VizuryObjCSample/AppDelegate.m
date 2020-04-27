//
//  AppDelegate.m
//  VizuryObjCSample
//
//  Created by Chowdhury Md Rajib  Sarwar on 25/4/20.
//  Copyright © 2020 Chowdhury Md Rajib  Sarwar. All rights reserved.
//

#import "AppDelegate.h"
#import <VizuryEventLogger/VizuryEventLogger.h>

#if defined(__IPHONE_10_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
@import UserNotifications;
#endif

// Implement UNUserNotificationCenterDelegate to receive display notification via APNS for devices
// running iOS 10 and above.
#if defined(__IPHONE_10_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
@interface AppDelegate () <UNUserNotificationCenterDelegate>
@end
#endif

// Copied from Apple's header in case it is missing in some cases (e.g. pre-Xcode 8 builds).
#ifndef NSFoundationVersionNumber_iOS_9_x_Max
#define NSFoundationVersionNumber_iOS_9_x_Max 1299
#endif

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [VizuryEventLogger initializeEventLoggerInApplication:application
                                        WithPackageId:@"1"
                                        ServerURL:@"https://www.vizury.com/analyze/analyze.php"
                                        WithCachingEnabled:false
                                        AndWithFCMEnabled:true];
    
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_7_1) {
           // iOS 7.1 or earlier. Disable the deprecation warnings.
           #pragma clang diagnostic push
           #pragma clang diagnostic ignored "-Wdeprecated-declarations"
           UIRemoteNotificationType allNotificationTypes =
           (UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge);
           [application registerForRemoteNotificationTypes:allNotificationTypes];
           #pragma clang diagnostic pop
       } else {
           // iOS 8 or later
           // [START register_for_notifications]
           if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_9_x_Max) {
               #pragma clang diagnostic push
               #pragma clang diagnostic ignored "-Wdeprecated-declarations"
               UIUserNotificationType allNotificationTypes =
               (UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge);
               UIUserNotificationSettings *settings =
               [UIUserNotificationSettings settingsForTypes:allNotificationTypes categories:nil];
               [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
           } else {
               // iOS 10 or later
               #if defined(__IPHONE_10_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
               // For iOS 10 display notification (sent via APNS)
               [UNUserNotificationCenter currentNotificationCenter].delegate = self;
               UNAuthorizationOptions authOptions =
               UNAuthorizationOptionAlert | UNAuthorizationOptionSound | UNAuthorizationOptionBadge;
               [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:authOptions completionHandler:^(BOOL granted, NSError * _Nullable error) {
               }];
               #endif
           }
       }
    
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [VizuryEventLogger registerForPushWithToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    [VizuryEventLogger didFailToRegisterForPush];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    [VizuryEventLogger didReceiveRemoteNotificationInApplication:application withUserInfo:userInfo];
    if(application.applicationState == UIApplicationStateInactive) {
        NSLog(@"Appilication Inactive - the user has tapped in the notification when app was closed or in background");
        [self customPushHandler:userInfo];
    }
}

- (void) customPushHandler:(NSDictionary *)notification {
    if (notification !=nil && [notification objectForKey:@"deeplink"] != nil) {
        NSString* deeplink = [notification objectForKey:@"deeplink"];
        NSLog(@"%@",deeplink);
        // Here based on the deeplink you can open specific screens that's part of your app
    }
}

#if defined(__IPHONE_10_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
// Handle incoming notification messages while app is in the foreground.
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
            willPresentNotification:(UNNotification *)notification
            withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    NSDictionary *userInfo = notification.request.content.userInfo;
    NSLog(@"%@", userInfo);
    // Change this to your preferred presentation option
    completionHandler(UNNotificationPresentationOptionNone);
}

// Handle notification messages after display notification is tapped by the user.
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
                didReceiveNotificationResponse:(UNNotificationResponse *)response
                withCompletionHandler:(void (^)(void))completionHandler {
    NSDictionary *userInfo = response.notification.request.content.userInfo;
    [VizuryEventLogger didReceiveResponseWithUserInfo:userInfo];
    
    // Print full message.
    NSLog(@"%@", userInfo);
    completionHandler();
}
#endif

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
