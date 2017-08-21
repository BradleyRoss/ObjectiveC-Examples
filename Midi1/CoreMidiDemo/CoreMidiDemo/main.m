//
//  main.m
//  CoreMidiDemo
//
//  Created by Bradley Ross on 8/21/17.
//  Copyright © 2017 Bradley Ross. All rights reserved.
//
/*
 *  This code is from http://xmidi.com/how-to-access-midi-devices-with-coremidi/
 */
#import <Foundation/Foundation.h>
#import<CoreMIDI/CoreMIDI.h>
NSString *getName(MIDIObjectRef object);
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // How many MIDI devices do we have?
        ItemCount deviceCount = MIDIGetNumberOfDevices();
        for (ItemCount i = 0 ; i < deviceCount ; ++i) {
            // Grab a reference to curent device
            MIDIDeviceRef device = MIDIGetDevice(i);
            NSLog(@"Device: %@", getName(device));
            // Is this device online? (Currently connected?)
            SInt32 isOffline = 0;
            MIDIObjectGetIntegerProperty(device, kMIDIPropertyOffline, &isOffline);
            NSLog(@"Device is online: %s", (isOffline ? "No" : "Yes"));
            
            // How many entities do we have?
            ItemCount entityCount = MIDIDeviceGetNumberOfEntities(device);
            
            // Iterate through this device's entities
            for (ItemCount j = 0 ; j < entityCount ; ++j) {
                
                // Grab a reference to an entity
                MIDIEntityRef entity = MIDIDeviceGetEntity(device, j);
                NSLog(@"  Entity: %@", getName(entity));
                
                // Iterate through this device's source endpoints (MIDI In)
                ItemCount sourceCount = MIDIEntityGetNumberOfSources(entity);
                for (ItemCount k = 0 ; k < sourceCount ; ++k) {
                    
                    // Grab a reference to a source endpoint
                    MIDIEndpointRef source = MIDIEntityGetSource(entity, k);
                    NSLog(@"    Source: %@", getName(source));
                }
                // Iterate through this device's destination endpoints
                ItemCount destCount = MIDIEntityGetNumberOfDestinations(entity);
                for (ItemCount k = 0 ; k < destCount ; ++k) {
                    
                    // Grab a reference to a destination endpoint
                    MIDIEndpointRef dest = MIDIEntityGetDestination(entity, k);
                    NSLog(@"    Destination: %@", getName(dest));
                }
            }
            NSLog(@"------");
        }
        return 0;
    }
    }
    
    NSString *getName(MIDIObjectRef object)
    {
        // Returns the name of a given MIDIObjectRef as an NSString
        /*
         * The original article stated that the bridge clause in the cast was
         * not required.  However, XCode insisted on it.  I assume that this is a change 
         * in the API.
         */
        CFStringRef name = nil;
        if (noErr != MIDIObjectGetStringProperty(object, kMIDIPropertyName, &name))
            return nil;
        return (__bridge NSString *)name;
    }



