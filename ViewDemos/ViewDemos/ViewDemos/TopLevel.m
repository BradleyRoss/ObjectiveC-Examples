//
//  TopLevel.m
//  ViewDemos
//
//  Created by Bradley Ross on 7/22/21.
//

#import <Foundation/Foundation.h>
#import "TopLevel.h"
#import "AppDelegate.h"
DemoStarter *starterInstance;
void initialize() {
    NSLog(@"Starting initialize");
    starterInstance = [[DemoStarter alloc] init];
    [starterInstance startDemo:2];
    NSLog(@"StarterInstance startDemo finished");
    NSLog(@"initialize finished");
}

/**
 * @brief add constraints matching sizes
 * @param topView superview
 * @param demoView subview
 */
void setConstraints1(NSView *topView, NSView *demoView);

/**
 * @brief Add constraints matching centers of demoView and topView
 * @param topView superview
 * @param demoView subview
 */
void setConstraints2(NSView *topView, NSView *demoView);
/**
 * @brief  Adds a border to an NSView object.
 * @param view object to which border will be added.
 * * [CALayer](https://developer.apple.com/documentation/quartzcore/calayer?language=objc)
 *
 * * [NSView](https://developer.apple.com/documentation/appkit/nsview?language=objc)
 *
 * * CGColor is a struct that defines a color.  The value is set using the [NSColor](https://developer.apple.com/documentation/appkit/nscolor?language=objc) class.
 *
 * * There is a set of [predefined colors](https://developer.apple.com/documentation/appkit/nscolor/standard_colors?language=objc)
 *
 */
void addBorder(NSView *view);
/**

 * *  *[translatesAutoresizingMaskIntoConstraints](https://developer.apple.com/documentation/appkit/nsview/1526961-translatesautoresizingmaskintoco?language=objc) is a Boolean property of NSView.  For NSGridView, the layout of the cells within the grid depend on the contents of the views within the cell.  The constraints within the cell therefore can change based on the content, and converting them into constraints for the top view produces a set of views that have conflicts.
 */
@implementation DemoStarter

- (void) startDemo:(NSInteger)number {
    NSLog(@"Starting DemoStarter");
    NSWindow *newPanel;
    CGPoint origin;
        CGRect rectangle;
        origin.x = 100.0;
        origin.y = 250.0;
        // Parameters are width followed by height
        NSSize newSize = NSMakeSize(700.0, 700.0);
        rectangle.origin = origin;
        rectangle.size = newSize;
        /*
            NSBorderlessWindowMask deprecated
            but appears in developer documentation
            for [NSWindow initWithContentRect:styleMask:backing:defer ]
         */
    NSWindowStyleMask style = NSWindowStyleMaskTitled + NSWindowStyleMaskClosable + NSWindowStyleMaskResizable + NSWindowStyleMaskMiniaturizable;
        newPanel = [[NSWindow alloc] initWithContentRect:rectangle
                styleMask: style
                backing:NSBackingStoreBuffered
                defer:YES];
    [newPanel orderFront:self];
    NSView *topView;
    NSView *demoView;
    topView = newPanel.contentView;
    
    if (number ==1) {
        newPanel.title= @"Stack View";
        demoView = [StackDemo runDemo];
        demoView.translatesAutoresizingMaskIntoConstraints = NO;
        
 
    } else if (number ==2) {
        /*
         * These lines don't seem to make a difference
         */
        // NSUInteger resizeMask = NSViewHeightSizable | NSViewWidthSizable;
        // topView.autoresizingMask = resizeMask;
        //topView.autoresizesSubviews = YES;
        /*
         * End of lines that don't make a difference
         */
        newPanel.title = @"Grid View";
        demoView = [GridDemo runDemo];
        /*
         * See https://developer.apple.com/documentation/appkit/nsview/1526961-translatesautoresizingmaskintoco?language=objc         */
        demoView.translatesAutoresizingMaskIntoConstraints = NO;


    }
    NSLog(@"Point 1");
        [topView addSubview:demoView];
    setConstraints2(topView, demoView);
    NSLog(@"topView ContentSizeConstraint  Horizontal:%@  Vertical:%@", topView.isHorizontalContentSizeConstraintActive?@"YES":@"NO", topView.isVerticalContentSizeConstraintActive?@"YES":@"NO");
    NSLog(@"demoView ContentSizeConstraint  Horizontal:%@  Vertical:%@", demoView.isHorizontalContentSizeConstraintActive?@"YES":@"NO", demoView.isVerticalContentSizeConstraintActive?@"YES":@"NO");
    NSLog(@"hidden top:%@  demo:%@", topView.hidden?@"YES":@"NO", demoView.hidden?@"YES":@"NO");
    // NSLog(@"Point 2");
    [newPanel setOrderedIndex:0];
    // NSLog(@"Point 3");
    /*
     * Constraints can't be implemented until after demoView has
     * been added as a subview of topView
     */

}
@end

void setConstraints1(NSView *topView, NSView *demoView) {
    /*  Set Constraints */
    // demoView.Height = 1.0 * topView.Height -10
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint
                                            constraintWithItem:demoView
                                            attribute:NSLayoutAttributeHeight
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:topView
                                            attribute:NSLayoutAttributeHeight
                                            multiplier:1.0
                                            constant:-10];
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint
                                            constraintWithItem:demoView
                                            attribute:NSLayoutAttributeWidth
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:topView
                                            attribute:NSLayoutAttributeWidth
                                            multiplier:1.0
                                            constant:-10];
[topView addConstraints:@[heightConstraint, widthConstraint]];
}

void setConstraints2(NSView *topView, NSView *demoView) {
    /*  Set Constraints */
    // demoView.Height = 1.0 * topView.Height -10
    NSLayoutConstraint *verticalConstraint = [NSLayoutConstraint
                                            constraintWithItem:demoView
                                            attribute:NSLayoutAttributeCenterY
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:topView
                                            attribute:NSLayoutAttributeCenterY
                                            multiplier:1.0
                                            constant:0];
    NSLayoutConstraint *horizontalConstraint = [NSLayoutConstraint
                                            constraintWithItem:demoView
                                            attribute:NSLayoutAttributeCenterX
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:topView
                                            attribute:NSLayoutAttributeCenterX
                                            multiplier:1.0
                                            constant:0];
[topView addConstraints:@[verticalConstraint, horizontalConstraint]];
}
/*
 *  Is the only way to provide the NSGridCell objects themselves with borders and
 *  background colors to plae an outer view that fills the cell with an inner
 *  view that contains the specified view in the specified position.
 */
void addBorder(NSView *view) {
    NSLog(@"Executing addBorder");
    // CALayer *layer = view.layer;
    /*
     borderWidth = 1.0f;
    
    NSColor *color = [ NSColor colorWithRed:0.5f green:0.5f blue:1.0f alpha:1.0 ];
    NSColor *color2 = [ NSColor colorWithRed:1.0f green:0.3f blue:1.0f alpha:1.0 ];
    // layer.backgroundColor = color;
    // layer.backgroundColor =   color;
    // layer.backgroundColor =   (__bridge CGColorRef _Nullable)color;
    // layer.borderColor  = [NSColor getBlackColor];
     */
}

@implementation StackDemo:NSStackView
+ (NSStackView*)  runDemo {
    NSLog(@"Starting StackView runDemo");
    NSButton *b1 = [NSButton buttonWithTitle:@"First" target:nil  action:nil];
    NSButton *b2 = [NSButton buttonWithTitle:@"Second" target:nil action:nil];
    NSStackView *stackView = [NSStackView  stackViewWithViews:@[ b1, b2]];
    stackView.orientation = NSUserInterfaceLayoutOrientationVertical;
    return stackView;
}
@end



@implementation GridDemo:NSGridView
+ (NSGridView*)  runDemo {
    NSLog(@"Starting GridDemo runDemo");
    // NSSize newSize = NSMakeSize(300.0, 300.0);
    NSArray *fields = @[@"Top", @"Bottom", @"Center", @"Fill", @"Inherited", @"Leading", @"None", @"Trailing"];
    NSInteger placements[] = { NSGridCellPlacementTop, NSGridCellPlacementBottom, NSGridCellPlacementCenter, NSGridCellPlacementFill, NSGridCellPlacementInherited, NSGridCellPlacementLeading, NSGridCellPlacementNone, NSGridCellPlacementTrailing };
    NSLog(@" fields: %@", fields);
    // NSLog(@" placements %@", placements);
    // NSButton *b1 = [NSButton buttonWithTitle:@"First" target:self  action:nil];
    // NSButton *b2 = [NSButton buttonWithTitle:@"Second" target:self action:nil];
    // NSButton *b3 = [NSButton buttonWithTitle:@"Long title for button" target:self action:nil];
    // NSTextField *leftSpacer = [NSTextField wrappingLabelWithString:@"1\n2"];
    NSTextField *topSpacer = [NSTextField labelWithString:@"This shows placement of the information in the grid cell"];
    // NSTextField *contents = [NSTextField textFieldWithString:@"CONTENTS"];
    // NSTextField *shortLabel = [NSTextField textFieldWithString:@"Grid View"];
    NSGridView *gridView = [NSGridView gridViewWithNumberOfColumns:3 rows:11];
    gridView.wantsLayer=YES;
    // CGColorRef *color1 = NSColor.redColor;
    // gridView.layer.backgroundColor = (NSColor) NSColor.redColor;
    addBorder(gridView);
    [gridView addRowWithViews:@[[NSTextField labelWithString:@"xxx"], [NSTextField labelWithString:@"xxx"], [NSTextField labelWithString:@"xx"], topSpacer]];
    for (int i=0; i<8; i++) {
        // NSLog(@"Adding row");
        NSView *v1 = [NSTextField wrappingLabelWithString:@"1\n2\n3"];
        NSView *v2 = [ NSTextField wrappingLabelWithString:fields[i]];
        // NSView *v2 = [ NSTextField wrappingLabelWithString:@"xx"];
        NSView *v3 = [NSTextField wrappingLabelWithString:@"CONTENTS"];
        NSView *v4 = [NSTextField labelWithString:@"CONTENTS"];
        addBorder(v3);
        addBorder(v4);
        [gridView addRowWithViews:@[v1, v2, v4, v3 ]];
        NSGridCell *cell = [gridView cellForView:v3];
        cell.xPlacement = placements[i];
        cell = [gridView cellForView:v4];
        cell.yPlacement = placements[i];
    }
    NSLog(@"Number of columns: %ld", (long)[gridView numberOfColumns]);
    NSSize fittingSize = gridView.fittingSize;
    NSLog(@"fittingSize  height:%f  width:%f", fittingSize.height, fittingSize.width);
    // NSLog(@"  ", gridView.size)
    NSLog(@"gridDemo complete");
    return gridView;
}
@end
/**
 * @brief Demonstrator for tab view.
 */
@implementation TabDemo:NSTabView
+ (NSStackView*)  runDemo {
    return nil;
}
@end
