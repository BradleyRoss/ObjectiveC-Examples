//
//  experimentalClasses.m
//  experiments
//
//  Created by Bradley Ross on 2/11/21.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import "experimentalClasses.h"

@implementation mainMenu
+ (void)bleep:(id)sender {

    NSString *message = [sender getIdent];
        if (message == nil){
            NSLog(@"No identifier provided");
        }else {
            if ([message isEqualToString:@"b1"]) {
                [e2 runtest];
            }
    NSLog(@"bleep method entered: message is %@", message);
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
    BRossToolsButton *b2 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"button2" ident:@"b2" ];
    BRossToolsButton *b3 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"button3" ident:@"b3" ];
    BRossToolsButton *b4 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"button4" ident:@"b4" ];
    NSStackView *stackView = [NSStackView stackViewWithViews:@[b1, b2, b3, b4]];
    stackView.orientation = NSUserInterfaceLayoutOrientationVertical;
    return stackView;
}
@end

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

@implementation e2
+ (void)runtest {
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
 /*
 https://stackoverflow.com/questions/1018195/objective-c-calling-selectors-with-multiple-arguments
 https://stackoverflow.com/questions/2455161/unrecognized-selector-sent-to-instance-error-in-objective-c *
 */
     @implementation BRossToolsButton
NSString *identValue;
+ (instancetype)initUsingObject:targetObject  selector:(SEL)select caption:(NSString *)label {
    // SEL *a = NSFunctionFromString(selector);//
    // SEL bleep1 = sel_registerName("bleep:");
    BRossToolsButton *button = [BRossToolsButton buttonWithTitle:label target:targetObject action:select];
    identValue = nil;
    return button;
}
+ (instancetype)initUsingObjectIdent:targetObject  selector:(SEL)select caption:(NSString *)label ident:(NSString *)ident {
    BRossToolsButton *button = [BRossToolsButton buttonWithTitle:label target:targetObject action:select];
    [button setIdent:ident];
    return button;
}
- (NSString *)getIdent  {
    return identValue;
}
- (void)setIdent:ident {
    identValue = ident;
}
@end


