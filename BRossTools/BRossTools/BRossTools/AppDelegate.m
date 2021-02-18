//
//  AppDelegate.m
//  BRossTools
//
//  Created by Bradley Ross on 1/31/21.
//

#import "AppDelegate.h"
#import "BRossTools.h"


@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  
    NSView *testMenu = [mainMenu menu];
    NSView *topView = _window.contentView;
    [topView addSubview:testMenu];
    
    
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
    
}


    
    

@end
