//
//  BRossToolsMIDIListenForInput2.m
//  BRossTools
//
//  Created by Bradley Ross on 3/18/21.
//

#import <Foundation/Foundation.h>
#import "BRossToolsMIDI.h"
#import "BRossTools.h"
#import "LocalClasses.h"
/**
 \file BRossToolsMIDIListenForInput2.m
 */

// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
/*
 Version from original article.
 */
@implementation BRossToolsMIDIListenForInput2 {
    
    BOOL extraLogMessages;

    /**
 
     @brief A pointer to information passed through the client.
     
     The MIDIPortConnectSource passes
     pass this information in the argument list.
     
     */
    void **clientRef;
    /**
     @brief object encapsulates synthesizer.
     
     This object encapsulates an AVAudioUnitSampler instance together with
     other functions.
     */
    VirtualSynthesizer *virtual;
    /**
     @brief Synthesizer used to play notes from keyboard.
     */
    AVAudioUnitSampler *synth;
    
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
    /**
    @brief Pointer to BRossToolsTextWindow.
     */
     BRossToolsTextWindow *textWindow;
     BRossToolsTextWindow *windowValue;
    
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



/*
 The following type declarations are in MIDIServices.h
 
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
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****

/*
 @brief MIDIReadProc callback function.
 @param list This is the list of pack4ets.
 @param procRef additional data passd to MIDIInputPortCreate or MIDIDestinationCreate
 @param srcRef additional data pased to MIDPortConnectSource

 This isn't being used
 
 https://stackoverflow.com/questions/19654278/stop-arc-releasing-an-object-while-it-is-idle

 https://clang.llvm.org/docs/AutomaticReferenceCounting.html#retainable-object-pointers

 https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/MemoryMgmt/Articles/MemoryMgmt.html

 https://clang.llvm.org
 */



// void runWithWindow(BRossToolsTextWindow * window);
/*
 /Users/bradleyross/Documents/GitHub/Reload/Untitled/ObjectiveC-Examples/BRossTools/BRossTools/MDFILE.md
 Can modules called from CoreMIDI call textWindow methods -- crashing when posting to textWindow with link library problem
 */
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
/**
 Print information on note
 @todo Is it still used?
 */


// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
- (instancetype) init {
   
    return self;
}
- (void) runtest {
    [self runtestWithWindow:NULL];
}
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
 /*
 
  
  Dynamic linking error
  
  The number starting with F8BB and ending with CD46 is the 128 bit UUID
  See https://developer.apple.com/documentation/corefoundation/cfuuid?language=objc
  
  https://developer.apple.com/forums/thread/129136
  

  */
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****  *****  *****
/**
 
 @todo should be renamed to start with Init
 
 */
- (void) runtestWithWindow:window {
    // id pointerList[10];
    // pointerList[0] = window;
    extraLogMessages = NO;
       windowValue = window;
       textWindow = window;
    [textWindow setAutoscroll:YES];
    /*
    if (textWindow == NULL) {
        textWindow = [BRossToolsTextWindow newWindow];
        textWindow.title = @"CoreMIDI Operations";
    
    }*/
    NSLog(@"BRossToolsMIDIListenForInput2");
   
    BOOL success;
    NSLog(@"starting BRossToolsMIDIListenForInput2 init");
    virtual = [[VirtualSynthesizer alloc] init];
    synth = [virtual getSynthesizer];
    success = [virtual startEngine];
    // AVAudioUnitSampler *synth2 = [instance getSynthesizer];
    if (success) {
        NSLog(@"Engine started");
    } else {
        NSLog(@"Failure in starting engine");
    }
    success = [virtual loadSoundbankAndInstrument];
    if (success) {
    }
    [synth startNote:60 withVelocity:100 onChannel:0];
    [NSThread sleepForTimeInterval:0.25];
    [synth stopNote:60 onChannel:0];
    
    /*
    NSThread *mainThread = NSThread.mainThread ;
    NSThread *currentThread = NSThread.currentThread;
    NSLog(@"Current thread is %@", currentThread);
    NSLog(@"Main thread is %@", mainThread);
     */
    [textWindow appendString:@"BRossToolsMIDIListenForInput2\n"];
    ItemCount numberOfSources = MIDIGetNumberOfSources();

if (numberOfSources == 0) {
    [textWindow appendString:@"No sources found -- aborting \n"];
    return;
}
/*
 @todo If there is more than one source, a panel should be displayed to pick the source rather than simply picking the first.
 */
    sourceRef = MIDIGetSource(0);

    result = MIDIObjectGetStringProperty(sourceRef, kMIDIPropertyName, &sourceName);
    if (result == noErr) {
        NSString *message = [[NSString alloc]
                initWithFormat:@"Name of source is *%@* \n", sourceName];
        [textWindow appendString:message];
        NSLog(@"%@", message);
    } else {
        NSString *message = [[NSString alloc]
            initWithFormat:@"Error obtaining source name - code: %d \n", result];
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
    MIDIReceiveBlock receiveBlock2 = ^(const MIDIEventList *evtList, void *srcConnRefCon){
        [textWindow appendString:@"MIDIReceiveBlock receiveBlock has been called \n"];
    };
     */
    BRossToolsTextWindow *localWindow =self->textWindow;
    /*
     The following is based on an article from
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
    // NSLog(@"First time: %llx   ", firstTime);
    BRossToolsTextWindow *tempWindow = windowValue;
    [tempWindow appendString:@"test"];
    /**
     --- start of closure/block/lambda ---
    
     Executed when MIDI packet is received.
    
     * This is the MIDIReadBlock readBlock2 block/lambda/closure to be executed when MIDI data is received from the keyboard.
     
     * pktList is the MIDIPacketList item sent by the client
     
     * srcConnRefCon is the data sent to the client from MIDIPortConnectSource
     
     @todo It appears that a packet can comtain more than one MIDI command.  The code will have to be changed to keep looking for commands until the combined length of the MIDI commands is packet->length
     */
    MIDIReadBlock readBlock2 =^(const MIDIPacketList *pktList, void *srcConnRefCon) {
       /*
        const void **pointerList = srcConnRefCon;
       */

        /*
        NSThread *mainThread = NSThread.mainThread;
        NSThread *currentThread = NSThread.currentThread;
        NSLog(@"Main thread: %@", mainThread);
        NSLog(@"currentThread: %@", currentThread);
         */
        // UInt16 nBytes;
        // NSLog(@"First time: %llx   ", firstTime);
        const MIDIPacket *packet = &pktList->packet[0];
        /* position is location of first byte in MIDI command in packet */
        unsigned int position;
        /*  size is the number of bytes in the MIDI command in the packet*/
        unsigned int size;
        for (unsigned int i = 0; i < pktList->numPackets; i++) {
            position = 0;
            Byte data[256];
            UInt16 nBytes = packet->length;
            // UInt16 processedBytes = 0;
            for (i=0; i< nBytes; i++) {
                data[i] = packet->data[i];
            }
            uint64 difference = packet->timeStamp - firstTime;
            // NSLog(@" %llx %lld MIDITimeStamp", difference, difference);
            uint64_t multiplied = difference * numer / denom;
           //  NSLog(@" %llx %lld MIDITimeStamp nanoseconds", multiplied, multiplied);
            double seconds = (double)multiplied / 1.0e9;
            NSString *message;
            message = [[NSString alloc ]
                    initWithFormat:@"MIDITimeStamp %10.3f seconds\n", seconds];
            [localWindow appendString:message];
           
            // describeNote(data, nBytes, localWindow);
        

            if (self->extraLogMessages) {
                NSLog(@"MIDITimeStamp %f seconds", seconds);
                NSLog(@"There are %d data bytes in packet", nBytes);
            }
            unsigned int firstByte = (unsigned int)data[position + 0];
            // NSLog(@"First data byte is %x", firstByte);
            unsigned int channel = firstByte % 16;
            unsigned int command = firstByte / 16;
            NSString *desc;
            if (command == 9) {
                desc =@"NOTE ON";
                size = 3;
                /* second byte is pitch, third byte is velocity */
                message = [[NSString alloc] initWithFormat:@"      c %d %@ ch %d p %d v:%d \n", command, desc, channel, (unsigned int)data[position + 1], (unsigned int)data[position + 2]];
                [self->synth startNote:(unsigned int)data[position + 1]
                    withVelocity:(unsigned int)data[position + 2] onChannel:channel];
            } else if (command == 8) {
                desc = @"NOTE OFF";
                size = 3;
                message = [[NSString alloc] initWithFormat:@"      c %d  %@ ch %d p %d  v %d \n", command, desc, channel, (unsigned int)data[position + 1], (unsigned int)data[position + 2]];
                [self->synth stopNote:(unsigned int)data[1] onChannel:channel];
            } else if (command == 10) {
                desc =@"Poly key pressure";
                size = 3;
                message = [[NSString alloc] initWithFormat:@" comm %d %@ ch %d key %d  pressure %d  \n", command, desc, channel, (unsigned int)data[1], (unsigned int) data[2]];
            } else if (command == 11) {
                desc =@"CONTROL CHANGE";
                size = 3;
                message = [[NSString alloc] initWithFormat:@" comm %d %@ ch %d control: %d  value: %d  \n", command, desc, channel, (unsigned int)data[1], (unsigned int) data[2]];
                
            } else if (command == 12) {
                // only two bytes
                desc = @"PROGRAM CHANGE";
                /* Is size 2 or 3?  */
                /* second byte indicates instrument */
                message = [[NSString alloc] initWithFormat:@"      c %d  %@ ch %d inst %d  \n", command, desc, channel, (unsigned int)data[1]];
            } else if (command == 13) {
                desc =@"CHANNEL PRESSURE";
                /*  Is size 2 or 3? */
                message = [[NSString alloc] initWithFormat:@" comm %d %@ ch %d   value: %d  \n", command, desc, channel, (unsigned int)data[position + 1]];
            } else if (command == 14) {
                desc =@"PITCH BEND";
                size = 3;
                message = [[NSString alloc] initWithFormat:@" comm %d %@ ch %d LSB:%d  MSB:%d  \n", command, desc, channel, (unsigned int)data[position + 1], (unsigned int) data[position + 2]];
 
                
            } else if (firstByte == 0xF0) {
                desc = @ "MIDI System Exclusive Message (start)";
                message = [[NSString alloc] initWithFormat:@"   %@ \n", desc];
                
            } else if (firstByte == 0xF1) {
                desc = @"MIDI Quarter Frame Message";
                message = [[NSString alloc] initWithFormat:@"   %@ \n", desc];
                /*
                 * There is one data byte in this command.  Is the size of the
                 * command padded in the packet.
                 */
                
            } else if (firstByte == 0xF2) {
                desc = @"MIDI Song Position Pointer Message";
                message = [[NSString alloc] initWithFormat:@"   %@  \n", desc];
                size = 3;
                /*
                 * There are two data bytes, with each byte containing 7 bits
                 * of a 14 bit integer.
                 * Can there be multiple commands in a packet containing this command?
                 */
                
            } else if (firstByte == 0xF3) {
                desc = @"MIDI Song Request Message";
                message = [[NSString alloc] initWithFormat:@"   %@ \n", desc];
                /*
                 * There is one data byte containing the number of the song.  Is size
                 * in packet for this command padded.
                 * Can there be multiple commands in a packet containing this command?
                 */
                
            } else if (firstByte == 0xF6) {
                desc = @"MIDI Tune Request Message";
                message = [[NSString alloc] initWithFormat:@"%@", desc];
                /*
                 * There are no data bytes.  Is size in packet for this command padded.
                 * Can there be multiple commands in a packet containing this command?
                 */
                
            } else if (firstByte == 0xF7) {
                desc = @"SysEX Continuation Message";
                message = [[NSString alloc] initWithFormat:@"%@", desc];
                /*
                 * there is a variable number of bytes in this message.
                 */
                
            } else if (firstByte == 0xF8) {
                desc = @"MIDI Clock message";
                message = [[NSString alloc] initWithFormat:@"%@", desc];
                /*
                 * There are no data bytes.  Is size in packet for this command padded.
                 * Can there be multiple commands in a packet containing this command?
                 */
                
            } else if (firstByte == 0xFA) {
                desc = @"MIDI Start Message";
                message = [[NSString alloc] initWithFormat:@"%@", desc];
                /*
                 * There are no data bytes.  Is size in packet for this command padded.
                 * Can there be multiple commands in a packet containing this command?
                 */
                
            } else if (firstByte == 0xFB) {
                desc = @"MIDI Continue Message";
                message = [[NSString alloc] initWithFormat:@"%@", desc];
                /*
                 * There are no data bytes.  Is size in packet for this command padded.
                 * Can there be multiple commands in a packet containing this command?
                 */
                
            } else if (firstByte == 0xFC) {
                desc = @"MIDI Stop Message";
                message = [[NSString alloc] initWithFormat:@"%@", desc];
                /*
                 * There are no data bytes.  Is size in packet for this command padded.
                 * Can there be multiple commands in a packet containing this command?
                 */
                
            } else if (firstByte == 0xFE) {
                desc = @"MIDI Active Sense Message";
                message = [[NSString alloc] initWithFormat:@"%@", desc];
                /*
                 * There are no data bytes.  Is size in packet for this command padded.
                 * Can there be multiple commands in a packet containing this command?
                 */
                
            } else if (firstByte == 0xFF) {
                desc =@"MIDI Reset Message";
                message = [[NSString alloc] initWithFormat:@"%@", desc];
                /*
                 * There are no data bytes.  Is size in packet for this command padded.
                 * Can there be multiple commands in a packet containing this command?
                 */
                
            } else {
                desc =  @"???";
                message = [[NSString alloc] initWithFormat:@"      comm %d  %@ ch %d   \n", command, desc, channel];
                
            }
            
            
            if (localWindow != NULL) {
                [localWindow appendString:message];
            }
             
            // NSLog(@"%@", message);
            packet=MIDIPacketNext(packet);
        }
    };
    // *****  *****  *****  *****  *****  *****
    // *****  *****  *****  *****  *****  *****
    // *****  *****  *****  *****  *****  *****
    // *****  *****  *****  *****  *****  *****
    // *****  *****  *****  *****  *****  *****
    // *****  *****  *****  *****  *****  *****

    /*
     https://clang.llvm.org/docs/AutomaticReferenceCounting.html     https://stackoverflow.com/questions/14854521/where-and-how-to-bridge
     */

        NSLog(@"Using MIDIClientCreateWithBlock with MIDINotifyBlock");
        result = MIDIClientCreateWithBlock((CFStringRef)@"MIDI Client", &midiClient, notifyBlock2);
  
    if (result != noErr) {
        NSString *message = [[NSString alloc]initWithFormat:@"BRossToolsMIDIListenForInput2 MIDIClientCreate failed with code of %d \n ", result];
        [textWindow appendString:message];
    } else {
        result = MIDIObjectGetStringProperty(midiClient, kMIDIPropertyName, &clientName);
        NSString *message = [[NSString alloc]
            initWithFormat:@"Client created: name is *%@* \n", clientName];
        NSLog(@"Client created with name of *%@* \n", clientName);
        [textWindow appendString:message];
    }
    /*
     *  create input port
     */
    MIDIPortRef inputPort;
        NSLog(@"Using MIDIInputPortCreateWithBlock");
        result = MIDIInputPortCreateWithBlock(midiClient, (CFStringRef)@"Input", &inputPort, readBlock2);

    
     
    if (result != noErr) {
        NSString *message = [[NSString alloc]
            initWithFormat:@"Creating input port failed: code is %d \n ", result];
        [textWindow appendString:message];
    } else {
        result = MIDIObjectGetStringProperty(inputPort, kMIDIPropertyName, &portName);
        NSString *message = [[NSString alloc]
            initWithFormat:@"Input port created: name is *%@* \n", portName];
        [textWindow appendString:message];
        NSLog(@"%@", message);
    }
    /*
     *  Connect input port to keyboard.
     */
    void *connRefCon = (__bridge void *)windowValue;
    result = MIDIPortConnectSource(inputPort, sourceRef, connRefCon);
    if (result != noErr) {
        NSString *message = [[NSString alloc]
            initWithFormat:@"MIDIPortConnectSource failed with code of %d \n ", result];
        [textWindow appendString:message];
    } else {
        [textWindow appendString:@"Port connected to source\n"];
    }
}
- (void) killClient {
    OSStatus result;
    result = MIDIClientDispose(midiClient);
    [[virtual getAudioEngine] stop];
    NSString *message = [[NSString alloc] initWithFormat:@"Running killClient %d", result];
    NSLog(@"%@", message);
    // [textWindow appendString:message];
}


// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****

- (void) playMidiFile {
    // @todo not used at this time
}
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
- (void) recordMidiFile {
    // @todo not used at this time
}
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****

@end
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****
// *****  *****  *****  *****  *****  *****

