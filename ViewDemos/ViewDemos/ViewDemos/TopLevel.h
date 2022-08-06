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
 *  @brief Runs example of NSStackView object.
 *  
 *  [Apple documentation for NSButton buttonWithTitle] (https://developer.apple.com/documentation/appkit/nsbutton/1644256-buttonwithtitle?language=objc)
 */
@interface StackDemo:NSStackView
/**
 * @brief Generate NSStackView object
 * @return NSStackView object
 */
+ (NSStackView*)  runDemo;

@end
/**
 * @brief Runs example of NSGridView object.
 *
 *  [see lucasderraugh/AppleProg-Cocoa-Tutorials/Lesson 72](https://github.com/lucasderraugh/AppleProg-Cocoa-Tutorials/tree/master/Lesson%2072)
 */
@interface GridDemo:NSGridView
+ (NSGridView*)  runDemo;

@end
/**
  *  @brief Runs example of NSTabView.
  * [NSTabView documentation]()
 */
@interface TabDemo:NSTabView
+ (NSTabView*)  runDemo;
@end

#endif /* TopLevel_h */
