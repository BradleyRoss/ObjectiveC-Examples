//
//  BRossToolsMIDIPacketListRead.m
//  BRossTools
//
//  Created by Bradley Ross on 4/14/21.
//

#import <Foundation/Foundation.h>
#import "BRossToolsMIDI.h"

MIDIPacketList *buildDummy(void);
float getSeconds(UInt64 ticks);
MIDITimeStamp getTicks(float seconds);
void printMessage(NSString* message, BRossToolsTextWindow *window);
/**
 * @brief Parse a MIDIPacketList
 */
@implementation BRossToolsMIDIPacketListRead {
    /**
     Pointer to window for displaying text.
     */
    BRossToolsTextWindow *textWindow;
    MIDIPacketList *packetList;
    MIDIPacket *currentPacket;
    UInt16 numPackets;
    /**
     Sequence number of the the MIDIPacket in the
           MIDIPacketList.
     */
    UInt16 packetCounter;
    MIDITimeStamp time;
    /**
    Start time for initializer in mach_absolute_time ticks
     */
    MIDITimeStamp startTicks;
    /**
     Number of data bytes in packet.
     */
    UInt16 packetBytes;
    /**
     Position of start of command in data bytes in packet.
     */
    UInt16 commandStart;
}
struct mach_timebase_info info;
uint32_t denom = 0;
uint32_t numer = 0;




- (instancetype) initWithWindow:(BRossToolsTextWindow *) window {
    textWindow = window;
    return self;
}
/**
 @brief Parse a MIDIPacketList object.
 
 When used with processPacket method, this method will parse a MIDIPacketList and the
 MIDIPacket objects contained within it.
 
 
 @param packetListIn MIDIPacketList object to be parsed.
 */
- (void) processPacketList:(MIDIPacketList *) packetListIn {
    packetList = packetListIn;
    numPackets = packetList->numPackets;
    startTicks = mach_absolute_time();
    if (textWindow != NULL) {
        NSString *message = [[NSString alloc] initWithFormat:@"MIDIPacketList has %d packets\n",packetList->numPackets];
        [textWindow appendString:message];
        
    }
    currentPacket = packetList->packet;
    for (packetCounter=0; packetCounter<numPackets; packetCounter++) {
        [self processPacket:currentPacket];
        currentPacket = MIDIPacketNext(currentPacket);
    }
}
/**
 @brief Process contents of a packet
 @todo insert code for SysEx
 @param packet Address of MIDIPacket
 */
- (void) processPacket:(MIDIPacket *) packet {
    NSString *message =[[NSString alloc] initWithFormat:@"Start of packet with %d bytes for %f seconds\n", packet->length, getSeconds(packet->timeStamp - startTicks)];
    [textWindow appendString:message];
    time=packet->timeStamp;
    packetBytes = packet->length;
    commandStart = 0;
    
    while (YES) {
        UInt8 command = packet->data[commandStart]/16;
        UInt8 channel = packet->data[commandStart] % 16;
        int length;
        switch  (command) {
            case kMIDICVStatusNoteOff:  // 8
                length = 3;
                message = [[NSString alloc] initWithFormat:@"NoteOff ch %d p %d v %d\n", channel, packet->data[commandStart +1],packet->data[commandStart+2]];
                break;
            case kMIDICVStatusNoteOn:  // 9
                length = 3;
                message = [[NSString alloc] initWithFormat:@"NoteOn ch %d p %d v %d\n", channel, packet->data[commandStart +1],packet->data[commandStart+2]];
                break;
            case kMIDICVStatusPolyPressure: // 10
                message = [[NSString alloc] initWithFormat:@"PolyPressure ch %d p %d press %d\n", channel, packet->data[commandStart +1],packet->data[commandStart+2]];
                length = 3;
                break;
            case kMIDICVStatusControlChange: // 11
                message = [[NSString alloc] initWithFormat:@"ControlChange ch %d control %d val %d\n", channel, packet->data[commandStart +1],packet->data[commandStart+2]];
                length = 3;
                break;
            case kMIDICVStatusProgramChange: // 12
                message = [[NSString alloc] initWithFormat:@"ProgramChange ch %d program %d\n", channel, packet->data[commandStart +1]];
                length = 2;
                break;
            case kMIDICVStatusChannelPressure: // 13
                length = 2;
                message = [[NSString alloc] initWithFormat:@"ChannelPressure ch %d program %d\n", channel, packet->data[commandStart +1]];
                break;
            case kMIDICVStatusPitchBend:  // 14
                length = 3;
                message = [[NSString alloc] initWithFormat:@"PitchBend ch %d data %d %d\n", channel, packet->data[commandStart +1], packet->data[commandStart+2]];
                break;
            case 15:
                /*
                 * @todo Needs more work for status bytes from 0xF0 to 0xFF
                 * @see https://ccrma.stanford.edu/~craig/articles/linuxmidi/misc/essenmidi.html
                 */
                if (channel == 0) {
                    length = 1000;
                    message = @"MIDI System Exclusive message (start)\n";
                } else if (channel == 1) {
                    length = 2;
                    message =  @"MIDI Quarter Frame message";
                }else if (channel == 2) {
                    length = 3;
                    message = @"MIDI Song Position message";
                } else if (channel ==3) {
                    length = 2;
                    message = @"MIDI Song Request message\n";
                } else if (channel == 4 || channel == 5 || channel == 9) {
                    length = 1000;
                    message = @"Unknown command\n";
                } else if (channel == 6) {
                    length = 1;
                    message = @"MIDI Tune Request message";
                } else if (channel == 7) {
                    length = 5000;
                    message = @"SysEx Continuation";
                } else if (channel == 8) {
                    length = 1;
                    message = @"MIDI Clock message";
                } else if (channel == 10) {
                    length = 1;
                    message = @"MIDI Start message\n";
                } else if (channel == 11) {
                    length = 1;
                    message = @"MIDI Continue message\n";
                } else if (channel == 12) {
                    length = 1;
                    message = @"MIDI Stop message\n";
                } else if (channel == 13) {
                    length = 5000;
                    message = [[NSString alloc] initWithFormat:@"Unknown command - channel nibble is %xd \n", channel];
                } else if (channel == 14) {
                    length = 1;
                    message = @"MIDI Active Sense message";
                } else if (channel == 15) {
                    length = 1;
                    message = @"MIDI Reset message\n";
                } else {
                    NSLog(@"This point should never be reached - abortng");
                    length = 1;
                }
                break;
            default:
                NSLog(@"Unrecognized command code %d - Should never be reached\n",command);
                length = 5000;
        }
        printMessage(message, textWindow);
        commandStart = commandStart + length;
        if (commandStart >= packetBytes) {
            return;
        }
    }
}
/**
 * @brief Display message
 *
 * The message will be displayed via NSLog or BRossToolsTextWindow depending
 * on the value of window
 *
 * @param message Messsage to be displayed
 * @param window BRossToolsTextWindow  object to be used
 */
void printMessage(NSString* message, BRossToolsTextWindow *window) {
    if (window == NULL) {
        NSLog(@"%@", message);
    } else {
        [window appendString:message];
    }
}


@end
/**
 * @brief Create a dummy MIDIPacketList and parses it.
 */
@implementation TestReadDummy
- (void) runtest {
    
    BRossToolsTextWindow *window = [BRossToolsTextWindow newWindow];
    MIDIPacketList *list = buildDummy();
    [window appendString:@"Dummy MIDIPacketList has been created\n"];
    BRossToolsMIDIPacketListRead *reader = [[BRossToolsMIDIPacketListRead alloc] initWithWindow:window];

    [reader processPacketList:list];
    
    
}

@end
/**
  * @brief Send a dummy MIDIPacketList to a MIDI destination
 *
 *  The MIDI information is sent to the first destination found via MIDI'GetNumberOfDestinations
 * and MIDIGetDestination.
 */
@implementation TestSendDummy
/**
 * Send a dummy MIDIPacketList to a destination.
 */
- (void) runtestWithWindow:(BRossToolsTextWindow *) window {
    CFStringRef destinationName;
    MIDIEndpointRef destinationRef;
    MIDIPortRef   portRef;
    MIDIClientRef midiClient;
    CFStringRef  clientName;
    CFStringRef  portName;
    OSStatus result;
    MIDINotifyBlock notifyBlock = ^(const MIDINotification *message) {
        NSLog(@"MIDINotifyBlock notifyBlock has been called ");
    };
    CFIndex count = MIDIGetNumberOfDestinations();
    if (count == 0) {
        if (window == NULL) {
        NSLog(@"No destinations found, aborting");
        } else {
            [window appendString:@"No destinations found, aborting"];
        }
            return;
        }
        destinationRef = MIDIGetDestination((CFIndex)0);
        result = MIDIObjectGetStringProperty(destinationRef, kMIDIPropertyName, &destinationName);
            if (result == noErr) {
                if (window != NULL) {
                NSString *message = [[NSString alloc]
                        initWithFormat:@"Name of source is *%@* \n", destinationName];
                
                [window appendString:message];
                NSLog(@"%@", message);
                }
            } else {
                if (window != NULL) {
                NSString *message = [[NSString alloc]
                    initWithFormat:@"Error obtaining source name - code: %d \n", result];
                [window appendString:message];
                } else {
                    NSLog(@"Error obtaining source name - code: %d \n", result);
                }
                
    }
    /*
     *  Create client
     */

        result = MIDIClientCreateWithBlock((CFStringRef)@"MIDI Client", &midiClient, notifyBlock);
   
    if (result != noErr) {
        if (window == NULL) {
            NSLog(@"BRossToolsMIDIListenForInput2 MIDIClientCreate failed with code of %d \n ", result);
        } else {
            NSString *message = [[NSString alloc]initWithFormat:@"BRossToolsMIDIListenForInput2 MIDIClientCreate failed with code of %d \n ", result];
            [window appendString:message];
        }
    } else {
        result = MIDIObjectGetStringProperty(midiClient, kMIDIPropertyName, &clientName);
        if (window == NULL) {
            NSLog(@"Client created with name of *%@* \n", clientName);
        } else {
            NSString *message = [[NSString alloc]
                initWithFormat:@"Client created: name is *%@* \n", clientName];
            [window appendString:message];
        }
    }
    /*
     *  create output port
     */
    
     result = MIDIOutputPortCreate(midiClient, (CFStringRef)@"OutputPort", &portRef);

     
    if (result != noErr) {
        if (window == NULL) {
            NSLog(@"Creating output port failed: code is %d \n ", result);
        } else {
            NSString *message = [[NSString alloc]
            initWithFormat:@"Creating output port failed: code is %d \n ", result];
            [window appendString:message];
        }
    } else {
        if (window == NULL) {
            NSLog(@"Input port created: name is *%@* \n", portName);
        } else {
            result = MIDIObjectGetStringProperty(portRef, kMIDIPropertyName, &portName);
            NSString *message = [[NSString alloc]
                                 initWithFormat:@"Output port created: name is *%@* \n", portName];
            [window appendString:message];
        }
    }
    
    /*
     * Build MIDIPacketList and send to destination.
     @todo insert code for sending MIDIPacketList here
     
     @todo  Does output port have to be connected to destination
     */
    MIDIPacketList *packetList = buildDummy();
    result = MIDISend(portRef, destinationRef, packetList);
    if (result != noErr) {
        if (window == NULL) {
            NSLog(@"MIDISend failed with code of %d \n ", result);
        }else {
            NSString *message = [[NSString alloc]
            initWithFormat:@"MIDISend failed with code of %d \n ", result];
        [window appendString:message];
        }
    } else {
        if (window == NULL) {
            NSLog(@"MIDIPacketList sent to destination");
        } else {
        [window appendString:@"Output port connected to destination\n"];
        }
    }
}

- (void) runtest {
    [self runtestWithWindow:NULL];
    
}

@end
/**
 @brief Creates a dummy MIDIPacketList for testing purposes.
 
 The purpose of this function  is to create a dummy MIDIPacketList with the time stamps set a fraction of a second into
 the future.
 
 @returns MIDIPacketList
 */
MIDIPacketList *buildDummy() {
    MIDIPacketList *generatedPacketList;
    void *allocationPacketList;
    void *allocationData;
    UInt16 counter;
    MIDITimeStamp  startTicks = mach_absolute_time();
    MIDITimeStamp  time;
    Byte *data;
    allocationPacketList = CFAllocatorAllocate(kCFAllocatorDefault, 4096, 0);
    generatedPacketList = (MIDIPacketList *) allocationPacketList;
    allocationData = CFAllocatorAllocate(kCFAllocatorDefault, 100, 0);
    data =  allocationData;
    MIDIPacket *packet = MIDIPacketListInit(generatedPacketList);
    for (counter = 0; counter < 5; counter++) {
        time = startTicks + getTicks(0.5 + counter*1.0);
        // packet->length = 0;
        // packet->timeStamp = time;
        data[0] = kMIDICVStatusNoteOn * 16;
        data[1] = 55 + counter;
        data[2] = 64;
        data[3] = kMIDICVStatusNoteOn * 16;
        data[4] = 58 + counter;
        data[5] = 64;
        data[6] = kMIDICVStatusNoteOn * 16;
        data[7] = 61 + counter;
        data[8] = 64;
        // packet->length = 9;
        packet = MIDIPacketListAdd(generatedPacketList, 4096, packet, time, 9, data);
        time = startTicks + getTicks(1.0 + counter*1.0);
        // packet->length = 0;
        // packet->timeStamp = time;
        data[0] = kMIDICVStatusNoteOff * 16;
        data[1] = 55 + counter;
        data[2] = 64;
        data[3] = kMIDICVStatusNoteOff * 16;
        data[4] = 58 + counter;
        data[5] = 64;
        data[6] = kMIDICVStatusNoteOff * 16;
        data[7] = 61 + counter;
        data[8] = 64;
        // packet->length = 9;
        packet = MIDIPacketListAdd(generatedPacketList, 4096, packet, time, 9, data);
    }
    return generatedPacketList;
}
    /*
     @brief Converts mach_absolute_time ticks to seconds
     @param ticks time duration in mach_absolute_time ticks
     @return time duration in seconds
     */

    float getSeconds(UInt64 ticks) {
        if (numer == 0) {
            kern_return_t kern_result = mach_timebase_info(&info);
            if (kern_result == KERN_SUCCESS) {
                numer = info.numer;
                denom = info.denom;
            }
        }
        return ticks / 1.0e9 * numer / denom;
    }
    /**
     @brief Converts time in seconds to mach_absolute_time ticks
     @param seconds time duration in seconds
     @return tiime duration in mach_absolute_time ticks
     */
    MIDITimeStamp getTicks(float seconds) {
        if (numer == 0) {
            kern_return_t kern_result = mach_timebase_info(&info);
            if (kern_result == KERN_SUCCESS) {
                numer = info.numer;
                denom = info.denom;
            }
        }
        return (MIDITimeStamp)(seconds * (float)denom / (float)numer * 1.0e9);
    }

