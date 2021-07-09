//
//  CoreMIDIsamples.m
//  BRossTools
//
//  Created by Bradley Ross on 3/18/21.
//

#import <Foundation/Foundation.h>
#import "BRossToolsMIDI.h"
#import "BRossTools.h"
#import "LocalClasses.h"
/**
 text window to be used
 
 The object becomes eligible for deletion by ARC when runtest ends.  You therefore have to do
 something to keep the object from closing and deletion.
 */
/**
 \file BRossToolsMIDISendMIDI.m
 */

// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
/*
 @todo Is this still used?
 Version from original article.
 */
@implementation BRossToolsMIDISendMIDI {
    /**
     @brief A pointer to information passed through the client.
     
     The MIDIPortConnectSource passes
     pass this information in the argument list.
     
     */
    void **clientRef;
}

- (BRossToolsTextWindow *) getTextWindow {
    return textWindow;
}
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
- (void) setTextWindow:(BRossToolsTextWindow *) value {
    textWindow = value;
}
// *****  *****  *****  *****  ******
// *****  *****  *****  *****  ******
// *****  *****  *****  *****  ******
// *****  *****  *****  *****  ******




// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****



/**
 @brief Callback for configuration changes
 
 @param message message describing configuration change
 
 @param refCon information passed with ClientCreate
 */
static void midiNotifyCallback ( const MIDINotification *message, void *refCon) {
    NSLog(@"midiNotifyCallback (MIDINotifyProc) called");
}
// void runWithWindow(BRossToolsTextWindow * window);
/*
 Can modules called from CoreMIDI call textWindow methods -- crashing when posting to textWindow with link library problem
 */
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****

// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****

// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
 /*
  Error message in log window in Xcode
  This occurs with both clientCreateOption 0 and 1
  2021-04-01 13:31:39.866928-0400 BRossTools[15137:693178] BRossToolsMIDIListenForInput2 - use subroutines from original article
  2021-04-01 13:31:40.806663-0400 BRossTools[15137:693178] [plugin] AddInstanceForFactory: No factory registered for id <CFUUID 0x6000030a1e20> F8BB1C28-BAE8-11D6-9C31-00039315CD46
  
  Dynamic linking error
  
  The number starting with F8BB and ending with CD46 is the 128 bit UUID
  See https://developer.apple.com/documentation/corefoundation/cfuuid?language=objc
  
  https://developer.apple.com/forums/thread/129136
  
  I see two possible problems
  
  ACR is going a an object to be released early in which case the
  __bridge attribute may have to be used
  
  The code for creating one of the MIDI objects has a bug, causing
  corrupted structures.
  */
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
- (void) runtestWithWindow:window {
    // id pointerList[10];
    // pointerList[0] = window;
       // windowValue = window;
       textWindow = window;
    
    /*
    if (textWindow == NULL) {
        textWindow = [BRossToolsTextWindow newWindow];
        textWindow.title = @"CoreMIDI Operations";
    }*/
    NSLog(@"BRossToolsMIDISendMIDI");
    NSThread *mainThread = NSThread.mainThread ;
    NSThread *currentThread = NSThread.currentThread;
    NSLog(@"Current thread is %@", currentThread);
    NSLog(@"Main thread is %@", mainThread);
    
    // [textWindow appendString:@"BRossToolsMIDISendMIDI\n"];
    
    ItemCount numberOfDestinations = MIDIGetNumberOfDestinations();
if (numberOfDestinations == 0) {
    [textWindow appendString:@"No sources found -- aborting \n"];
    return;
}

    destRef = MIDIGetDestination(0);

    result = MIDIObjectGetStringProperty(destRef, kMIDIPropertyName, &destName);
    if (result == noErr) {
        NSString *message = [[NSString alloc]
                initWithFormat:@"Name of destination is *%@* \n", destName];
        [textWindow appendString:message];
        NSLog(@"%@", message);
    } else {
        NSString *message = [[NSString alloc]
            initWithFormat:@"Error obtaining destination name - code: %d \n", result];
        [textWindow appendString:message];
    }
    /*
     typedef void (^MIDINotifyBlock)(const MIDINotification *message);
    
     typedef void (^MIDIReceiveBlock)(const MIDIEventList *evtList, void *srcConnRefCon);
     */
    /**
     --- Start of block/closure/lamda side runTestWithWindow ---
     
     This is the MIDINotifyBlock notifyBlock2 that will execute whenever there have been changes to the system.
     
     * message  MIDINotification struct describing change to system
     */
    MIDINotifyBlock notifyBlock2 = ^(const MIDINotification *message) {
        NSLog(@"MIDINotifyBlock notifyBlock has been called ");
    };
 
 
    /*
     The following is based on ar article from
     https://eclecticlight.co/2020/09/08/changing-the-clock-in-apple-silicon-macs/
     
     https://developer.apple.com/documentation/driverkit/mach_timebase_info_t
     
     The MIDI timestamp can no longer be assumed to be in nanoseconds
     
     mach_time.h
     struct mach_timebase_info {
         uint32_t        numer;
         uint32_t        denom;
     };

     typedef struct mach_timebase_info       *mach_timebase_info_t;
     typedef struct mach_timebase_info       mach_timebase_info_data_t;
     
     */
    // id info = mach_timebase_info();
    struct mach_timebase_info info;
    kern_return_t kern_result = mach_timebase_info(&info);
    uint32_t denom;
    uint32_t numer;
    if (kern_result == KERN_SUCCESS) {
        numer = info.numer;
        denom = info.denom;
    NSLog(@"Mach time conversion numerator: %d denominator: %d",numer, denom );
        
    } else {
        numer = 1;
        denom = 1;
    }
    UInt64 firstTime = mach_absolute_time();
    NSLog(@"First time: %llx   ", firstTime);
    // BRossToolsTextWindow *tempWindow = textWindow;
    // [tempWindow appendString:@"test"];
    
    // *****  *****  *****  *****  *****  *****
    // *****  *****  *****  *****  *****  *****
    // *****  *****  *****  *****  *****  *****
    // *****  *****  *****  *****  *****  *****
    // *****  *****  *****  *****  *****  *****
    // *****  *****  *****  *****  *****  *****

    /*
     https://clang.llvm.org/docs/AutomaticReferenceCounting.html     https://stackoverflow.com/questions/14854521/where-and-how-to-bridge
     */
    if (clientCreateOption == 0) {
        NSLog(@"Using MIDIClientCreate without MIDINotifyProc");
     result = MIDIClientCreate((CFStringRef)@"MIDI client", NULL, NULL, &midiClient);
    }else if (clientCreateOption == 1) {
        NSLog(@"Using MIDIClientCreate with  MIDINotifyProc");
        result = MIDIClientCreate((CFStringRef)@"MIDI client", &midiNotifyCallback,  NULL, &midiClient);
    } else if (clientCreateOption == 2) {
        NSLog(@"Using MIDIClientCreateWithBlock with MIDINotifyBlock");
        result = MIDIClientCreateWithBlock((CFStringRef)@"MIDI Client", &midiClient, notifyBlock2);
    } else {
        [textWindow appendString:@"invalid option for clientCreateOption - aborting"];
        return;
    }
    if (result != noErr) {
        NSString *message = [[NSString alloc]initWithFormat:@"BRossToolsMIDIListenForInput MIDIClientCreate failed with code of %d \n ", result];
        [textWindow appendString:message];
    } else {
        result = MIDIObjectGetStringProperty(midiClient, kMIDIPropertyName, &clientName);
        NSString *message = [[NSString alloc]
            initWithFormat:@"Client created: name is *%@* \n", clientName];
        NSLog(@"Client created with name of *%@* \n", clientName);
        [textWindow appendString:message];
    }
    /*
     *  create output port
     */
    MIDIPortRef outputPort;

        NSLog(@" Using MIDIOutputPortCreate");
     result = MIDIOutputPortCreate(midiClient, (CFStringRef)@"Output",  &outputPort);


     
    if (result != noErr) {
        NSString *message = [[NSString alloc]
            initWithFormat:@"Creating output port failed: code is %d \n ", result];
        [textWindow appendString:message];
    } else {
        result = MIDIObjectGetStringProperty(outputPort, kMIDIPropertyName, &portName);
        NSString *message = [[NSString alloc]
            initWithFormat:@"Output port created: name is *%@* \n", portName];
        [textWindow appendString:message];
        NSLog(@"%@", message);
    }
    /*
     *  Connect input port to keyboard.
     */
    void *connRefCon = (__bridge void *)textWindow;
    result = MIDIPortConnectSource(outputPort, destRef, connRefCon);
    if (result != noErr) {
        NSString *message = [[NSString alloc]
            initWithFormat:@"MIDIPortConnectSource failed with code of %d \n ", result];
        [textWindow appendString:message];
    } else {
        [textWindow appendString:@"Port connected to source"];
    }
    /**
     @todo add code to send notes
     */
}
- (void) killClient {
    int result = MIDIClientDispose(midiClient);
    NSString *message = [[NSString alloc] initWithFormat:@"Running killClient %d", result];
    NSLog(@"%@", message);
    // [textWindow appendString:message];
}
@end

// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****

