//
//  sourceListener.m
//  Experiments2
//
//  Created by Bradley Ross on 8/27/22.
//
/**
 *  \file sourceListener.m
 */
#import <Foundation/Foundation.h>
#import "stdio.h"
#import "time.h"

#import "sourceListener.h"
@implementation sourceListener
- (instancetype) initAndStart {
    UInt EventListsProcessed;
    EventListsProcessed = 0;
    MIDINotifyBlock notifyBlock = ^(const MIDINotification *message) {
                //NSLog(@"MIDINotifyBlock notifyBlock has been called ");
        printf("Notify block has been called\n");
    };
    /* The following is described in the headers as the means to read the packets in a
     * MIDIEventPacketList
     *
     * MIDIEventPacket *packet = &packetList->packet[0]
     * for (unsigned i = 0; i < packetList->numPackets; ++i) {
     *    ... process packet
     *  packet = MIDIEventPacketNext (packet);
     * }
     *
     *  Why ++i instead of i++? Does it make a difference?
     */
    MIDIReceiveBlock receiveBlock = ^(const MIDIEventList *evtList, void *srcConnRefCon){
      //  [textWindow appendString:@"MIDIReceiveBlock receiveBlock has been called \n"];
        /*
         *  https://stackoverflow.com/questions/3673226/how-to-print-time-in-format-2009-08-10-181754-811
        time_t timer;
        char buffer[26];
        struct tm* tm_info;
        timer = time(NULL);
        tm_info = localtime(&timer);
        strftime(buffer, 26, "%H:%M:%S", tm_info);
        puts(buffer);
        */
        printf("Receive block has been called to read MIDIEventList\n");
        double seconds = [self->machTiming getTime];
        UInt32 packetCount = evtList->numPackets;
            printf("    Time: %f  seconds,    Number of packets = %d,   ", seconds, packetCount);
       // [processEventList processList:evtList];
        if ( evtList->protocol == kMIDIProtocol_1_0 ) {
            printf ("     MIDI 1.0\n");
        } else if (evtList->protocol == kMIDIProtocol_2_0) {
            printf ("     MIDI 2.0\n");
        }
    };
    machTiming = [[MachTiming alloc] init];
    endpoints *ends = [[endpoints alloc] init];
    OSStatus result = [ends selectSource:&sourceID];
    if (result != noErr) {
        printf("Error initializing endpoints: %d \n", (int)result);
    }
    result = MIDIClientCreateWithBlock((CFStringRef)@"MIDI Client", &clientID, notifyBlock);
    if (result != noErr) {
        printf("Error creating client: %d \n", (int)result);
    }
    result = MIDIInputPortCreateWithProtocol(clientID, (CFStringRef)@"inputPort", kMIDIProtocol_1_0, &inputPort, receiveBlock);
    if (result != noErr) {
        printf("Error creating input port: %d \n", (int)result);
    }
    result = MIDIPortConnectSource(inputPort, sourceID, @"Midi test");
    if (result != noErr) {
        printf("Error connecting input port: %d \n", (int)result);
    }
    return self;
}
- (void) stopListener {
    [self stopListener];
}
@end

