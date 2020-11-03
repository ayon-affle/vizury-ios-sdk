//
//  VizuryRichNotification.h
//  VizuryRichNotification
//
//  Created by Anurag on 10/10/17.
//  Copyright © 2017 Vizury. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>
#import <UserNotificationsUI/UserNotificationsUI.h>

@interface VizuryRichNotification : NSObject

/**
 * Call this to get an instance of type VizuryRichNotification
 **/
+(VizuryRichNotification*_Nonnull) getInstance;
/**
 * Call this method to handle a rich media notification
 **/
- (void) didReceiveNotificationRequest:(UNNotificationRequest *_Nullable)request withContentHandler:(void (^_Nullable)(UNNotificationContent * _Nonnull))contentHandler;

- (void)didReceiveNotification:(UNNotification *_Nonnull)notification withImageView: (UIImageView*_Nonnull) imageView;
- (void)didReceiveNotificationResponse:(UNNotificationResponse *_Nullable)response completionHandler:(void (^_Nonnull)(UNNotificationContentExtensionResponseOption))completion;

@end
