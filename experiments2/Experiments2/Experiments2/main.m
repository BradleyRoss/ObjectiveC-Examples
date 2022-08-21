//
//  main.m
//  Experiments2
//
//  Created by Bradley Ross on 8/19/22.
//
/**
 
 *  [CoreMIDI documentation](https://developer.apple.com/documentation/coremidi?language=objc)
 *  [MIDI1UPNoteOn](https://developer.apple.com/documentation/coremidi/3667330-midi1upnoteon?language=objc)
 *    Order of parameters (group, channel, note, velocity)
 *    [MIDI article 1](https://people.carleton.edu/~jellinge/m208w14/pdf/02MIDIBasics_doc.pdf)
 *
 *   The functions such as MIDI1UPNoteOff, MIDI1UPNoteOn, MIDI1UPControlChange, MIDI11UPPitchBlend, etc. are actually CF_INLINE mscros defined in
 *       CoreMIDIMessages.h
 *      Look for MIDI 1.0 Universal MIDI Pscket (MIDI-1UP) Channel Voice Message generalized structure
 *
 *   MIDI1UPControlChange (UInt8 group, UInt8 channel, UInt8 index, UInt8 data)
 *      MIDI1UPChannelVoiceMessage (Uint8 group, UInt8 status, UInt8 channel, UInt8 data1, UInt8 data2)
 
 */
/*
 *
 */
#import <Foundation/Foundation.h>
#import <CoreMIDI/CoreMIDI.h>

void break32(MIDIMessage_32);
int main(int argc, const char * argv[]) {
    MIDIMessage_32 testMessage;

    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSLog(@"%@", @"Status Code is  9 for Note On, 8 for Note Off is 8");
        NSLog(@"%@", @" *****  Compare the next two calls");
        NSLog(@"%@", @"Call using MIDI1UPNoteOff");
        NSLog(@"%@", @"MIDI1UPNoteOff   group 0, channel 2, note x36, velocity x4A");
        testMessage = MIDI1UPNoteOff(0, 2, 0x36,0x4A);
        break32(testMessage);
        /**
         *  Status byte is 0x82, but it appears that the status parameter is just the first hexadecimal digit or 08
         *  MIDI1UPChannelVoiceMessage(UInt8 group, <#UInt8 status#>, <#UInt8 channel#>, <#UInt8 data1#>, <#UInt8 data2#>)
         *
         */
        NSLog(@"%@", @"Call using MIDI1UPChannelVoiceMessage");
        NSLog(@"%@", @"MIDI1UPChannelVoiceMessage, 0, 0x8, 2, 0x36, 0x4a");
        testMessage = MIDI1UPChannelVoiceMessage(0, 0x8, 2, 0x36, 0x4a);
        break32(testMessage);
        NSLog(@"%@", @"MIDI1UPNoteOff   group 1, channel 2, note x36, velocity x4A");
        testMessage = MIDI1UPNoteOff(1, 2, 0x36,0x4A);
        break32(testMessage);
        NSLog(@"%@", @"MIDI1UPNoteOn   group 0, channel 2, note x36, velocity x4A");
        testMessage = MIDI1UPNoteOn(0, 2, 0x36,0x4A);
        break32(testMessage);
        NSLog(@"%@", @"MIDI1UPNoteOn   group 1, channel 2, note x36, velocity x4A");
        testMessage = MIDI1UPNoteOn(1, 2, 0x36,0x4A);
        break32(testMessage);
        NSLog(@"%@", @"MIDI1UPNoteOn   group 1, channel 3, note x36, velocity x4A");
        testMessage = MIDI1UPNoteOn(1, 3, 0x36,0x4A);
        break32(testMessage);
        NSLog(@"%@", @"MIDI1UPNoteOn   group 1, channel 3, note x36, velocity x4A");
        testMessage = MIDI1UPNoteOn(1, 3, 0x36,0x4A);
        break32(testMessage);
        /*
         * Channel 2 program change  - status byte is C1
         * Change to instrument 0x36
         */
        NSLog(@"%@", @"group 0, status 0xc1, channel 2, data 1 (patch) 0x36");
        MIDI1UPChannelVoiceMessage(0, 0xC1, 2, 0x36, 0x0);
        break32(testMessage);
    }
    return 0;
}
void break32(MIDIMessage_32 value) {
    MIDIUniversalMessage *header;
    header = (MIDIUniversalMessage *) &value;
    NSLog(@"    testMessage %0x", value);
    NSLog(@"    group %x, type %x    ", header->group, header->type);
}
