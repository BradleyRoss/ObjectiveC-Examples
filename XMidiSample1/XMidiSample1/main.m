//
//  main.m
//  CoreMidiDemo2
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
void elapsed();
void endpointData(MIDIEndpointRef endPoint, MIDIDeviceRef device, MIDIEntityRef entity);
struct timespec wallStart;
/**
 * Main driver.
 *
 * @param argc Number of arguments
 * @param argv List of arguments
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        clock_gettime(CLOCK_MONOTONIC, &wallStart);
        // How many MIDI devices do we have?
        ItemCount deviceCount = MIDIGetNumberOfDevices();
        NSLog(@"Number of MIDI Devices: %lu", deviceCount);
        NSLog(@"-----");
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
                    endpointData(source, device, entity);
                }
                // Iterate through this device's destination endpoints
                ItemCount destCount = MIDIEntityGetNumberOfDestinations(entity);
                for (ItemCount k = 0 ; k < destCount ; ++k) {
                    
                    // Grab a reference to a destination endpoint
                    MIDIEndpointRef dest = MIDIEntityGetDestination(entity, k);
                    NSLog(@"    Destination: %@", getName(dest));
                    endpointData(dest, device, entity);
                }
            }
            NSLog(@"------");
        }
        return 0;
    }
}
void elapsed() {
    struct timespec current;
    clock_gettime(CLOCK_MONOTONIC, &current);
    double elapsed;
    elapsed = (current.tv_sec - wallStart.tv_sec);
    elapsed += (current.tv_nsec - wallStart.tv_nsec)/1000000000.0;
    NSLog(@"Elapsed Wall Time: %f seconds", elapsed);
}
void endpointData(MIDIEndpointRef ref, MIDIDeviceRef device, MIDIEntityRef entity) {
    SInt32 uniqueId = 0;
    SInt32 version = 0;
    SInt32 deviceUniqueId = 0;
    CFStringRef description = NULL;
    CFStringRef manufacturer = NULL;
    CFStringRef displayName = NULL;
    CFStringRef name = NULL;
    SInt32 deviceID = 0;
    MIDIObjectGetIntegerProperty(device, kMIDIPropertyUniqueID, &deviceUniqueId);
    MIDIObjectGetStringProperty(ref, kMIDIPropertyDisplayName, &displayName);
    MIDIObjectGetStringProperty(ref, kMIDIPropertyName, &name);
    MIDIObjectGetIntegerProperty(ref,kMIDIPropertyUniqueID, &uniqueId);
    MIDIObjectGetIntegerProperty(device, kMIDIPropertyDriverVersion, &version);
    MIDIObjectGetStringProperty(ref, kMIDIPropertyManufacturer, &manufacturer);
    MIDIObjectGetIntegerProperty(device, kMIDIPropertyDeviceID, &deviceID);
    MIDIObjectGetStringProperty(ref, kMIDIPropertyModel, &description);
    NSLog(@"       Name: %@: ", name);
    NSLog(@"       Display Name : %@", displayName);
    NSLog(@"       Device Unique ID: %d %08x", deviceUniqueId, deviceUniqueId);
    NSLog(@"       Endpoint Unique ID: %d %08x", uniqueId, uniqueId);
    NSLog(@"       Device ID: %d", deviceID);
    NSLog(@"       Version: %d", version);
    NSLog(@"       Manufacturer: %@", manufacturer);
    NSLog(@"       Description: %@", description);
    NSLog(@"       Endpoint Reference: %d", ref);
    NSLog(@"       Display Name : %@", displayName);
}

NSString *getName(MIDIObjectRef object) {
    // Returns the name of a given MIDIObjectRef as an NSString
    /*
     * The original article stated that the bridge clause in the cast was
     * not required.  However, XCode insisted on it.  I assume that this is a change
     * in the API.
     *
     * The change is due to Automatic Resource Counting.  The various bridging options
     * determine which application is responsible for releasing the memory.
     *
     *  https://developer.apple.com/library/content/releasenotes/ObjectiveC/RN-TransitioningToARC/Introduction/Introduction.html#//apple_ref/doc/uid/TP40011226-CH1-SW1
     */
    CFStringRef name = nil;
    if (noErr != MIDIObjectGetStringProperty(object, kMIDIPropertyName, &name)) {
        return nil;
    }
    return (__bridge NSString *)name;
    // return (NSString *) name;
}



