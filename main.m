//
//  main.m
//  AutoLaunch
//
//  Created by Shraddha Arora on 04/08/23.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"
#import <ServiceManagement/ServiceManagement.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Initialize the app delegate
        // Create the NSApplication instance
                NSApplication *application = [NSApplication sharedApplication];
                AppDelegate *delegate = [[AppDelegate alloc] init];
                [application setDelegate:delegate];
                [application run];
        }
    return 0;
}
