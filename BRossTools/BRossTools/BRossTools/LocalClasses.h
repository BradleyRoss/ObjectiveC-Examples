//
//  LocalClasses.h
//  BRossTools
//
//  Created by Bradley Ross on 2/1/21.
//
/**
  @file Headers for LocalClasses
 */
#ifndef LocalClasses_h
#define LocalClasses_h
#import "BRossTools.h"
#import <Foundation/Foundation.h>
#import <CoreMIDI/CoreMIDI.h>
#import <stdio.h>
#import <time.h>
//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****

@interface test1 : NSObject
/**
 Runs test1 which runs a snippet of code that creates an array of NSString objects and then sends it to the log.
 
 https://stackoverflow.com/questions/39907988/how-to-make-an-array-of-nsstrings
 */
+ (void)runtest;
@end
//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****
/**
   Test case for reusable panel for handling text.
 */
@interface test2 : NSObject
/**
 Runs a test case test2 for a new panel that can be used to
 process text.
 */
+ (void)runtest;
@end

//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****
/**
   Test case  trest3 for some operations with arrays.
 */
@interface test3 : NSObject
/**
   Demonstation code for NSString objects and arrays.
 */
+ (void) runtest;
@end

//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****
/**
 Demonstration code for immutable/mutable strings.
 */
@interface test4:NSObject
+ (void) runtest;
   @end

//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****
/**
     Place a menu on the main window of the application
          to select running of other programs.
 */


//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****

@interface BRossToolsView:NSObject
// + (void)displayView:(NSString*)name view:(NSView*)target;
+ (void) displayToLog:(NSString*)name view:(NSView*)target output:(BRossToolsTextWindow *)output;
@end

//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****
/**
 Playpen for buiding menu.
 */
@interface aaaMenu:NSGridView
/**
 Trying various approaches for opening window.  Currently places lines way off edge of window.
 */
+ (id)createMainMenu:(NSWindow*)owningWindow;

@end
//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****

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
     Creates a view containing the main menu.  This is the new
    menu that appears when the application is first started.
 
     @returns view
 */
+ (NSView *)menu;
@end

//  *****  *****  *****  *****
//  *****  *****  *****  *****
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

//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****

/**
 Modified version of CoreMidiSample1 CLI program.
 */
@interface CoreMidiSample1:NSObject
@property(class) BRossToolsTextWindow *textWindow;
+ (void) runtest;
/**
 * This is taken from http://xmidi.com/how-to-access-midi-devices-with-coremidi/
 * See https://developer.apple.com/documentation/coremidi/midi_services
 */
+ (void) runtest2;
+ (void) setTextWindow:(BRossToolsTextWindow *)window;
+ (BRossToolsTextWindow *) getTextWindow;
@end

//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****


//  *****  *****  *****
//  *****  *****  *****
#endif /* LocalClasses_h */
