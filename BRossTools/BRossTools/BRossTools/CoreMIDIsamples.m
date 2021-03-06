//
//  CoreMIDIsamples.m
//  BRossTools
//
//  Created by Bradley Ross on 3/18/21.
//

#import <Foundation/Foundation.h>
#import "CoreMIDIsamples.h"
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
@implementation BRossToolsMIDIListenForInput2 {


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
     @brief option for client creation;
     
     0 = ClientCreate with null entry for NotifyProc
     
     2021-04-02 22:11:22.615261-0400 BRossTools[21102:1056359] BRossToolsMIDIListenForInput2 - use subroutines from original article
     
     2021-04-02 22:11:22.641355-0400 BRossTools[21102:1056359] Client created with name of MIDI client
     
     2021-04-02 22:11:22.726058-0400 BRossTools[21102:1056359] [plugin] AddInstanceForFactory: No factory registered for id <CFUUID 0x600002d1d0e0> F8BB1C28-BAE8-11D6-9C31-00039315CD46
    
        1 = ClientCreate with entry for ReadProc
     */
    int clientCreateOption;
    /**
     @brief option for creating input port
     
     */
    int inputPortOption;
    
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
/*
 This is the ReadProc function.
 
 It may be that I can't have Objective-C calls inside callback
 For MIDI 1, MIDIPacketList
 The following type declarations are in M(DIServices.h
 
 struct MIDIPacketList
 {
     UInt32              numPackets;
     MIDIPacket          packet[1];
 };
 
 
 
 struct MIDIPacket
 {
     MIDITimeStamp        timeStamp;
     UInt16                length;
     Byte                data[256];
 };
 
 typedef UInt64                            MIDITimeStamp;
 
 The MIDITimeStamp is eight bytes in length
 The length of the packet takes up two bytes
 For pitch, 60 is middle C
 */
/**
 @brief MIDIReadProc callback function.
 @param list This is the list of pack4ets.
 @param procRef additional data passd to MIDIInputPortCreate or MIDIDestinationCreate
 @param srcRef additional data pased to MIDPortConnectSource
 */
static void midiInputCallback(const MIDIPacketList *list,
        void *procRef, void *srcRef) {
    NSLog(@"BRossToolsMIDIListenForInput2 midiInputCallback has been called");
    
    /*
    [textWindow appendString:@"BRossToolsMIDIListenForInput2 midiInputCallback has been called \n"];
     */

    UInt16 nBytes;
    const MIDIPacket *packet = &list->packet[0];
    NSLog(@"There are %d packets in the list of packets",
          (unsigned int)list->numPackets);
    for (unsigned int i = 0; i < list->numPackets; i++) {
        Byte data[256];
        nBytes = packet->length;
        for (i=0; i< nBytes; i++) {
            data[i] = packet->data[i];
        }
        describeNote(data, nBytes);
        
        packet=MIDIPacketNext(packet);
    }
}
/**
 @brief Callback for configuration changes
 
 @param message message describing configuration change
 
 @param refCon information passed with ClientCreate
 */
static void midiNotifyCallback ( const MIDINotification *message, void *refCon) {
    NSLog(@"midiNotifyCallback (MIDINotifyProc) called");
}
/*
 Can modules called from CoreMIDI call textWindow methods -- crashing when posting to textWindow with link library problem
 */
void describeNote(Byte data[], int length) {
    NSString *message;
    NSLog(@"There are %d data bytes in packet", length);
    unsigned int firstByte = (unsigned int)data[0];
    NSLog(@"First data byte is %x", firstByte);
    unsigned int channel = firstByte % 16;
    unsigned int command = firstByte / 16;
    NSString *desc;
    if (command == 9) {
        desc =@"NOTE ON";
        /* second byte is pitch, third byte is velocity*/
        message = [[NSString alloc] initWithFormat:@" command %d  %@ channel %d pitch %d  velocity %d \n", command, desc, channel, (unsigned int)data[1], (unsigned int)data[2]];
    } else if (command == 8) {
        desc = @"NOTE OFF";
        message = [[NSString alloc] initWithFormat:@" command %d  %@ channel %d pitch %d  velocity %d \n", command, desc, channel, (unsigned int)data[1], (unsigned int)data[2]];
    } else if (command == 24) {
        desc = @"PROGRAM CHANGE";
        /* second byte indicates instrument */
        message = [[NSString alloc] initWithFormat:@" command %d  %@ channel %d instrument %d  \n", command, desc, channel, (unsigned int)data[1]];

    } else {
        desc =  @"???";
        message = [[NSString alloc] initWithFormat:@" command %d  %@ channel %d   \n", command, desc, channel];
        
    }
    [textWindow appendString:message];
    NSLog(@"%@", message);
}
- (void) runtest {
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
    
    
    if (textWindow == NULL) {
        textWindow = [BRossToolsTextWindow newWindow];
        textWindow.title = @"CoreMIDI Operations";
    }
    NSLog(@"BRossToolsMIDIListenForInput2 - use subroutines from original article");
    clientCreateOption = 2;
    inputPortOption = 1;
    [textWindow appendString:@"BRossToolsMIDIListenForInput2 - use subroutines from original article"];
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
        [textWindow appendString:@"MIDINotifyBlock notifyBlock has been called \n"];
    };
    MIDIReceiveBlock receiveBlock = ^(const MIDIEventList *evtList, void *srcConnRefCon){
        [textWindow appendString:@"MIDIReceiveBlock receiveBlock has been called \n"];
    };
    MIDIReadBlock readBlock =^(const MIDIPacketList *pktList, void *srcConnRefCon) {
        UInt16 nBytes;
        const MIDIPacket *packet = &pktList->packet[0];
        NSLog(@"There are %d packets in the list of packets",
              (unsigned int)pktList->numPackets);
        for (unsigned int i = 0; i < pktList->numPackets; i++) {
            Byte data[256];
            nBytes = packet->length;
            for (i=0; i< nBytes; i++) {
                data[i] = packet->data[i];
            }
            describeNote(data, nBytes);
            
            packet=MIDIPacketNext(packet);
        }
    };
    
    if (clientCreateOption == 0) {
        NSLog(@"Using MIDIClientCreate without MIDINotifyProc");
     result = MIDIClientCreate((CFStringRef)@"MIDI client", NULL, NULL, &midiClient);
    }else if (clientCreateOption == 1) {
        NSLog(@"Using MIDIClientCreate with  MIDINotifyProc");
        result = MIDIClientCreate((CFStringRef)@"MIDI client", &midiNotifyCallback, NULL, &midiClient);
    } else if (clientCreateOption == 2) {
        NSLog(@"Using MIDICreateClientCeateWithBlock with MIDINotifyBlock");
        result = MIDIClientCreateWithBlock((CFStringRef)@"MIDI Client", &midiClient, notifyBlock);
    } else {
        [textWindow appendString:@"invalid option for clientCreateOption - aborting"];
        return;
    }
    if (result != noErr) {
        NSString *message = [[NSString alloc]initWithFormat:@"BRossToolsMIDIListenForInput2 MIDIClientCreate failed with code of %d \n ", result];
        [textWindow appendString:message];
    } else {
        result = MIDIObjectGetStringProperty(midiClient, kMIDIPropertyName, &clientName);
        NSString *message = [[NSString alloc]
            initWithFormat:@"Client created with name of %@ \n", clientName];
        NSLog(@"Client created with name of %@ \n", clientName);
        [textWindow appendString:message];
    }
    /*
     *  create input port
     */
    MIDIPortRef inputPort;
    if (inputPortOption == 0 ){
        NSLog(@" Using MIDIInputPortCreate");
     result = MIDIInputPortCreate(midiClient, (CFStringRef)@"Input", midiInputCallback, NULL, &inputPort);
    } else if (inputPortOption == 1) {
        NSLog(@"Using MIDIInputPortCreateWithBlock");
        result = MIDIInputPortCreateWithBlock(midiClient, (CFStringRef)@"Input", &inputPort, readBlock);
    } else {
        return;
    }
     
    if (result != noErr) {
        NSString *message = [[NSString alloc]
            initWithFormat:@"MIDIInputPortCreate failed with code of %d \n ", result];
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
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****

