//
//  BRossTools.m
//  BRossTools
//
//  Created by Bradley Ross on 1/31/21.
//

#import <Foundation/Foundation.h>
#import "BRossTools.h"
NSWindow *superview;
@implementation BRossToolsSimpleGridMenu 
/**
 Allocates and initializes object
 */
NSWindow *owningWindow;
BRossToolsSimpleGridMenu *gridView;
+ (void)createMainMenuForWindow:(NSWindow *)window {
    gridView = [BRossToolsSimpleGridMenu alloc];
    owningWindow = window;
    [gridView setLabels ];
    [owningWindow.contentView addSubview:gridView];
    [gridView setFrameSize:owningWindow.frame.size];

   // [owningWindow.contentViewController addChildViewController:gridView];
    
}
/*
+ (id)start {
    id pointer;
    pointer = [[BRossToolsSimpleGridMenu alloc] init];
    
    return pointer;
}
 */


/**
       Take action based on the grid selected.
 
               The code below is a dummy entry that will simply post an alert panel indicating which
            option was selected.  Actual cases will need to subclass and override this method.
 */
- (void)processAction:(NSString *)caseNumber {
    NSAlert *alert = [[NSAlert alloc] init];
    [alert addButtonWithTitle:@"Continue"];
    [alert setMessageText:caseNumber];
    [alert setAlertStyle:NSAlertStyleInformational];
    [alert runModal];
    //NSModalResponse response = [alert runModal];
}
- (void)setLabels {
   
       
    // Create text fields
        NSTextField *t11 = [NSTextField labelWithString:@"First Field"];
        t11.bordered = TRUE;
        NSTextField *t12 = [NSTextField labelWithString:@"Second Half"];
        NSTextField *t2 = [NSTextField labelWithString:@"Second Field"];
        t2.bordered = TRUE;
        NSTextField *t3 = [NSTextField labelWithString:@"Third Field"];
        t3.bordered = TRUE;
     
    // Create the NSGridView object
        NSGridView *gridView = [NSGridView gridViewWithViews:@[ @[t11, t12], @[t2], @[t3] ] ];
    // Obtain the content view for the main window of the application
        
   
    // Apply constraints
        gridView.translatesAutoresizingMaskIntoConstraints = false;
        gridView.rowAlignment = NSGridRowAlignmentFirstBaseline;
      
       
    
}
@end

@implementation BRossToolsTextWindow

NSTextStorage *stringContents;
+ (id)newWindow {
    id pointer = [[BRossToolsTextWindow alloc] init];

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
    NSPanel *newPanel = [[NSPanel alloc] initWithContentRect:rectangle
            styleMask: NSWindowStyleMaskBorderless
            backing:NSBackingStoreBuffered
            defer:YES];
    NSRect windowFrame = [newPanel frame];
   //  NSView *windowView = [newPanel contentView];
   /* NSScrollView *scrollview = [NSScrollView frameSizeForContentSize:contentSize
       ]; */
    NSScrollView *scrollview = [[NSScrollView alloc] initWithFrame:windowFrame];
    // NSSize contentSize = windowFrame.contentSize;
    NSRect contentRect = windowFrame;
    NSSize contentSize = contentRect.size;
               
  
     
    [scrollview setBorderType:NSNoBorder];
    [scrollview setHasVerticalScroller:YES];
    [scrollview setHasHorizontalScroller:NO];
    [scrollview setAutoresizingMask:NSViewWidthSizable |
                NSViewHeightSizable];
    NSTextView *theTextView;
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
    NSViewController *viewController;
    viewController = [[NSViewController alloc] init];
    viewController.view = scrollview;
    // NSPanel *panel = [NSPanel alloc];
    NSPanel *panel =[NSPanel windowWithContentViewController:viewController];
    
    [scrollview setDocumentView:theTextView];
    [panel setContentView:scrollview];
    [panel makeKeyAndOrderFront:nil];
    [panel makeFirstResponder:theTextView];
    [[theTextView enclosingScrollView] setHasHorizontalScroller:YES];
    [theTextView setHorizontallyResizable:YES];
    [theTextView setAutoresizingMask:(NSViewWidthSizable | NSViewHeightSizable)];
    [[theTextView textContainer] setContainerSize:NSMakeSize(FLT_MAX, FLT_MAX)];
    [[theTextView textContainer] setWidthTracksTextView:NO];
    [theTextView setString:@"This is an initial string\rSecond Line"];
    stringContents = theTextView.textStorage;
    return pointer;
}
/**
      Add some text to the window.
 
           The xCode system seems to be saying that aString is not being used, but it is used in the next line.
 */
- (void)appendString:(NSString *)string {
    NSAttributedString *aString = [NSAttributedString alloc];
    [aString  initWithString:string];
    [stringContents appendAttributedString:aString];
}
- (void)appendFormat:(NSString *)format, ...{
    NSLog(@"Starting BRossToolsTextWindow appendFormat");
    /*
    NSString *formattedString = [NSString alloc];
    [formattedString  initWithFormat:format];
    NSAttributedString *aString = [NSAttributedString alloc];
    [aString initWithString:formattedString];
     */
    NSString *formattedString = [[NSString alloc]
                                 initWithFormat: format];
    // Somehow formattedString is nil
    
    NSAttributedString *aString = [[NSAttributedString alloc]
    initWithString:formattedString];
    [stringContents appendAttributedString:aString];
}
@end


@implementation BRossToolsButtonView
/**
 Creates an object contaning vie aw of a button to insert in grid view
 
 @param targetObject id for object that will receive action from button
 @param selector character string that will identify button to target object
 @param label caption for button
 */

+ (id)CreateButtonViewUsingObject:(id)targetObject  selector:(NSString *)selector caption:(NSString *)label {
    // SEL *a = NSFunctionFromString(selector);//
    SEL aSelector = NSSelectorFromString(@"runtest");
    NSButton *button = [NSButton buttonWithTitle:label target:targetObject action:aSelector];
    return button;
}

@end




