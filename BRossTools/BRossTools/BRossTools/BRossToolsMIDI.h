//
//  CoreMIDIsamples.h
//  BRossTools
//
//  Created by Bradley Ross on 3/18/21.
//
#import <Foundation/Foundation.h>
#import <CoreMIDI/CoreMIDI.h>
#ifndef BRossToolsMIDI_h
#define BRossToolsMIDI_h
/**
 @brief Use CoreMIDI to read key strokes for notes.
 
 Listens for keystrokes on a MIDI keyboard.
 
 I first tried using this
 [starting eample](http://comelearncocoawithme.blogspot.com/2011/08/reading-from-external-controllers-with.html]
 however it gave me a message that the program was trying to start a task on
 the main queue and that was not allowed.  It also gave me a number of statements
 that functions used in the program were deprecated.
 
 */

@interface BRossToolsMIDIListenForInput:NSObject
- (void) runtest;
@end

/**
 @brief Version with oldest variants.
 
 Running this version resulted in the following message being sent to the log.
 
 2021-03-31 20:59:33.847954-0400 BRossTools[12359:542211] [plugin] AddInstanceForFactory: No factory registered for id <CFUUID 0x60000398e400> F8BB1C28-BAE8-11D6-9C31-00039315CD46
 */
@interface BRossToolsMIDIListenForInput2:NSObject
- (void) runtest;
@end


#endif /* BRossToolsMIDI_h */
