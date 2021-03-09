//
//  BRossTools.h
//  BRossTools
//
//  Created by Bradley Ross on 1/31/21.
//
/**
 \file
 BRossTools header file.
 @brief BRossTools header.
 */
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

//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****
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
//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****
/**
   Subclass of NSButton that provides additional capability.
 
 There is one instance variable named ident which is an NSString object
  containing an identifier for the button.
 
  NSButton is a subclass of NSControl which is a subclass of NSView which is a class of NSResponder.
 */
@interface BRossToolsButton:NSButton
/*
    TODO check on instance and class properties
 */
{
@private NSString* identValue;
}
/**
 Creates an object contaning a view of a button to insert in view.
 
 @param targetObject id for object that will receive action from button
 @param select character string that will identify button to target object
 @param label caption for button
 @param ident character string that identifies button
 @return pointer to button object created
 */
+ (instancetype)initUsingObjectIdent:(id)targetObject  selector:(SEL)select caption:(NSString *)label ident:(NSString *) ident;
/**
 Creates an object contaning a view of a button to insert in view.
 
 @param targetObject id for object that will receive action from button
 @param select character string that will identify button to target object
 @param label caption for button
 @return address of object created

 https://stackoverflow.com/questions/36020540/why-is-instancetype-used
 */
+ (instancetype)initUsingObject:(id)targetObject  selector:(SEL)select caption:(NSString *)label;
/**
     Get NSString object allowing multiple instances to be distinguished
 
     @return identifying character string stored in instance variable.
 */
- (NSString *)getIdent;
/**
      Set NSString object allowing multiple instances to be distinguished.
 
      @param ident character string identifying instance.  This is an instance variable.
 */
- (void)setIdent:(NSString *)ident;
@end

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

/**
 Deprecated version of NSButton subclass.
 */
@interface BRossToolsButtonView : NSView
/**
 Creates an object contaning view of a button to insert in grid view
 
 @param targetObject id for object that will receive action from button
 @param selector character string that will identify button to target object
 @param label caption for button
 */

+ (id)CreateButtonViewUsingObject:(id)targetObject  selector:(NSString *)selector caption:(NSString *)label;
@end


//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

/**
    Creates a scrolling window that can be used by other classes to display information.
 
       There is still a problem that it is difficult to select regions of text without the system
       trying to go to the menu for googling the section or looking it up in the dictionary.

 */

@interface BRossToolsTextWindow:NSTextView {
    @protected
    /**
        Instance variable containing the storqge object for the window.
     */
    NSTextStorage *stringContents;
    /**
     Instance variablw containing scroll view for the text window.
     */
    NSScrollView *scrollview;
    /**
          Instance variable pointing to NSTextView object for window.
     */
    NSTextView *theTextView;
    /**
           Instance variable pointing to NSViewController for window.
     */
    NSViewController *viewController;
    /**
     Window layer containing NSText object.
     */
    NSWindow *newPanel;
    /**
     Window actually visible to user.
     */
    NSWindow *displayPanel;
}
/**
      Allocates a new text window and then calls initTextWindow to finish the initialization..
    @returns identifier for text window
 */
+(id)newWindow;
- (void)initTextWindow;
- (NSString *) getTitle;
- (void) setTitle:(NSString *)title;
/**
      Append an NSString object to the panel/window created by the class.
 
      @param string     character string to be appended to window
 */
- (void)appendString:(NSString *)string;
/**
       Append a formatted string to the display window where the first parameter is the
              format to be used and the following fields are the items to be formatted.
 
        @param format --  format string folllowed by items to be formatted.  The resulting
                                formatted string is suffixed to the text window.
 */
- (void)appendFormat:(NSString *)format, ...;
@end


#endif /* BRossTools_h */
