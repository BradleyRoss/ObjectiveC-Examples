//
//  AppDelegate.m
//  experiments
//
//  Created by Bradley Ross on 2/11/21.
//

#import "AppDelegate.h"
#import "experimentalClasses.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
   // NSView *testView = [mainMenu menu];
    NSView *testMenu = [mainMenu menu];
    NSView *topView = _window.contentView;
    [topView addSubview:testMenu];
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
