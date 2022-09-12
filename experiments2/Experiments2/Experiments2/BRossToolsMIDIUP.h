//
//  BRossToolsMIDIUP.h
//  Experiments2
//
//  Created by Bradley Ross on 8/24/22.
//
/**
 *  \file BRossToolsMIDIUP.h
 *  @brief tests using universal MIDI packets
 * @todo Documentation for functions, constants, classes, etc. should list the location of the header file
 */
#ifndef BRossToolsMIDIUP_h
#define BRossToolsMIDIUP_h
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <stdio.h>
#import <time.h>
#import <AppKit/AppKit.h>
#import <CoreMIDI/CoreMIDI.h>
#import <AVFAudio/AVFAudio.h>
/*
 *   https://opensource.apple.com/source/xnu/xnu-792/osfmk/mach/mach_time.h.auto.html
 *   https://stackoverflow.com/questions/1450737/what-is-mach-absolute-time-based-on-on-iphone
 *   https://developer.apple.com/library/archive/qa/qa1398/_index.html
 */
#import <mach/mach_time.h>
#import <Foundation/Foundation.h>
#import <CoreMIDI/CoreMIDI.h>
typedef struct mach_timebase_info       *mach_timebase_info_t;
typedef struct mach_timebase_info       mach_timebase_info_data_t;
@interface packetUP:NSObject


@end
/**
 * The following was contained in the header for the MIDIEventList struct.
 *  MIDIEventList packetList
 * MIDIEventPacket *packet = &packetList->packet[0];
 * for (unsigned i=0; i< packetList->numPackets; ++i) {
 * //   determine MIDI events by reading the contents of packet
 * // packet->timeStamp  '
 * // packet->wordCount
 * //  packet->words[]
 * // Parse packet
 *       packet = MIDIEventPacketNext(packet);
 *  }
 */
 void parseMIDIEventList(MIDIEventList *eventList);
/**
 *  @brief Test for generating and reading MIDIEventList.
 *
 *   This is option 8 in the original menu.
 */

 void buildMIDIEventList(void);
/**
 * @brief calculates number of mach_absolute_time ticks per second.
 */
double ticksPerSecond(void);

#endif /* BRossToolsMIDIUP_h */
