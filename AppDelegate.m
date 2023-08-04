//
//  AppDelegate.m
//  AutoLaunch
//
//  Created by Shraddha Arora on 04/08/23.
//

#import <Cocoa/Cocoa.h>
#import <AppKit/AppKit.h>
#include <ServiceManagement/ServiceManagement.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {

    NSWindow *window = [[NSWindow alloc] initWithContentRect:NSMakeRect(100, 100, 500, 500) styleMask:(NSWindowStyleMaskTitled | NSWindowStyleMaskClosable) backing:NSBackingStoreBuffered defer:NO];

    NSButton *button1 = [[NSButton alloc] initWithFrame:NSMakeRect(50, 20, 175, 50)];
    [button1 setTitle:@"Register for autolaunch"];

    NSButton *button2 = [[NSButton alloc] initWithFrame:NSMakeRect(230, 20, 175, 50)];
    [button2 setTitle:@"Unregister for autolaunch"];

    [window.contentView addSubview:button1];
    [window.contentView addSubview:button2];
    
    [button2 setAction:@selector(buttonClicked:)];
    [button1 setAction:@selector(regisClicked:)];
    
    [window makeKeyAndOrderFront:nil];
    
}

- (void)buttonClicked:(id)sender {
    [self unregisterFromAutoLaunch];
}

- (void)regisClicked:(id)sender {
    [self registerForAutoLaunch];
}

- (BOOL)isRegistered:(SMAppService *)appService {
    SMAppServiceStatus status = appService.status;
    if (status == SMAppServiceStatusEnabled)
        return TRUE;
    else
        return FALSE;
}

- (void)registerForAutoLaunch {
    SMAppService *appService = [[SMAppService alloc] init];
    bool isSet = [self isRegistered: appService];
    if(isSet)
        NSLog(@"App already present in login items");
    else {
        NSError *enableError = nil;
        BOOL launchOnLoginEnable = [appService registerAndReturnError:&enableError];
        if (launchOnLoginEnable) {
            NSLog(@"Added to login items!");
        } else {
            NSLog(@"Enabling failed with error: %@", enableError);
        }
    }
}

- (void)unregisterFromAutoLaunch {
    SMAppService *appService = [[SMAppService alloc] init];
    bool isSet = [self isRegistered: appService];
    if(isSet){
        NSError *disableError = nil;
        BOOL launchOnLoginDisable = [appService unregisterAndReturnError:&disableError];
        if (launchOnLoginDisable) {
            NSLog(@"Removed from login items!");
        } else {
            NSLog(@"Disabling failed with error: %@", disableError);
        }
    }
    else{
        NSLog(@"Item not present in login items!");
    }
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
