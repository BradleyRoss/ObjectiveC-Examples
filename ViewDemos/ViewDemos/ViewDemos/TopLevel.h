//
//  TopLevel.h
//  ViewDemos
//
//  Created by Bradley Ross on 7/22/21.
//

#ifndef TopLevel_h
#define TopLevel_h
#import <AppKit/AppKit.h>
void initialize(void);
/**
 * @Starts demos for various auto layout classes.
 * * [Setting Constraints with Auto Layout](https://developer.apple.com/tutorials/app-dev-training/setting-constraints-with-auto-layout/) This tool assumes that you are using the interface buider tool.

 * * [Understanding Auto Layout](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/index.html#//apple_ref/doc/uid/TP40010853)
 * * [Stack Overflow 1 -  Adding Constraints Programmatically in Objective C](https://stackoverflow.com/questions/30590903/adding-constraints-programmatically-in-objective-c/51531647)
 *  * [stack Overflow 2 - Unexpected NSAutoResizingMaskLayoutConstraint Adding UIView from Nib to AutoLayout](https://stackoverflow.com/questions/25101957/unexpected-nsautoresizingmasklayoutconstraint-adding-uiview-from-nib-to-autolayo)
 *
 * Documentation for classes, properties, methods, and constants
 *
 * * [NSLayoutConstraint](https://developer.apple.com/documentation/uikit/nslayoutconstraint?language=objc)
 * * [NSView](https://developer.apple.com/documentation/appkit/nsview?language=objc)
 *   * [translatesAutoresizingMaskIntoConstraints property of NSView](https://developer.apple.com/documentation/uikit/uiview/1622572-translatesautoresizingmaskintoco?language=objc)
 *   * [autoresizingMask property of NSSize](https://developer.apple.com/documentation/appkit/nsview/1483281-autoresizingmask?language=objc)
 *   * [NSAutoresizingMaskOptions part of NSView](https://developer.apple.com/documentation/appkit/nsautoresizingmaskoptions?language=objc)
 * * [NSWindow](https://developer.apple.com/documentation/appkit/nswindow?language=objc)
 * * [NSGridView](https://developer.apple.com/documentation/appkit/nsgridview?language=objc)
 * * [NSTabview](https://developer.apple.com/documentation/appkit/nstabview?language=objc)
 * * [NSStackView](https://developer.apple.com/documentation/appkit/nsstackview?language=objc)
 */
@interface DemoStarter:NSObject
- (void) startDemo:(NSInteger)number;
@end
/**
 *  @brief Runs example of NSStackView.
 */
@interface StackDemo:NSStackView
+ (NSStackView*)  runDemo;

@end
/**
 * @brief Runs example og NSGridView
 */
@interface GridDemo:NSGridView
+ (NSGridView*)  runDemo;

@end
/**
  *  @brief Runs example of NSTabView.
 */
@interface TabDemo:NSTabView
+ (NSTabView*)  runDemo;
@end

#endif /* TopLevel_h */
