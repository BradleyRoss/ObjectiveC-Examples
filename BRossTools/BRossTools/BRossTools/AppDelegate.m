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
    NSLog(@"aaa  applicationDidFinishLoading");
    // [test2 runtest];
    [redoMenu createMainMenu:_window];
   // [mainMenu createMainMenuForWindow:_window];
   // BRossToolsDocument *document =
    
    
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
    
}


    
    

@end
