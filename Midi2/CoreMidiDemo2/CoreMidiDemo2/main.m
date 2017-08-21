//
//  main.m
//  CoreMidiDemo2
//
//  Created by Bradley Ross on 8/21/17.
//  Copyright © 2017 Bradley Ross. All rights reserved.
//
/*
 * This is taken from http://xmidi.com/how-to-access-midi-devices-with-coremidi/
 * See https://developer.apple.com/documentation/coremidi/midi_services
 */
#import <stdio.h>
#import <time.h>
#import <Foundation/Foundation.h>
#import <CoreMIDI/CoreMIDI.h>

NSString *getDisplayName(MIDIObjectRef object);

int main(int argc, char *argv[])
{
    @autoreleasepool {
        time_t start = time(NULL);
        SInt32 uniqueId = 0;
        SInt32 version = 0;
        // CFStringRef name = NULL;
        // CFStringRef deviceName = NULL;
        CFStringRef description = NULL;
        CFStringRef manufacturer = NULL;
        CFStringRef displayName = NULL;
        SInt32 deviceID = 0;
    NSLog(@"Iterate through destinations");
    ItemCount destCount = MIDIGetNumberOfDestinations();
    for (ItemCount i = 0 ; i < destCount ; ++i) {
        
        // Grab a reference to a destination endpoint
        MIDIEndpointRef dest = MIDIGetDestination(i);
        /*  Should this be compared to 0 instead of NULL? */
        if (dest != 0) {
            NSLog(@"  Destination %lu: %@", i, getDisplayName(dest));
            /*
             * Code past this point in block was added to provide additional examples.
             */
            MIDIObjectGetIntegerProperty(dest,kMIDIPropertyUniqueID, &uniqueId);
            MIDIObjectGetIntegerProperty(dest, kMIDIPropertyDriverVersion, &version);
            MIDIObjectGetStringProperty(dest, kMIDIPropertyManufacturer, &manufacturer);
            MIDIObjectGetIntegerProperty(dest, kMIDIPropertyDeviceID, &deviceID);
            MIDIObjectGetStringProperty(dest, kMIDIPropertyModel, &description);
            NSLog(@"       Unique ID: %d", uniqueId);
            NSLog(@"       Device ID: %d", deviceID);
            NSLog(@"       Version: %d", version);
            NSLog(@"       Manufacturer: %@", manufacturer);
            NSLog(@"       Description: %@", description);
            NSLog(@"       Endpoint Reference: %d", dest);
        }
    }
    
    NSLog(@"Iterate through sources");
    // Virtual sources and destinations don't have entities
    ItemCount sourceCount = MIDIGetNumberOfSources();
    for (ItemCount i = 0 ; i < sourceCount ; ++i) {
        
        MIDIEndpointRef source = MIDIGetSource(i);
        // NSLog(@" *** Processing source  %lu", i);
        if (source != 0) {
            // NSLog(@"%d", source);
           MIDIObjectGetStringProperty(source, kMIDIPropertyManufacturer, &manufacturer);
            // NSLog(@"%@", manufacturer);
            MIDIObjectGetStringProperty(source, kMIDIPropertyDisplayName, &displayName);
            // NSLog(@"Point 2");
            // NSLog(@"  Source: %@", getDisplayName(source));
            NSLog(@"  Source (Display Name) %lu: %@", i, displayName);
            MIDIObjectGetIntegerProperty(source,kMIDIPropertyUniqueID, &uniqueId);
            MIDIObjectGetIntegerProperty(source, kMIDIPropertyDriverVersion, &version);
            MIDIObjectGetStringProperty(source, kMIDIPropertyManufacturer, &manufacturer);
            MIDIObjectGetIntegerProperty(source, kMIDIPropertyDeviceID, &deviceID);
            MIDIObjectGetStringProperty(source, kMIDIPropertyModel, &description);
            NSLog(@"       Unique ID: %d %08x", uniqueId, uniqueId);
            NSLog(@"       Device ID: %d", deviceID);
            NSLog(@"       Version: %d", version);
            NSLog(@"       Manufacturer: %@", manufacturer);
            NSLog(@"       Description: %@", description);
            NSLog(@"       Endpoint Reference: %d", source);

        }
    }
        UInt64 interval = time(NULL) - start;
        NSLog(@"Elapsed time: %llu seconds", interval);
}
}

NSString *getDisplayName(MIDIObjectRef object)
{
    // Returns the display name of a given MIDIObjectRef as an NSString
    CFStringRef name = nil;
    if (noErr != MIDIObjectGetStringProperty(object, kMIDIPropertyDisplayName, &name))
        return nil;
    return (__bridge NSString *)name;
}

