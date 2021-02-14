//
//  BRossTools.h
//  BRossTools
//
//  Created by Bradley Ross on 1/31/21.
//

#ifndef BRossTools_h
#define BRossTools_h
#import <AppKit/AppKit.h>
/*
   The purpose of this class is to create a NSGridView object that can
            be linked to NSPanel and NSWindow objects that will
            create a simple menu involving a list
            of clickable text fields that will trigger pieces of code.
 
 *//**
      This protocol will enable an object to carry out an action based
             on a string received in an action from another  object
    */
@protocol BRossToolsActionReceiver
/**
   Receives action to be carried out from another object
 */
- receiveAction:(NSString *)action;
@end
/**
 This is the class for NSGridView object to be created.
 */
@interface BRossToolsSimpleGridMenu : NSGridView
@property int*labelCount;
/**
    Creates a new grid menu and attaches it to a window or panel
 */
+ (void)createMainMenuForWindow:(NSWindow *)window;
- (void)processAction:(NSString *)caseNumber;
/**
     Sets up the grid of buttons to be used.
 */
- (void)setLabels;
// + (id)start;

@end




@interface BRossToolsButtonView : NSView
/**
 Creates an object contaning vie aw of a button to insert in grid view
 
 @param targetObject id for object that will receive action from button
 @param selector character string that will identify button to target object
 @param label caption for button
 */

+ (id)CreateButtonViewUsingObject:(id)targetObject  selector:(NSString *)selector caption:(NSString *)label;
@end



@interface BRossToolsTextWindow:NSTextView
+(id)newWindow;
/**
      Append an NSString object to the panel/window created by the class.
 */
- (void)appendString:(NSString *)string;
- (void)appendFormat:(NSString *)format, ...;
@end
#endif /* BRossTools_h */
