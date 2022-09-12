//
//  restart.h
//  Experiments2
//
//  Created by Bradley Ross on 8/25/22.
//
/**
  *    \file restart.h
 */
#ifndef restart_h
#define restart_h
#import <Foundation/Foundation.h>
#import <CoreMIDI/CoreMidi.h>
/**
 *  @brief An objective C class for selecting a source and destination.
 */
@interface endpoints:NSObject {
    MIDIObjectRef *source;
    MIDIObjectRef *destination;
}
/**
 *    Initialize a new object for holding a source/destination pair
 */
- (instancetype) init;
/**
 * Select the MIDI object to be used as the source.
 */
- (OSStatus) selectSource:(MIDIObjectRef *)objectRef;
/**
 * Select the MIDI object to be used as the destination.
 */
- (OSStatus) selectDestination:(MIDIObjectRef *)objectRef;
@end
#endif /* restart_h */
