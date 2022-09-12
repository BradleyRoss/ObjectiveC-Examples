//
//  configuration.h
//  Experiments2
//
//  Created by Bradley Ross on 9/8/22.
//

#ifndef configuration_h
#define configuration_h

#include <stdio.h>
#include <string.h>
#include <CoreMidi/CoreMidi.h>
#include <CoreFoundation/CoreFoundation.h>
/**
 *   @brief Shows properties of MIDI devices, entities, and endpoints.
 *
 *    [MIDIObjectGetStringProperty](https://developer.apple.com/documentation/coremidi/1495282-midiobjectgetstringproperty?language=objc)
 *
 *    [MIIDIObjectSetStringProperty](https://developer.apple.com/documentation/coremidi/1495173-midiobjectsetstringproperty?language=objc)
 *
 *    [MIDIObjectGetDataProperty](https://developer.apple.com/documentation/coremidi/1495213-midiobjectgetdataproperty?language=objc)
 *
 *    [MIDIObjectSetDataProperty](https://developer.apple.com/documentation/coremidi/1495169-midiobjectsetdataproperty?language=objc)
 *
 *    [MIDIObjectGetDictionaryProperty](https://developer.apple.com/documentation/coremidi/1495154-midiobjectgetdictionaryproperty?language=objc   )
 *
 *    [MIDIObjectSetDictionaryProperty](https://developer.apple.com/documentation/coremidi/1495160-midiobjectsetdictionaryproperty?language=objc)
 *
 *    [MIDIObjectGetIntegerProperty](https://developer.apple.com/documentation/coremidi/1495364-midiobjectgetintegerproperty?language=objc )
 *
 *    [MIDIObjectSetIntegerProperty](https://developer.apple.com/documentation/coremidi/1495378-midiobjectsetintegerproperty?language=objc)
 *
 */
void showConfiguration(void);
void deviceInfo(MIDIDeviceRef device);
void entityInfo(MIDIEntityRef entity);
void sourceInfo(MIDIEndpointRef source);
void destinationInfo(MIDIEndpointRef destination);
Boolean CStringPtr (CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding );

#endif /* configuration_h */
