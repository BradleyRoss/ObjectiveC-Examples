//
//  AppDelegate.m
//  ViewDemos
//
//  Created by Bradley Ross on 7/22/21.
//

#import "AppDelegate.h"
#import "TopLevel.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    initialize();
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
