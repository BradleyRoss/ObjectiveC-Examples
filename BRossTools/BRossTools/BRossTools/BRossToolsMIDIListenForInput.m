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
 \file CoreMIDISamples.m
 */
@implementation BRossToolsMIDIListenForInput {
    
   
    OSStatus result;
    /**
           @brief Identifier for MIDI client software.
     */
    MIDIClientRef midiClient;
    /**
           @brief Identifier for external MIDI device (keyboard)
     */
    MIDIEndpointRef sourceRef;
    /**
     @brief MIDIObjectRef for Input Port.
     
     The Input Port receives information from the
     external source indicated by sourceRef
     so that it can be processed by the client
     indicated by midiClient.
     */
    MIDIPortRef inputPort;
    /**
     @brief MIDI protocol to be used
     */
    MIDIProtocolID midiProtocol;
    /**
     @brief name of source device (keyboard)
     */
    CFStringRef sourceName;
    /**
     @brief name of client
     */
    CFStringRef clientName;
    /**
     @brief name of input port
     */
    CFStringRef portName;

    
    
    
}



- (void) runtest {
    if (textWindow == NULL) {
        textWindow = [BRossToolsTextWindow newWindow];
        textWindow.title = @"CoreMIDI Operations";
    }
    NSLog(@"BRossToolsMIDIListenForInput - use newest versions of subroutines");
    [textWindow appendString:@"BRossToolsMIDIListenForInput - use newest versions of subroutines"];
    midiProtocol = kMIDIProtocol_1_0;
    ItemCount numberOfSources = MIDIGetNumberOfSources();
if (numberOfSources == 0) {
    [textWindow appendString:@"No sources found -- aborting \n"];
    return;
}

    sourceRef = MIDIGetSource(0);

    result = MIDIObjectGetStringProperty(sourceRef, kMIDIPropertyName, &sourceName);
    if (result == noErr) {
        NSString *message = [[NSString alloc]
                initWithFormat:@"Name of source is %@ \n", sourceName];
        [textWindow appendString:message];
    } else {
        NSString *message = [[NSString alloc]
            initWithFormat:@"Error obtaining source name - code: %d \n", result];
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
    result = MIDIClientCreateWithBlock((CFStringRef)@"client", &midiClient, notifyBlock);
    if (result != noErr) {
        NSString *message = [[NSString alloc]initWithFormat:@"MIDIClientCreateWithBlock failed with code of %d \n ", result];
        [textWindow appendString:message];
    } else {
        result = MIDIObjectGetStringProperty(midiClient, kMIDIPropertyName, &clientName);
        NSString *message = [[NSString alloc]
            initWithFormat:@"Client created with name of %@ \n", clientName];
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
    result = MIDIInputPortCreateWithProtocol(midiClient,
            (CFStringRef)@"InputPort", midiProtocol, &inputPort, receiveBlock);
    if (result != noErr) {
        NSString *message = [[NSString alloc]
            initWithFormat:@"MIDIClientCreateWithBlock failed with code of %d \n ", result];
        [textWindow appendString:message];
    } else {
        result = MIDIObjectGetStringProperty(inputPort, kMIDIPropertyName, &portName);
        NSString *message = [[NSString alloc]
            initWithFormat:@"Input port created with name of %@ \n", portName];
        [textWindow appendString:message];
    }
    /*
     *  Connect input port to keyboard.
     */
    result = MIDIPortConnectSource(inputPort, sourceRef, NULL);
    if (result != noErr) {
        NSString *message = [[NSString alloc]
            initWithFormat:@"MIDIPortConnectSource failed with code of %d \n ", result];
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

