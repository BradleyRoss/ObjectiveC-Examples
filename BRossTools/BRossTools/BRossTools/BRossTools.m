//
//  BRossTools.m
//  BRossTools
//
//  Created by Bradley Ross on 1/31/21.
//

#import <Foundation/Foundation.h>
#import "BRossTools.h"
NSWindow *superview;

@implementation BRossToolsTextWindow
/*
 Using a class method that allocates and then an instance method that finishes off the
 rest of the initialization
 */
+ (instancetype)newWindow {
    id  pointer = [BRossToolsTextWindow alloc];
    [pointer initTextWindow];
    return pointer;
}
-   (void)initTextWindow {
    CGPoint origin;
    CGRect rectangle;
    origin.x = -2000.0;
    origin.y = 00.0;
    // Parameters are width followed by height
    NSSize newSize = NSMakeSize(500.0, 1000.0);
    rectangle.origin = origin;
    rectangle.size = newSize;
    /*
        NSBorderlessWindowMask deprecated
        but appears in developer documentation
        for [NSWindow initWithContentRect:styleMask:backing:defer ]
     */
    newPanel = [[NSWindow alloc] initWithContentRect:rectangle
            styleMask: NSWindowStyleMaskBorderless
            backing:NSBackingStoreBuffered
            defer:YES];
    NSRect windowFrame = [newPanel frame];
   //  NSView *windowView = [newPanel contentView];
   /* NSScrollView *scrollview = [NSScrollView frameSizeForContentSize:contentSize
       ]; */
    scrollview = [[NSScrollView alloc] initWithFrame:windowFrame];
    // NSSize contentSize = windowFrame.contentSize;
    NSRect contentRect = windowFrame;
    NSSize contentSize = contentRect.size;
               
  
     
    [scrollview setBorderType:NSNoBorder];
    [scrollview setHasVerticalScroller:YES];
    [scrollview setHasHorizontalScroller:NO];
    [scrollview setAutoresizingMask:NSViewWidthSizable |
                NSViewHeightSizable];
    theTextView = [[NSTextView alloc] initWithFrame:NSMakeRect(0, 0,
                contentSize.width, contentSize.height)];
    [theTextView setMinSize:NSMakeSize(0.0, contentSize.height)];
    [theTextView setMaxSize:NSMakeSize(FLT_MAX, FLT_MAX)];
    [theTextView setVerticallyResizable:YES];
    [theTextView setHorizontallyResizable:NO];
    [theTextView setAutoresizingMask:NSViewWidthSizable];
     
    [[theTextView textContainer]
                setContainerSize:NSMakeSize(contentSize.width, FLT_MAX)];
    [[theTextView textContainer] setWidthTracksTextView:YES];
    viewController = [[NSViewController alloc] init];
    viewController.view = scrollview;
    // NSPanel *panel = [NSPanel alloc];
    displayPanel =[NSWindow windowWithContentViewController:viewController];
    
    [scrollview setDocumentView:theTextView];
    [displayPanel setContentView:scrollview];
    [displayPanel makeKeyAndOrderFront:nil];
    [displayPanel makeFirstResponder:theTextView];
    [[theTextView enclosingScrollView] setHasHorizontalScroller:YES];
    [theTextView setHorizontallyResizable:YES];
    [theTextView setAutoresizingMask:(NSViewWidthSizable | NSViewHeightSizable)];
    [[theTextView textContainer] setContainerSize:NSMakeSize(FLT_MAX, FLT_MAX)];
    [[theTextView textContainer] setWidthTracksTextView:NO];
    [theTextView setEditable:YES];
    [theTextView setSelectable:YES];
    // [theTextView setString:@"This is an initial string\rSecond Line"];
     stringContents = theTextView.textStorage;
    
}
- (NSString *)getTitle {
    return displayPanel.title;
}
- (void)setTitle:(NSString *)title {
    NSLog(@"Setting window title to %@", title);
    displayPanel.title=title;
}
/**
      Add some text to the window.
 
           The xCode system seems to be saying that aString is not being used, but it is used in the next line.
 */
- (void)appendString:(NSString *)string {
    NSAttributedString *aString = [[NSAttributedString alloc] initWithString:string];
    /*
     Xcode is saying that aString is not used (Expression result unused)
     even though it is used in the next line.
     
     It appears to depend on whether alloc and init are in same statement
     Putting them in same statement removed message
     */
    // [aString  initWithString:string];
    [stringContents appendAttributedString:aString];
}
/*
 Can't get this to work.
 */
- (void)appendFormat:(NSString *)format, ...{
    NSLog(@"Starting BRossToolsTextWindow appendFormat");
    /*
    NSString *formattedString = [NSString alloc];
    [formattedString  initWithFormat:format];
    NSAttributedString *aString = [NSAttributedString alloc];
    [aString initWithString:formattedString];
     */
    /*
     The following line is giving me the message
     Format string is not a string literal (potentially insecure
     However, this is exactly the way that the instance method of intitWithFormat for NSString works.
     */
    // NSString *formattedString = [[[NSString alloc] stringWithFormat: format ...] ];
    // Somehow formattedString is nil
   /*
    NSAttributedString *aString = [[NSAttributedString alloc]
    initWithString:formattedString];
    [stringContents appendAttributedString:aString];*/
}
@end

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

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




