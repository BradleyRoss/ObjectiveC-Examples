//
//  LocalClasses.m
//  BRossTools
//
//  Created by Bradley Ross on 2/1/21.
//

#import <Foundation/Foundation.h>
# import "BRossTools.h"
# import "LocalClasses.h"


//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

/**
  * Creates the main menu for display on the first window.
 */
@implementation mainMenu
+ (void)bleep:(id)sender {

    NSString *message = [sender getIdent];
        if (message == nil){
            NSLog(@"No identifier provided");
        }else {
            NSLog(@"bleep method entered: message is %@", message);
            if ([message isEqualToString:@"b1"]) {
                [e2 runtest];
                return;
            }
            if ([message isEqualToString:@"b2"]) {
                [test1 runtest];
                return;
            }
            if ([message isEqualToString:@"b3"]) {
                [test2 runtest];
                return;
            }
            if ([message isEqualToString:@"b4"]) {
                [test3 runtest];
                return;
            }
    
        }
}
/**
   Builds view containing main menu.
 
     @returns pointer to NSStackView object.
 https://stackoverflow.com/questions/36020540/why-is-instancetype-used
 */
+ (NSView *)menu {
    // NSStackView *stackView = [NSStackView alloc]
    
    BRossToolsButton *b1 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"This will trigger the e2 test which opens a window, colors it, and inserts a few text fields and buttons" ident:@"b1" ];
    BRossToolsButton *b2 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"run test1 new window plus fields" ident:@"b2" ];
    BRossToolsButton *b3 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"run test2 text handling window" ident:@"b3" ];

    BRossToolsButton *b4 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"run test3" ident:@"b4" ];
    NSStackView *stackView = [NSStackView stackViewWithViews:@[b1, b2, b3, b4]];
    stackView.orientation = NSUserInterfaceLayoutOrientationVertical;
    return stackView;
}
@end

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****


@implementation test1
/** Creates an array of three character strings and then displays them.
 */
+ (void)runtest {
    BRossToolsTextWindow *textWindow;
    textWindow = [BRossToolsTextWindow newWindow];
    textWindow.title=@"test1";
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

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

@implementation test2
+ (void) runtest{
    BRossToolsTextWindow *textWindow;
    textWindow = [BRossToolsTextWindow newWindow];
    textWindow.title=@"test2";
    [textWindow appendString:@"\nAdded line\n"];
}
@end

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

@implementation test3
+ (void) runtest {
    // NSScreen *thisScreen = [NSScreen mainScreen];
    // NSRect r1 = thisScreen.frame;
    BRossToolsTextWindow *textWindow;
    textWindow = [BRossToolsTextWindow newWindow];
    textWindow.title=@"test3";
    NSString *c1 = @"first string";
    NSString *c2 = @"second string";
    NSString  *c3 = [[NSString alloc] initWithString:c1];
    NSString  *c4 = [[NSString alloc] initWithString:c2];
    // [c3 initWithString:c1];
    // [c4 initWithString:c2];
    NSString *t1 =[NSString stringWithFormat:@" %@   %@   %@   %@ \n", c1, c2, c3, c4];
   //  [textWindow appendFormat:@" %@   %@   %@   %@", c1, c2, c3, c4];
    [textWindow appendString:t1];
    
    c3 = c1;
    c1 = c2;
    // NSString *t1 = [NSString alloc];
    NSString *t2 =[NSString stringWithFormat:@" %@   %@   %@   %@ \n ", c1, c2, c3, c4];
    NSLog(@"%@", t2);
    //[textWindow appendFormat:@" %@   %@   %@   %@", c1, c2, c3, c4];
    [textWindow appendString:t2];
    
    
   }
@end

@implementation test4
+ (void) runtest {
    BRossToolsTextWindow *textWindow;
    textWindow = [BRossToolsTextWindow newWindow];
    textWindow.title=@"test4 immutable/mutable";
}
@end
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

@implementation e2
+ (void)runtest {
   // SEL bleep1 = sel_registerName("bleep:");
    //  NSView *thisObject = [[NSView alloc] init];
   /*
      NSScreen is screen being used
    */
    NSScreen *thisScreen = [NSScreen mainScreen];
    NSRect r1 = thisScreen.frame;
    [e2 logSizePositionOf:&r1 title:@"Frame of screen" ];
    NSRect windowFrame;
    windowFrame.size = NSMakeSize (thisScreen.frame.size.width/2.0, thisScreen.frame.size.height*0.5);
    windowFrame.origin = NSMakePoint ((CGFloat)0.0,(CGFloat) 0.0);
   //  windowFrame.origin = NSMakePoint(screenFrame.size.width*0.1, screenFrame.size.height*0.1);
    NSUInteger style = NSWindowStyleMaskTitled | NSWindowStyleMaskResizable;
    
    NSWindow *thisWindow = [[NSWindow alloc] initWithContentRect:windowFrame styleMask:style backing:NSBackingStoreBuffered defer:NO];
 /*  Make a window */
    [thisWindow setTitle:@"test e2"];
    [thisWindow setBackgroundColor:[NSColor greenColor]];
    [thisWindow makeKeyAndOrderFront:NSApp];
    NSRect r3 = thisWindow.frame;
    [e2 logSizePositionOf:&r3 title:@"Frame of new window"];
    NSRect r4 = thisWindow.contentView.frame;
    [e2 logSizePositionOf:&r4 title:@"Frame of contentView of new window"];
    NSRect r5 = thisWindow.contentView.bounds;
    [e2 logSizePositionOf:&r5 title:@"Bounds of contentView of new window"];
    /*  Build a text field */
    /*
     NSRect is a struct
     f1 is an object of type NSTextField
     frame is a property of f1 and is a struct
     bounds is a property of f1 and is a struct
     origin and size are components of the NSRect struct
     
     https://forums.macrumors.com/threads/create-button-programmatically.740537/
     https://stackoverflow.com/questions/2455161/unrecognized-selector-sent-to-instance-error-in-objective-c
     
     you can use the value of f1.frame.origin.x in an expression (?)
     However, you can't assign a value to f1.frame.origin.x because it involves both
         property relationships of an object and components of a struct
     */
    NSTextField *f1 = [NSTextField textFieldWithString:@"First text"];
    [f1 setTextColor:[NSColor purpleColor] ];
    NSView *topView = thisWindow.contentView;
    NSRect f1Frame = f1.frame;
    f1Frame.origin = NSMakePoint((CGFloat) 100.0, (CGFloat) 150.0);
    f1.frame = f1Frame;
    [topView addSubview:f1];

    [e2 logSizePositionOf:&f1Frame title:@"Information on frame f1"];
    NSRect f1Bounds = f1.bounds ;
    [e2 logSizePositionOf:&f1Bounds title:@"Information on bounds of f1"];
    
    BRossToolsButton *b1 =[BRossToolsButton initUsingObjectIdent:self  selector:@selector(bleep:) caption:@"Show alert" ident:@"first"];
    NSRect b1Frame = b1.frame;
    b1Frame.origin = NSMakePoint((CGFloat) 100.0, (CGFloat) 50.0);
    b1.frame = b1Frame;
    BRossToolsButton *b2 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"Show second alert" ident:@"second"];
    //   Order of parameters is x, y   and width, height
    NSRect b2Frame = b2.frame;
    b2Frame.origin = NSMakePoint((CGFloat) 200.0, (CGFloat) 50.0);
    b2.frame = b2Frame;
    [topView addSubview:b1];
    [topView addSubview:b2];
}
+ (void)logSizePositionOf:(NSRect *)object title:(NSString *)titleString {
    NSLog(@"%@", titleString);
    NSLog(@"    width %f     height %f", object->size.width, object->size.height);
    NSLog(@"    x %f     y %f", object->origin.x, object->origin.y);
}
 + (void)bleep : (id)sender{
     if (sender == nil){
         NSLog(@"bleep used with identifying string");
     } else {
     NSLog(@"bleep entered message is %@", [sender getIdent]);
     }
 }
     @end

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

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
