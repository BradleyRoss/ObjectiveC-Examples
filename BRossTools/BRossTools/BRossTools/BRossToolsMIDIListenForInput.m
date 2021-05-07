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
static BRossToolsTextWindow *textWindow = NULL;
/**
 \file BRossToolsMIDIListenForInput.m
 */
@implementation BRossToolsMIDIListenForInput {
    
   
    OSStatus result2;
    /**
           @brief Identifier for MIDI client software.
     */
    MIDIClientRef midiClient2;
    /**
           @brief Identifier for external MIDI device (keyboard)
     */
    MIDIEndpointRef sourceRef2;
    /**
     @brief MIDIObjectRef for Input Port.
     
     The Input Port receives information from the
     external source indicated by sourceRef
     so that it can be processed by the client
     indicated by midiClient.
     */
    MIDIPortRef inputPort2;
    /**
     @brief MIDI protocol to be used
     */
    MIDIProtocolID midiProtocol2;
    /**
     @brief name of source device (keyboard)
     */
    CFStringRef sourceName2;
    /**
     @brief name of client
     */
    CFStringRef clientName2;
    /**
     @brief name of input port
     */
    CFStringRef portName2;
    /**
    @brief Pointer to BRossToolsTextWindow.
         
    The object becomes eligible for deletion by ARC when runtest ends.   However, the object
    is still used by the client object after runtest ends.  You therefore have to do
    something to keep the object from closing and deletion.
    */
    BRossToolsTextWindow *textWindow;
    }
    - (BRossToolsTextWindow *) getTextWindow {
        return textWindow;
    }
    - (void) setTextWindow:(BRossToolsTextWindow *) value {
        textWindow = value;
}



- (void) runtest {
    if (textWindow == NULL) {
        textWindow = [BRossToolsTextWindow newWindow];
        textWindow.title = @"CoreMIDI Operations";
    }
    NSLog(@"BRossToolsMIDIListenForInput - use newest versions of subroutines");
    [textWindow appendString:@"BRossToolsMIDIListenForInput - use newest versions of subroutines"];
    midiProtocol2 = kMIDIProtocol_1_0;
    ItemCount numberOfSources = MIDIGetNumberOfSources();
if (numberOfSources == 0) {
    [textWindow appendString:@"No sources found -- aborting \n"];
    return;
}

    sourceRef2 = MIDIGetSource(0);

    result2 = MIDIObjectGetStringProperty(sourceRef2, kMIDIPropertyName, &sourceName2);
    if (result2 == noErr) {
        NSString *message = [[NSString alloc]
                initWithFormat:@"Name of source is %@ \n", sourceName2];
        [textWindow appendString:message];
    } else {
        NSString *message = [[NSString alloc]
            initWithFormat:@"Error obtaining source name - code: %d \n", result2];
        [textWindow appendString:message];
    }
    /*
     typedef void (^MIDINotifyBlock)(const MIDINotification *message);
    
     typedef void (^MIDIReceiveBlock)(const MIDIEventList *evtList, void *srcConnRefCon);
     */
    MIDINotifyBlock notifyBlock = ^(const MIDINotification *message) {
        /*
        [textWindow appendString:@"MIDINotifyBlock notifyBlock has been called \n"];
         */
    NSLog(@"BRossToolsMIDIListenForInput  MIDINotifyBlock notifyBlock has been called ");
    };
    MIDIReceiveBlock receiveBlock = ^(const MIDIEventList *evtList, void *srcConnRefCon){
        NSLog(@"BRossToolsMIDIListenForInput MIDIReceiveBlock receiveBlock has been called ");
        /*
        [textWindow appendString:@"MIDIReceiveBlock receiveBlock has been called \n"];
         */
    };
        
    
    /*
     The following is the code from the original example.
     
     MIDIClientRef midiClient;

     OSStatus result;
         
     result = MIDIClientCreateWithBlock(CFSTR("MIDI client"), NULL, NULL, &midiClient);
     if (result != noErr) {
         NSLog(@"Error creating MIDI client: %s - %s",
             GetMacOSStatusErrorString(result),
             GetMacOSStatusCommentString(result));
             return;
     */
    result2 = MIDIClientCreateWithBlock((CFStringRef)@"client", &midiClient2, notifyBlock);
    if (result2 != noErr) {
        NSString *message = [[NSString alloc]initWithFormat:@"MIDIClientCreateWithBlock failed with code of %d \n ", result2];
        [textWindow appendString:message];
    } else {
        result2 = MIDIObjectGetStringProperty(midiClient2, kMIDIPropertyName, &clientName2);
        NSString *message = [[NSString alloc]
            initWithFormat:@"Client created with name of %@ \n", clientName2];
        [textWindow appendString:message];
    }
    /*
     MIDIPortRef inputPort;
     result = MIDIInputPortCreate(client, CFSTR("Input"), midiInputCallback, NULL, &inputPort);
     
     OSStatus MIDIInputPortCreateWithProtocol(MIDIClientRef client, CFStringRef portName, MIDIProtocolID protocol, MIDIPortRef *outPort, MIDIReceiveBlock receiveBlock);
     */
     /*
      *  create input port
      */
    result2 = MIDIInputPortCreateWithProtocol(midiClient2,
            (CFStringRef)@"InputPort", midiProtocol2, &inputPort2, receiveBlock);
    if (result2 != noErr) {
        NSString *message = [[NSString alloc]
            initWithFormat:@"MIDIClientCreateWithBlock failed with code of %d \n ", result2];
        [textWindow appendString:message];
    } else {
        result2 = MIDIObjectGetStringProperty(inputPort2, kMIDIPropertyName, &portName2);
        NSString *message = [[NSString alloc]
            initWithFormat:@"Input port created with name of %@ \n", portName2];
        [textWindow appendString:message];
    }
    /*
     *  Connect input port to keyboard.
     */
    result2 = MIDIPortConnectSource(inputPort2, sourceRef2, NULL);
    if (result2 != noErr) {
        NSString *message = [[NSString alloc]
            initWithFormat:@"MIDIPortConnectSource failed with code of %d \n ", result2];
        [textWindow appendString:message];
    } else {
        [textWindow appendString:@"Port connected to source"];
    }
}
     /*
      
      
      
      OSStatus MIDIInputPortCreateWithProtocol(MIDIClientRef client, CFStringRef portName, MIDIProtocolID protocol, MIDIPortRef *outPort, MIDIReceiveBlock receiveBlock);
      
      OSStatus MIDIPortConnectSource(MIDIPortRef port, MIDIEndpointRef source, void *connRefCon);
      
      
     result = MIDIPortConnectSource(inputPort, endPoint, NULL);
     */
@end

// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
/*
 Version from original article.
 */

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

