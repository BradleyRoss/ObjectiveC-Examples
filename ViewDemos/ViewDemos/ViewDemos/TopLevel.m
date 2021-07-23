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
}
void setConstraints(NSView *topView, NSView *demoView);
/*
 *  https://developer.apple.com/documentation/appkit/nsview?language=objc
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
        NSSize newSize = NSMakeSize(500.0, 500.0);
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
        setConstraints(topView, demoView);
    } else if (number ==2) {
        NSUInteger resizeMask = NSViewHeightSizable | NSViewWidthSizable;

        topView.autoresizingMask = resizeMask;
        newPanel.title = @"Grid View";
        topView.autoresizesSubviews = YES;
        topView.translatesAutoresizingMaskIntoConstraints = NO;
        demoView = [GridDemo runDemo];
    
        NSLog(@"topView ContentSizeConstraint  Horizontal:%@  Vertical:%@", topView.isHorizontalContentSizeConstraintActive?@"YES":@"NO", topView.isVerticalContentSizeConstraintActive?@"YES":@"NO");
        NSLog(@"demoView ContentSizeConstraint  Horizontal:%@  Vertical:%@", demoView.isHorizontalContentSizeConstraintActive?@"YES":@"NO", demoView.isVerticalContentSizeConstraintActive?@"YES":@"NO");
    }
        [topView addSubview:demoView];

        NSLog(@"hidden top:%@  demo:%@", topView.hidden?@"YES":@"NO", demoView.hidden?@"YES":@"NO");

    [newPanel setOrderedIndex:0];
   
}
@end
void setConstraints(NSView *topView, NSView *demoView) {
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
/*
 *  https://developer.apple.com/documentation/appkit/nsbutton/1644256-buttonwithtitle?language=objc
 */
@implementation StackDemo:NSStackView
+ (NSStackView*)  runDemo {

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
    NSSize newSize = NSMakeSize(300.0, 300.0);
    NSButton *b1 = [NSButton buttonWithTitle:@"First" target:nil  action:nil];
    NSButton *b2 = [NSButton buttonWithTitle:@"Second" target:nil action:nil];
    NSButton *b3 = [NSButton buttonWithTitle:@"Long title for button" target:nil action:nil];
    NSGridView *gridView = [NSGridView gridViewWithViews:@[@[b1, b3], @[b2]]];
    NSSize fittingSize = gridView.fittingSize;
    NSLog(@"fittingSize  height:%f  width:%f", fittingSize.height, fittingSize.width);
    // NSLog(@"  ", gridView.size)
    return gridView;
    return nil;
}
@end
@implementation TabDemo:NSTabView
+ (NSStackView*)  runDemo {
    return nil;
}
@end
