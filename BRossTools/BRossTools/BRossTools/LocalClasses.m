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
