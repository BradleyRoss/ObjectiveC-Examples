//
//  main.m
//  MIDIConstantStudy
//
//  Created by Bradley Ross on 9/17/17.
//  Copyright © 2017 Bradley Ross. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <CoreMidi/CoreMidi.h>
#include <string.h>
#include <stdio.h>
void printList1();
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
         *   https://developer.apple.com/documentation/corefoundation/cfstring-rfh
         *   https://developer.apple.com/library/content/documentation/CoreFoundation/Conceptual/CFStrings/introCFStrings.html#//apple_ref/doc/uid/10000131i
         *   https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/Strings/introStrings.html#//apple_ref/doc/uid/10000035-SW1
         *   https://developer.apple.com/documentation/corefoundation/cfstringencoding?language=objc
         *   https://developer.apple.com/documentation/corefoundation/cfstringbuiltinencodings?language=objc
         *   https://developer.apple.com/documentation/corefoundation/cfstringencodings?language=objc
         */
        NSLog(@"Some examples of string functions");
        CFStringEncoding encoding = kCFStringEncodingISOLatin1;
        NSString *item = @"*This is a test*";
        NSLog(@"NSString object item created using *This is a test*");
        NSLog(@"Print item as NSString: %@", item);
        char *cstring = [item UTF8String];
        NSLog(@"C String cstring created using [item UTF8String]");
        NSLog(@"Print cstring as C String %s", cstring);
        NSLog (@"Printing cstring: %s", (char *) cstring);
        char ctest[] = "*This is test 2*";
        NSLog(@"Create C String ctest with *This is test 2*");
        CFStringRef item2 = CFStringCreateWithCString(NULL, (char *) &ctest, encoding);
        NSLog(@"Create CFString item2 from C String ctest");
        NSLog(@"Printing C String ctest: %s", (char *) &ctest);
        NSLog(@"Printing CFStringRef item2: %@", item2);
        NSLog(@"-----");
        printList1();
        NSLog(@"-----");
        /*
         *  The constants are not populated until after the first MIDI function call
         */
        NSLog(@"-----");
        ItemCount deviceCount = MIDIGetNumberOfDevices();
        NSLog(@"Number of MIDI Devices: %lu", deviceCount);
        NSLog(@"Calling MIDI method initializes constants");
        printList1();
    }
    return 0;
}
/**
 *   Print string values used for setting and getting MIDI properties.
 *   <p>The getter and setter methods for MIDI properties use CFString values
 *      to determine the property to be read or written.  The CoreMidi framework 
 *      has defined a number of constants that can be used to specify properties.
 *      The names of the constants all start with kMIDIProperty and the values
 *      of the constants are the string values to be placed in the dictionary
 *      containing the property information.  A list of the constants can be
 *      found at 
 *      <a href="https://developer.apple.com/documentation/coremidi/midi_services/global_constants?language=objc" target="_blank">
 *      Documentation -> Core MIDI -> MIDI Services -> Global Constants</a>
 *      </p>
 *   <p>The values for the constants are not set 
 *      until after the first Core MIDI method is executed.</p>
 *   <p>Note: It appears that the XCode editor wants the tags to begin and end on the same line.</p>
 */
void printList1() {
        NSLog(@"-----");
        NSLog (@"CoreMidi Midi Services - Global Constants (CFStringRef)");
        NSLog (@"kMIDIPropertyAdvanceScheduleTimeMuSec: %@", kMIDIPropertyAdvanceScheduleTimeMuSec);
        NSLog (@"kMIDIPropertyCanRoute: %@", kMIDIPropertyCanRoute);
        NSLog (@"kMIDIPropertyConnectionUniqueID: %@", kMIDIPropertyConnectionUniqueID);
        NSLog (@"kMIDIPropertyDeviceID: %@", kMIDIPropertyDeviceID);
        NSLog (@"kMIDIPropertyDisplayName: %@", kMIDIPropertyDisplayName);
        NSLog (@"kMIDIPropertyDriverDeviceEditorApp: %@", kMIDIPropertyDriverDeviceEditorApp);
        NSLog (@"kMIDIPropertyDriverOwner: %@", kMIDIPropertyDriverOwner);
        NSLog (@"kMIDIPropertyDriverVersion: %@", kMIDIPropertyDriverVersion);
        NSLog (@"kMIDIPropertyImage: %@", kMIDIPropertyImage);
        NSLog (@"kMIDIPropertyIsBroadcast: %@", kMIDIPropertyIsBroadcast);
        NSLog (@"kMIDIPropertyIsDrumMachine: %@", kMIDIPropertyIsDrumMachine);
        NSLog (@"kMIDIPropertyIsEffectUnit: %@", kMIDIPropertyIsEffectUnit);
        NSLog (@"kMIDIPropertyIsEmbeddedEntity: %@", kMIDIPropertyIsEmbeddedEntity);
        NSLog (@"kMIDIPropertyIsMixer: %@", kMIDIPropertyIsMixer);
        NSLog (@"kMIDIPropertyIsSampler: %@", kMIDIPropertyIsSampler);
        NSLog (@"kMIDIPropertyManufacturer: %@", kMIDIPropertyManufacturer);
        NSLog (@"kMIDIPropertyMaxReceiveChannels: %@", kMIDIPropertyMaxReceiveChannels);
        NSLog (@"kMIDIPropertyMaxSysExSpeed: %@", kMIDIPropertyMaxSysExSpeed);
        NSLog (@"kMIDIPropertyMaxTransmitChannels: %@", kMIDIPropertyMaxTransmitChannels);
        NSLog (@"kMIDIPropertyModel: %@", kMIDIPropertyModel);
        NSLog (@"kMIDIPropertyName: %@", kMIDIPropertyName);
        NSLog (@"kMIDIPropertyNameConfiguration: %@", kMIDIPropertyNameConfiguration);
        NSLog (@"kMIDIPropertyOffline: %@", kMIDIPropertyOffline);
        NSLog (@"kMIDIPropertyPanDisruptsStereo: %@", kMIDIPropertyPanDisruptsStereo);
        NSLog (@"kMIDIPropertyPrivate: %@", kMIDIPropertyPrivate);
        NSLog (@"kMIDIPropertyReceiveChannels: %@", kMIDIPropertyReceiveChannels);
        NSLog (@"kMIDIPropertyReceivesBankSelectLSB: %@", kMIDIPropertyReceivesBankSelectLSB);
        NSLog (@"kMIDIPropertyReceivesBankSelectMSB: %@", kMIDIPropertyReceivesBankSelectMSB);
        NSLog (@"kMIDIPropertyReceivesClock: %@", kMIDIPropertyReceivesClock);
        NSLog (@"kMIDIPropertyReceivesMTC: %@", kMIDIPropertyReceivesMTC);
        NSLog (@"kMIDIPropertyReceivesNotes: %@", kMIDIPropertyReceivesNotes);
        NSLog (@"kMIDIPropertyReceivesProgramChanges: %@", kMIDIPropertyReceivesProgramChanges);
        NSLog (@"kMIDIPropertySingleRealtimeEntity: %@", kMIDIPropertySingleRealtimeEntity);
        NSLog (@"kMIDIPropertySupportsGeneralMIDI: %@", kMIDIPropertySupportsGeneralMIDI);
        NSLog (@"kMIDIPropertySupportsMMC: %@", kMIDIPropertySupportsMMC);
        NSLog (@"kMIDIPropertySupportsShowControl: %@", kMIDIPropertySupportsShowControl);
        NSLog (@"kMIDIPropertyTransmitChannels: %@", kMIDIPropertyTransmitChannels);
        NSLog (@"kMIDIPropertyTransmitsBankSelectLSB: %@", kMIDIPropertyTransmitsBankSelectLSB);
        NSLog (@"kMIDIPropertyTransmitsBankSelectMSB: %@", kMIDIPropertyTransmitsBankSelectMSB);
        NSLog (@"kMIDIPropertyTransmitsClock: %@", kMIDIPropertyTransmitsClock);
        NSLog (@"kMIDIPropertyTransmitsMTC: %@", kMIDIPropertyTransmitsMTC);
        NSLog (@"kMIDIPropertyTransmitsNotes: %@", kMIDIPropertyTransmitsNotes);
        NSLog (@"kMIDIPropertyTransmitsProgramChanges: %@", kMIDIPropertyTransmitsProgramChanges);
        NSLog (@"kMIDIPropertyUniqueID: %@", kMIDIPropertyUniqueID);
    }

