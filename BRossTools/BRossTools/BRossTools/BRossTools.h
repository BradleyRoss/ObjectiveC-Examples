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
#import "BRossToolsTextWindow.h"
#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AVFAudio/AVFAudio.h>
// #import "BRossToolsControls.h"
#import "LocalClasses.h" 
// #import "BRossToolsMIDI.h"
 /**
  *
  * @brief Receives identifying string from a responder
  * This protocol will enable an object to carry out an action based on a string
  * received in an action from another  object
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
 * @brief Creates a grid based menu
 This is the class for NSGridView object to be created.
 *
 * I had an interface section for BRossToolsSimpleGridMenu and a call
 * to the class in LocalClasses.m, but I couldn't find an implemenation
 * section.  I commented out the call to BRossToolsSimpleGridMenu
 * in LocalClasses.m.
 */
@interface BRossToolsSimpleGridMenu : NSGridView
@property int *labelCount;
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
 * @brief  Subclass of NSButton that provides additional capability.
 *
 * There is one instance variable named ident which is an NSString object
 * containing an identifier for the button.
 *
 * NSButton is a subclass of NSControl which is a subclass of NSView which is a class of NSResponder.
 */
@interface BRossToolsButton:NSButton
/*
    @todo check on instance and class properties
 */
{
@private NSString* identValue;
}
/**
 Creates an object containing a view of a button to insert in view.
 
 @param targetObject id for object that will receive action from button
 @param select character string that will identify button to target object
 @param label caption for button
 @param ident character string that identifies button
 @return pointer to button object created
 */
+ (instancetype)initUsingObjectIdent:(id)targetObject  selector:(SEL)select caption:(NSString *)label ident:(NSString *) ident;
/**
 Creates an object containing a view of a button to insert in view.
 
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
- (void) setIdent:(NSString *)ident;
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
 Creates an object containing view of a button to insert in grid view
 
 @param targetObject id for object that will receive action from button
 @param selector character string that will identify button to target object
 @param label caption for button
 
 @todo Is this used?  Should it be removed.
 */

+ (id)CreateButtonViewUsingObject:(id)targetObject  selector:(NSString *)selector caption:(NSString *)label;
@end


//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****



#endif /* BRossTools_h */
