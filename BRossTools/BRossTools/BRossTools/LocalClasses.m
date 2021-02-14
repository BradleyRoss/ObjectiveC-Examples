//
//  LocalClasses.m
//  BRossTools
//
//  Created by Bradley Ross on 2/1/21.
//

#import <Foundation/Foundation.h>
# import "BRossTools.h"
# import "LocalClasses.h"

@implementation test1
/** Creates an array of three character strings and then displays them.
 */
+ (void)runtest {
    BRossToolsTextWindow *textWindow;
    textWindow = [BRossToolsTextWindow newWindow];
    NSMutableArray* stringArray = [NSMutableArray new];
    [stringArray addObject:@"aaa"];
    [stringArray addObject:@"This is bbb"];
    [stringArray addObject:@"ccc"];
    [textWindow appendString:@"\n"];
    NSUInteger count = stringArray.count;
    [textWindow appendString:@"\n This is the test1 test case"];
    [textWindow appendString:@"\n It creates three character strings, puts them in an"];
    [textWindow appendString:@"\n array, and then prints them"];
    [textWindow appendString:@"\n"];
    int i;
    for (i=0; i<count; i++) {
        [textWindow appendString:@"\n"];
        [textWindow appendString:@"   "];
        [textWindow appendString:stringArray[i]];
    }
    // NSString *expand = [NSString alloc];
   // [expand initWithFormat:@"\n%@\n" arguments:stringArray];
    // [textWindow appendString:stringArray];
    // NSLog(@"\n%@\n", stringArray);
   // [textWindow appendString:expand];
}
@end
@implementation test2
+ (void) runtest{
    BRossToolsTextWindow *textWindow;
    textWindow = [BRossToolsTextWindow newWindow];
    [textWindow appendString:@"\nAdded line\n"];
}
@end

@implementation test3
+ (void) runtest {
    BRossToolsSimpleGridMenu *object = [[BRossToolsSimpleGridMenu alloc] init];
    [object processAction:@"xxx"];}
@end
/**
 Create main menu.
 */
@implementation mainMenu
NSWindow *owningWindow;
BRossToolsSimpleGridMenu *gridView;
+ (void)createMainMenuForWindow:(NSWindow *)aWindow {
    NSRect windowFrame = aWindow.frame;
    NSLog(@"createMenuForWindow");
    NSLog(@"%@",aWindow);
    NSLog(@"windowNumber %lu", [aWindow windowNumber]);
    gridView = [[BRossToolsSimpleGridMenu alloc] initWithFrame:windowFrame];
    owningWindow = aWindow;
    [gridView setLabels ];
    [aWindow.contentView addSubview:gridView];
    NSLog(@"gridView  %@", gridView);
    NSPoint origin = NSMakePoint((CGFloat) 0.0, (CGFloat)0.0);
    NSSize size = NSMakeSize((CGFloat) 1000.0, (CGFloat)1000.0);
    [gridView setBoundsSize:size];
    [gridView setBoundsOrigin:origin];
    [gridView display];
    
}
- (void)setLabels {
    NSLog(@"Running setLabels from mainMenu class ");
    // Create text fields
   //  NSGridView *gridView = [NSGridView alloc];
    
    BRossToolsButtonView *b1 = [BRossToolsButtonView CreateButtonViewUsingObject:gridView selector:@"runtest" caption:@"Test of using NSString Objects"];
    BRossToolsButtonView *b2 = [ BRossToolsButtonView CreateButtonViewUsingObject:gridView selector:@"runtest" caption:@"Test creating text Window"];
    BRossToolsButtonView *b3 = [ BRossToolsButtonView CreateButtonViewUsingObject:gridView selector:@"runtest" caption:@"Test of clicking button"];
     
    // Create the NSGridView object
    [gridView addRowWithViews:@[b1]];
    [gridView addRowWithViews:@[b2]];
    [gridView addRowWithViews:@[b3]];
    NSLog(@"gridView %@", gridView.subviews );
    NSLog(@" gridView array size %li", [gridView.subviews count]);
    // Obtain the content view for the main window of the application
        
   
    // Apply constraints
        gridView.translatesAutoresizingMaskIntoConstraints = false;
        gridView.rowAlignment = NSGridRowAlignmentFirstBaseline;
      
       
    
}
- (void) processAction:(NSString *)caseNumber {
    // NSLog(@"%@", caseNumber);
      
    if ([caseNumber caseInsensitiveCompare:(@"0")]) {

        return;
    }
    if ([caseNumber caseInsensitiveCompare:@"1"]) {
        [test1 runtest];
        return;
    }
    if ([caseNumber caseInsensitiveCompare:(@"2")]) {
        [test2 runtest];
        return;
    }
    if ([caseNumber caseInsensitiveCompare:@"3"]) {
        [test3 runtest];
        return;
    }
}
@end
@implementation BRossToolsView
+ (void) displayView:(NSString*)name view:(NSView*)target {
    NSLog(@"Name of view is %@", name );
    NSLog(@"Bounds represent dimensions in view's coordinate system");
    NSLog(@"        width %f , height %f", target.bounds.size.width, target.bounds.size.height);
    NSLog(@"        x %f , y %f", target.bounds.origin.x, target.bounds.origin.y);
    NSLog(@"Frame respresent dimensions in superview's coordinate system\n");
    NSLog(@"        width %f , height %f\n", target.frame.size.width, target.frame.size.height);
    NSLog(@"        x %f , y %f\n", target.frame.origin.x, target.frame.origin.y);
}
+ (void) displayToLog:(NSString*)name view:(NSView*)target output:(BRossToolsTextWindow *)output {
    [output appendString:@"\n.....  .....\n"];
    [output appendFormat:@"Name of view is %@ \n", name ];
    [output appendFormat:@"Bounds represent dimensions in view's coordinate system \n"];
    [output appendFormat:@"        width %f , height %f \n", target.bounds.size.width, target.bounds.size.height];
    [output appendFormat:@"        x %f , y %f \n", target.bounds.origin.x, target.bounds.origin.y];
    [output appendFormat:@"Frame respresents dimensions in superview's coordinate system \n"];
    [output appendFormat:@"        width %f , height %f \n", target.frame.size.width, target.frame.size.height];
    [output appendFormat:@"        x %f , y %f \n", target.frame.origin.x, target.frame.origin.y];
}
@end
@implementation redoMenu
NSWindow *owningWindow;
NSGridView *gridView;
NSView *windowView;
BRossToolsTextWindow *textWindow;
+ (id) createMainMenu:(NSWindow*)window {
    textWindow = [BRossToolsTextWindow newWindow];
    owningWindow = window;
    NSRect windowFrame = owningWindow.frame;

    gridView = [NSGridView alloc];
    windowView = window.contentView;
    NSRect windowViewBounds = windowView.bounds;
    NSRect windowViewFrame = windowView.frame;
    NSTextField *t2 = [NSTextField textFieldWithString:@"second line  2"];
    [t2 isBordered];
    NSTextField *t1a = [NSTextField textFieldWithString:@"first line  1a"];
    NSTextField *t1b = [NSTextField textFieldWithString:@"Second half first line  1b"];
   //
    // https://stackoverflow.com/questions/1210047/cocoa-whats-the-difference-between-the-frame-and-the-bounds
    gridView = [gridView initWithFrame:windowViewBounds];
    // gridView = [NSGridView gridViewWithViews:@[@[t1a, t1b], @[t2]]];
    // Apply constraints
    gridView.translatesAutoresizingMaskIntoConstraints = false;
        gridView.rowAlignment = NSGridRowAlignmentFirstBaseline;
    // NSPoint NSMakePoint(CGFloat x, CGFloat y);
    [gridView setBoundsOrigin:NSMakePoint((CGFloat)0.0, (CGFloat)0.0)];
    // NSSize NSMakeSize(CGFloat w, CGFloat h);
    // Increasing bounds size makes size of things in region smaller
    [gridView setBoundsSize:NSMakeSize((CGFloat)1000.0, (CGFloat)500.0)];
    [gridView addRowWithViews:@[t1a, t1b]];
    [gridView addRowWithViews:@[t2]];
    [windowView addSubview:gridView];
    [gridView setHidden:NO];
    [BRossToolsView displayToLog:@"gridView" view:gridView output:textWindow];
    [BRossToolsView displayToLog:@"t1a" view:t1a output:textWindow];
    [BRossToolsView displayToLog:@"t1b" view:t1b output:textWindow];
    return gridView;
}

@end
