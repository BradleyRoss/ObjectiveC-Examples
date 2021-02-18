//
//  experimentalClasses.h
//  experiments
//
//  Created by Bradley Ross on 2/11/21.
//

#ifndef experimentalClasses_h
#define experimentalClasses_h
/**
   Object for creating main menu
 */
@interface mainMenu:NSView
/**
          Responds to button clicks.
                     @param sender object sending message to method when button clicked.
 */
+ (void)bleep:(id)sender;
/*
     Creates a view containing the main menu.
 
     @returns view
 */
+ (NSView *)menu;
@end

//  *****  *****  *****  *****
//  *****  *****  *****  *****

/**
   Test case e2.  This is a subclass of NSObject.
 
       It opens a window, changes the color and inserts some text fields and buttons.
 */
@interface e2:NSObject
/**
    Method running test case.
 */
+ (void)runtest;
/**
     Uses NSLog to send information on a NSRect object.
 
     @param object   identifier for NSRect object.
 
     @param titleString  character string used to identify NSRect object being described
 */
+ (void)logSizePositionOf:(NSRect *)object title:(NSString *)titleString;
/**
Messages from button clicks are sent to this method.
 @param sender This indicates the object that sent the message.
 */
+ (void)bleep:(id)sender;
@end

//  *****  *****  *****
//  *****  *****  *****

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
#endif /* experimentalClasses_h */
