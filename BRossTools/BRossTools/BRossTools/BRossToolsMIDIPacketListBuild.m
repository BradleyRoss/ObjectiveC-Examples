//
//  BRossToolsMIDIPacketListBuild.m
//  BRossTools
//
//  Created by Bradley Ross on 4/14/21.
//

#import <Foundation/Foundation.h>
#import "BRossToolsMIDI.h"
#define PACKETLIST_SIZE 1024

@implementation BRossToolsMIDIPacketListBuild {
    NSMutableArray *packets;
    MIDIPacketList *assembly;
    UInt32 bufferLength;
    UInt64 offset;
    UInt64 startTime;
    MIDIPacketList *packetList;
    struct mach_timebase_info info;

    MIDIPacket *currentPacket;
    MIDIPortRef port;
    MIDIEndpointRef dest;
    
}
    uint32_t denom;
    uint32_t numer;

- (instancetype) init {
    startTime = mach_absolute_time();
    
    if (packetList) {
           free(packetList);
           packetList = NULL;
       }

       packetList = (MIDIPacketList *)malloc(PACKETLIST_SIZE * sizeof(char));
       currentPacket = MIDIPacketListInit(packetList);
    kern_return_t kern_result = mach_timebase_info(&info);

    if (kern_result == KERN_SUCCESS) {
        numer = info.numer;
        denom = info.denom;
    printf("Mach time conversion numerator: %d denominator: %d\n",numer, denom );
        
    } else {
        numer = 1;
        denom = 1;
    }
    startTime = mach_absolute_time();

   
    return self;
}
- (instancetype)initWithWindow:(BRossToolsTextWindow *) window {
    return self;
}
- (void) setDelay:(float)delay {
    
}
- (MIDIPacketList *) build{
        return (MIDIPacketList *) NULL;;
}

- (MIDIPacketList *) sendPacketList {
    int result;
    result = MIDISend( port,  dest, packetList);
    return packetList;
}
- (void) setPort:(MIDIPortRef)portValue {
    port = portValue;
}
- (void) setDest:(MIDIEndpointRef)destValue {
    dest = destValue;
}
- (int) addCommand:(u_int)command channel:(u_int)channel values:(u_int *)values {
    int length;
    switch (command) {
        case kMIDICVStatusNoteOff:
        case kMIDICVStatusNoteOn:
        case kMIDICVStatusPolyPressure:
        case kMIDICVStatusControlChange:
            length = 3;
            break;
        case kMIDICVStatusProgramChange:
        case kMIDICVStatusChannelPressure:
            length = 2;
            break;
        case kMIDICVStatusPitchBend:
            length = 3;
        default:
            NSLog(@"Unrecognized command code %d",command);
            return 1;
    }
    return 0;
}
- (int *) addPacket:(MIDITimeStamp) time {
    return 0;
}
/*
 @brief Converts mach_absolute_time ticks to seconds
 @param ticks time duration in mach_absolute_time ticks
 @return time duration in seconds
 - (void) setPort:portValue {
     port = portValue;
 }
 - (void) setDest:destValue {
    dest = destValue;
 }
 uint64_t multiplied = packet->timeStamp * numer / denom;
 printf(" %llx %lld MIDITimeStamp nanoseconds\n", multiplied, multiplied);
 double seconds = (double)multiplied / 1.0e9;
 printf(" %f  MIDITimeStamp seconds\n",
       seconds);
 */




@end
