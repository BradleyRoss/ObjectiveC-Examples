//
//  main.m
//  CoreMidiSample1
//
//  Created by Bradley Ross on 9/13/17.
//  Copyright © 2017 Bradley Ross. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMIDI/CoreMIDI.h>
struct timespec wallStart;
void deviceData(MIDIDeviceRef);
void elapsed();
void entityData(MIDIDeviceRef device, MIDIEntityRef entity);
void endpointData(MIDIDeviceRef device, MIDIEntityRef entity, MIDIEndpointRef endpoint);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        clock_gettime(CLOCK_MONOTONIC, &wallStart);
        ItemCount deviceCount = MIDIGetNumberOfDevices();
        NSLog(@"Number of MIDI Devices: %lu", deviceCount);
        NSLog(@"-----");
        for (ItemCount i = 0 ; i < deviceCount ; ++i) {
            // Grab a reference to curent device
            MIDIDeviceRef device = MIDIGetDevice(i);
            // NSLog(@"Device: %@", getName(device));
            // Is this device online? (Currently connected?)
            SInt32 isOffline = 0;
            MIDIObjectGetIntegerProperty(device, kMIDIPropertyOffline, &isOffline);
            deviceData(device);
            
            // How many entities do we have?
            ItemCount entityCount = MIDIDeviceGetNumberOfEntities(device);
            
            // Iterate through this device's entities
            for (ItemCount j = 0 ; j < entityCount ; ++j) {
                // Grab a reference to an entity
                MIDIEntityRef entity = MIDIDeviceGetEntity(device, j);
                // NSLog(@"  Entity: %@", getName(entity));
                entityData(device, entity);
                
                // Iterate through this device's source endpoints (MIDI In)
                ItemCount sourceCount = MIDIEntityGetNumberOfSources(entity);
                NSLog(@"     *****");
                NSLog(@"     Sources");
                for (ItemCount k = 0 ; k < sourceCount ; ++k) {
                    // Grab a reference to a source endpoint
                    MIDIEndpointRef source = MIDIEntityGetSource(entity, k);
                    endpointData(device, entity, source);
                }
                // Iterate through this device's destination endpoints
                ItemCount destCount = MIDIEntityGetNumberOfDestinations(entity);
                NSLog(@"     *****");
                NSLog(@"     Destinations");
                for (ItemCount k = 0 ; k < destCount ; ++k) {
                    
                    // Grab a reference to a destination endpoint
                    MIDIEndpointRef dest = MIDIEntityGetDestination(entity, k);
                    endpointData(device, entity, dest);
                }
            }
            NSLog(@"------");

            }
        elapsed();
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
/**
 *    Display information on MIDI devices.
 *
 *
 *    <p>The constants indicating the desired properties are listed in MidiServices.h.</p>
 */
void deviceData(MIDIDeviceRef device) {
    CFStringRef deviceDisplayName = NULL;
    CFStringRef deviceName = NULL;
    CFStringRef deviceModel = NULL;
    CFStringRef deviceManufacturer = NULL;
    SInt32 deviceReceivesNotes = 0;
    SInt32 deviceTransmitsNotes = 0;
    SInt32 uniqueID = 0;
    SInt32 supportsGeneralMIDI = 0;
    SInt32 version = 0;
    SInt32 deviceID = 0;
    MIDIObjectGetStringProperty(device, kMIDIPropertyDisplayName, &deviceDisplayName);
    MIDIObjectGetStringProperty(device, kMIDIPropertyName, &deviceName);
    MIDIObjectGetIntegerProperty(device,kMIDIPropertyUniqueID, &uniqueID);
    MIDIObjectGetIntegerProperty(device, kMIDIPropertyDriverVersion, &version);
    MIDIObjectGetStringProperty(device, kMIDIPropertyManufacturer, &deviceManufacturer);
    MIDIObjectGetIntegerProperty(device, kMIDIPropertyDeviceID, &deviceID);
    MIDIObjectGetStringProperty(device, kMIDIPropertyModel, &deviceModel);
    MIDIObjectGetIntegerProperty(device, kMIDIPropertyTransmitsNotes, &deviceTransmitsNotes);
    MIDIObjectGetIntegerProperty(device, kMIDIPropertyReceivesNotes, &deviceReceivesNotes);
    MIDIObjectGetIntegerProperty(device, kMIDIPropertySupportsGeneralMIDI, &supportsGeneralMIDI);
    NSLog(@"*****");
    NSLog(@"Device: %@", deviceName);
    NSLog(@"     Device Properties:");
    NSLog(@"     Display Name: %@", deviceDisplayName);
    SInt32 isOffline = 0;
    MIDIObjectGetIntegerProperty(device, kMIDIPropertyOffline, &isOffline);
    NSLog(@"     isOffline: %d", isOffline);
    NSLog(@"     Unique ID:  %08x", uniqueID);
    NSLog(@"     Device ID: %d", deviceID);
    NSLog(@"     Version: %d", version);
    NSLog(@"     Manufacturer: %@", deviceManufacturer);
    NSLog(@"     Model: %@", deviceModel);
    NSLog(@"     Receives Notes: %d", deviceReceivesNotes);
    NSLog(@"     Transmits Notes: %d", deviceTransmitsNotes);
    NSLog(@"     Supports General MIDI: %d", supportsGeneralMIDI);
}
void entityData(MIDIDeviceRef device, MIDIEntityRef entity) {
    CFStringRef deviceName = NULL;
    CFStringRef entityDisplayName = NULL;
    CFStringRef entityName = NULL;
    MIDIObjectGetStringProperty(device, kMIDIPropertyName, &deviceName);
    MIDIObjectGetStringProperty(entity, kMIDIPropertyDisplayName, &entityDisplayName);
    MIDIObjectGetStringProperty(entity, kMIDIPropertyName, &entityName);
    NSLog(@"*****");
    NSLog(@"Device: %@", deviceName);
    NSLog(@"Entity: %@", entityName);
    NSLog(@"     Entity Display Name: %@", entityDisplayName);
    
}
void endpointData(MIDIDeviceRef device, MIDIEntityRef entity, MIDIEndpointRef endpoint) {
    CFStringRef deviceName = NULL;
    CFStringRef entityName = NULL;
    CFStringRef endpointName = NULL;
    CFStringRef endpointDisplayName = NULL;
    SInt32 endpointReceivesNotes = 0;
    SInt32 endpointTransmitsNotes = 0;
    MIDIObjectGetStringProperty(device, kMIDIPropertyName, &deviceName);
    MIDIObjectGetStringProperty(entity, kMIDIPropertyName, &entityName);
    MIDIObjectGetStringProperty(endpoint, kMIDIPropertyName, &endpointName);
    MIDIObjectGetStringProperty(endpoint, kMIDIPropertyDisplayName, &endpointDisplayName);
    MIDIObjectGetIntegerProperty(endpoint, kMIDIPropertyReceivesNotes, &endpointReceivesNotes);
    MIDIObjectGetIntegerProperty(endpoint, kMIDIPropertyTransmitsNotes, &endpointTransmitsNotes);
    NSLog(@"     *****");
    NSLog(@"          Device: %@", deviceName);
    NSLog(@"          Entity: %@", entityName);
    NSLog(@"          Endpoint: %@", endpointName);
    NSLog(@"               Endpoint Display Name: %@", endpointDisplayName);
    NSLog(@"               Receives Notes: %d", endpointReceivesNotes);
    NSLog(@"               Transmits Notes: %d", endpointTransmitsNotes);
}
