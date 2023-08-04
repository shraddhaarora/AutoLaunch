//
//  AppDelegate.h
//  AutoLaunch
//
//  Created by Shraddha Arora on 04/08/23.
//

#import <Cocoa/Cocoa.h>
#import <ServiceManagement/ServiceManagement.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

- (void)registerForAutoLaunch:(SMAppService* ) appService;
- (void)unregisterFromAutoLaunch:(SMAppService* ) appService;
- (BOOL)isRegistered:(SMAppService* ) appService;

@end

