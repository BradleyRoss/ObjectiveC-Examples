//
//  LocalClasses.h
//  BRossTools
//
//  Created by Bradley Ross on 2/1/21.
//
/**
  \file LocalClasses.h
 @brief LocalClasses headers.
 The code in this section is either specific to tests, samples or requires more work before it can
 moved to BRossTools classes.
 */
#ifndef LocalClasses_h
#define LocalClasses_h
#import "BRossToolsMIDI.h"
#import "MIKMIDIsamples.h"
#import "BRossTools.h"
#import <Foundation/Foundation.h>
#import <CoreMIDI/CoreMIDI.h>
#import <stdio.h>
#import <time.h>
//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****

/**
 Some examples of create some items in a window.
 @brief Sample code test1.
 */
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
    @brief Sample code test2.
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
 
 @brief Sample code test3.
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
 @brief Sample code test4
 */
@interface test4:NSObject
+ (void) runtest;
   @end

//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****
/**
 Sample code for CFDictionary / CFArray
 @brief CFDictionary/CFArray example
 
 https://stackoverflow.com/questions/2283466/how-to-enumerate-cfproperylist-cfdictionary-keys
 
 https://gist.github.com/macmade/9434900  CoreFoundation example
 
 https://opensource.apple.com/source/CF/CF-744/CFString.c
 */
@interface test5:NSObject
+ (void) runtest;
+ (void) setTextWindow:(BRossToolsTextWindow *) thisWindow;
+ (BRossToolsTextWindow *) textWindow;
@end

//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****



/**
     Place a menu on the main window of the application
          to select running of other programs.
 */
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
 @brief creates menu of sample code snippets.
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
      @brief Sample code e2.
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
 @brief MIDI tools.
 
 The purpose of this code is to use the CoreMIDI library to collect information
  on the MIDI objects (device, entity, endpoint).
 */
@interface CoreMidiSample1:NSObject
@property(class) BRossToolsTextWindow *textWindow;
/**
 @brief First program for getting data on MIDI components.
 
 MIDIGetNumberOfDevices is used to loop through the MIDI devices.
 MIDIDeviceGetNumberOfEntities and MIDIDeviceGetEntity are then
 used to look through the entities for a given device.  Finally, MIDIEntityGetNumberOfSources and
 MIDIEntityGetSource are used to loop through the source endpoints for a given entity and
 MIDIEntityGetNumberOfDestinations and MIDIEntityGetDestination are used to get the
 destinations.
 
 */
+ (void) runtest;
/**
 
  @briefThis is the second example of obtaining information on MIDI components.
  
  runtest2 is based on CoreMidiDemo2.
  
  It uses MIDIGetNumberOfDestinations MIDIGetDestination to loop through the
  MIDI destinations.  It then uses MIDIGetNumberOfSources and MIDIGetSource
  to loop through the MIDI sources.
  
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

/**
 Tools for processing CFDictionary and CFArray objects.
 @brief CFDictionary/CFArray tools.
 
 Thkere will have to be a few types of tools.
 
  Parse dictionary/array and store ab set of nodes.
 
    Walker that will go through nodes
  
 */
@interface BRossToolsCFDictionaryArray:NSObject {
    int *level;
    NSString *spacer;
}
/**
 Start displaying contents of CFDictionary/CFArray starting with depth of zero.
 @brief Show contents
 @param startingNode top node of dictionary/array tree
 */
- (void) showDictionaryContents:(CFTypeRef) startingNode;
/**
 Start displaying contents of CFDictionary/CFArray starting with depth of zero.
 
 This method is called recursively to go down through the tree.
 
 @brief Show contents
 @param startingNode top node of dictionary/array tree.
 @param level depth in tree for this top node
 */
- (void) showDictionaryContents:(CFTypeRef) startingNode  atLevel:(int)level;
/**
 Sets the BRossToolsTextWindow to be used to display results.
 @brief Set destination for text.
 @param destination to be used
 */
- (void) setDestination:(BRossToolsTextWindow *) destination;
/**
 Get id for BRossToolsTextWindow object to be used.
 @brief Get destination for output
 @returns id for destination
 */
- (BRossToolsTextWindow *) destination;
@end
//  *****  *****  *****
//  *****  *****  *****
#endif /* LocalClasses_h */
