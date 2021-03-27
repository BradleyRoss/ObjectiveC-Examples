//
//  CoreMIDIsamples.h
//  BRossTools
//
//  Created by Bradley Ross on 3/18/21.
//
#import <Foundation/Foundation.h>
#import <CoreMIDI/CoreMIDI.h>
#ifndef CoreMIDIsamples_h
#define CoreMIDIsamples_h
/**
 Listens for keystrokes on a MIDI keyboard.
 */
@interface BRossToolsMIDIListenForInput:NSObject
+ (void) runtest;
@end

#endif /* CoreMIDIsamples_h */
