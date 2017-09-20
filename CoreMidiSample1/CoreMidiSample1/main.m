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
void objectDictionary(MIDIObjectRef object);
void listDictionaryLevel(int level, CFTypeRef dictionary);
OSStatus status;
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
            status = MIDIObjectGetIntegerProperty(device, kMIDIPropertyOffline, &isOffline);
            if (status != 0) {
                NSLog(@"Error %d: kMIDIPropertyOffline", status);
            }
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
/**
 *  Display elapsed wall clock time.
 */
void elapsed() {
    struct timespec current;
    clock_gettime(CLOCK_MONOTONIC, &current);
    double elapsed;
    elapsed = (current.tv_sec - wallStart.tv_sec);
    elapsed += (current.tv_nsec - wallStart.tv_nsec)/1000000000.0;
    NSLog(@"Elapsed Wall Time: %f seconds", elapsed);
}
/**
 *    Returns a string value based on the error code.
 *    @param text string value to be returned
 *    @param code error code returned from method
 *    <p>The CF_ENUM OSStatus in CoreMIDI/MIDIServices.h lists the error codes for the Core MIDI methods.
 *       The names of the enumeration values are listed at
 *       <a href="https://developer.apple.com/documentation/coremidi/1495156-error_constants?language=objc" target="_blank">
 *       Documentation -> Core MIDI -> MIDI Services -> Error Constants</a>.  It is my assumpton the CF_ENUM enumeration
 *       declarations in different header files are combined into a single enumerations.</p>
 */
void logger(NSString* text, SInt32 code) {
    NSString * comment;
    if (code != 0) {
        if (code == -10830) {
            comment = @"kMIDIInvalidClient";
        } else if (code == -10831) {
            comment = @"kMIDIInvalidPort";
        } else if (code == -10832) {
            comment = @"kMIDIWrongEndpointType";
        } else if (code == -10833) {
            comment = @"kMIDINoConnection";
        } else if (code == -10834) {
            comment = @"kMIDIUnknownEndpoint";
        } else if (code == -10835) {
            comment = @"kMIDIUnknownPropertyType";
        } else if (code == -10836) {
            comment = @"kMIDIWrongPropertyType";
        } else {
            comment = @" ? ";
        }
        NSLog(@"Error %d: %@ %@", code, text, comment);
    }
}
/**
 *    Display information on MIDI devices.
 *
 *    <p>The constants indicating the desired properties are listed in MidiServices.h.</p>
 */
void deviceData(MIDIDeviceRef device) {
    NSLog(@"*****");
    OSStatus status = 0;
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
    status = MIDIObjectGetStringProperty(device, kMIDIPropertyName, &deviceName);
    logger(@"device,kMIDIPropertyName", status);
    status = 0;
    NSLog(@"Device: %@", deviceName);
    NSLog(@"     Device Properties:");
    status = MIDIObjectGetStringProperty(device, kMIDIPropertyDisplayName, &deviceDisplayName);
    if (status == 0) {
        NSLog(@"     Device Display Name: %@", deviceDisplayName);
    } else if (status == -10835) {
        NSLog(@"     Device Display Name: property not supported");
    } else {
        logger(@"device,kMIDIPropertyDisplayName", status);
    }
    status = MIDIObjectGetIntegerProperty(device, kMIDIPropertyReceivesNotes, &deviceReceivesNotes);
    if (status == 0) {
        NSLog(@"     Receives Notes: %d", deviceReceivesNotes);
    } else if (status == -10835) {
        NSLog(@"     Receives Notes: property not supported");
    } else {
        logger(@"device,kMIDIPropertyReceivesNotes", status);
    }
    status = MIDIObjectGetIntegerProperty(device, kMIDIPropertyTransmitsNotes, &deviceTransmitsNotes);
    if (status == 0) {
        NSLog(@"     Transmits Notes: %d", deviceTransmitsNotes);
    } else if (status == -10835) {
        NSLog(@"     Transmits Notes: property not supported");
    } else {
        logger(@"device,kMIDIPropertyTransmitsNotes", status);
    }
    status = MIDIObjectGetIntegerProperty(device,kMIDIPropertyUniqueID, &uniqueID);
    logger(@"device,kMIDIPropertyUniqueID", status);
    NSLog(@"     Unique ID:  %08x", uniqueID);
    SInt32 isOffline = 0;
    MIDIObjectGetIntegerProperty(device, kMIDIPropertyOffline, &isOffline);
    NSLog(@"     isOffline: %d", isOffline);
    status = MIDIObjectGetIntegerProperty(device, kMIDIPropertyDeviceID, &deviceID);
    if (status == 0) {
        NSLog(@"     Device ID: %d", deviceID);
    } else if (status == -10835) {
        NSLog(@"     Device ID: property not supported");
    } else {
        logger(@"device,kMIDIPropertyDeviceID", status);
    }
    status = MIDIObjectGetIntegerProperty(device, kMIDIPropertyDriverVersion, &version);
    if (status == 0) {
            NSLog(@"     Version: %d", version);
    } else if (status == -10835) {
            NSLog(@"     Version: property not supported");
    } else {
        logger(@"device,kMIDIPropertyDriverVersion", status);
    }
    status = MIDIObjectGetStringProperty(device, kMIDIPropertyManufacturer, &deviceManufacturer);
    NSLog(@"     Manufacturer: %@", deviceManufacturer);
    logger(@"device,kMIDIPropertyManufacturer", status);
    status = MIDIObjectGetStringProperty(device, kMIDIPropertyModel, &deviceModel);
    if (status == 0) {
        NSLog(@"     Model: %@", deviceModel);
    } else if (status == -10835) {
        NSLog(@"     Model: property not supported");
    } else {
        logger(@"device,kMIDIPropertyModel", status);
    }
    status = MIDIObjectGetIntegerProperty(device, kMIDIPropertySupportsGeneralMIDI, &supportsGeneralMIDI);
    if (status == 0) {
        NSLog(@"     Supports General MIDI: %d", supportsGeneralMIDI);
    } else if (status == -10835) {
        NSLog(@"     Supports General MIDI: property not supported");
    } else {
        logger(@"device,kMIDIPropertySupportsGeneralMIDI", status);
    }
    objectDictionary(device);
}
/**
 *    Display information on MIDI entities.
 *    @param device object for MIDI device
 *    @param entity object for MIDI entity
 */
void entityData(MIDIDeviceRef device, MIDIEntityRef entity) {
    NSLog(@"*****");
    OSStatus status = 0;
    CFStringRef deviceName = NULL;
    CFStringRef entityDisplayName = NULL;
    CFStringRef entityName = NULL;
    SInt32 entityReceivesNotes = 0;
    SInt32 entityTransmitsNotes = 0;
    MIDIObjectGetStringProperty(device, kMIDIPropertyName, &deviceName);
    NSLog(@"Device: %@", deviceName);
    MIDIObjectGetStringProperty(entity, kMIDIPropertyName, &entityName);
    NSLog(@"Entity: %@", entityName);
    status = MIDIObjectGetStringProperty(entity, kMIDIPropertyDisplayName, &entityDisplayName);
    if (status == 0) {
        NSLog(@"               Entity Display Name: %@", entityDisplayName);
    } else if (status == -10835) {
        NSLog(@"               Entity Display Name: property not supported");
    } else {
        logger(@"entity,kMIDIPropertyDisplayName", status);
    }
    status = MIDIObjectGetIntegerProperty(entity, kMIDIPropertyReceivesNotes, &entityReceivesNotes);
    if (status == 0) {
        NSLog(@"               Receives Notes: %d", entityReceivesNotes);
    } else if (status == -10835) {
        NSLog(@"               Receives Notes: property not supported");
    } else {
        logger(@"endpoint,kMIDIPropertyReceivesNotes", status);
    }
    status = MIDIObjectGetIntegerProperty(entity, kMIDIPropertyTransmitsNotes, &entityTransmitsNotes);
    if (status == 0) {
        NSLog(@"               Transmits Notes: %d", entityTransmitsNotes);
    } else if (status == -10835) {
        NSLog(@"               Transmits Notes: property not supported");
    } else {
        logger(@"entity,kMIDIPropertyTransmitsNotes", status);
    }
        objectDictionary(entity);
}
/**
 *    List property information for a MIDI object.
 *
 *    @param object MIDI object
 */
void objectDictionary(MIDIObjectRef object) {
    // https://crowd.cs.umass.edu/citizen/proxy/CFPropertyList/docs/plist/CFPropertyList.html
    CFPropertyListRef propertyList = NULL;
    OSStatus status = 0;
    status = MIDIObjectGetProperties(object, &propertyList, TRUE);
    if (status != 0) {
        logger(@"object MIDIObjectGetProperties", status);
    }
    listDictionaryLevel(0, propertyList);
}
/**
 *   Displays the property list associated with a MIDIObject (Older Version).
 *
 *   @param object MIDIObject whose property list is to be displayed.
 */
void objectDictionary2(MIDIObjectRef object) {
    // https://crowd.cs.umass.edu/citizen/proxy/CFPropertyList/docs/plist/CFPropertyList.html
    CFPropertyListRef propertyList = NULL;
    OSStatus status = 0;
    status = MIDIObjectGetProperties(object, &propertyList, TRUE);
    if (status != 0) {
        logger(@"object MIDIObjectGetProperties", status);
    }
    listDictionaryLevel(0, propertyList);
    // CFStringRef * comment = NULL;
    CFTypeID  typeCode = CFGetTypeID(propertyList);
    NSLog(@"Type of property list: %@", CFCopyTypeIDDescription(typeCode));
    // CFComparisonResult result;
    // https://developer.apple.com/documentation/corefoundation/1516741-cfdictionarygetcount?language=objc
    if (CFStringCompare(CFCopyTypeIDDescription(typeCode), CFSTR("CFDictionary"), 0) == kCFCompareEqualTo) {
    CFIndex count = CFDictionaryGetCount(propertyList);
        NSLog(@"There are %ld entries", count);
        CFStringRef keys[count];
        CFTypeRef values[count];
        CFDictionaryGetKeysAndValues(propertyList, (const void *) &keys, (const void *) &values);
        int i;
        for (i=0; i < count; i++) {
            NSLog(@"     %@  %@", keys[i], CFCopyTypeIDDescription(CFGetTypeID(values[i])));
        }
    }
}
/**
 *   Display contents of a CFArray or CFDictionry object.
 *
 *   @param level This is the depth within the tree structure.  The value for the
 *                initial call should be zero.
 *   @param dictionary The CFArray or CFDictionary object to be listed
 *
 *   <p>The method is called recursively to process the entire tree structure.</p>
 *
 *   https://developer.apple.com/documentation/corefoundation/cfarray?language=objc
 *   https://developer.apple.com/documentation/corefoundation/cfdictionary?language=objc
 */
    void listDictionaryLevel(int level, CFTypeRef dictionary) {
        CFTypeID dictionaryType = CFDictionaryGetTypeID();
        CFTypeID arrayType = CFArrayGetTypeID();
        CFTypeID stringType = CFStringGetTypeID();
        CFTypeID numberType = CFNumberGetTypeID();
        int currentLevel = level;
        CFTypeID typeID = CFGetTypeID(dictionary);
        if (typeID == dictionaryType) {
            CFIndex count = CFDictionaryGetCount(dictionary);
            CFStringRef keys[count];
            CFTypeRef values[count];
            CFDictionaryGetKeysAndValues(dictionary, (const void *) &keys, (const void *) &values);
            int position = 0;
            for (position = 0; position < count; position++) {
                CFTypeRef element = values[position];
                CFTypeID elementTypeID = CFGetTypeID(element);
                if (elementTypeID == numberType) {
                    CFNumberRef element = (CFNumberRef) values[position];
                    SInt32 numericValue;
                    CFNumberGetValue(element,kCFNumberSInt32Type, &numericValue);
                    // NSLog (@"%d", result);
                    NSLog(@"%3d %3d number %@  %d", level, position, keys[position], numericValue);
                } else if (elementTypeID == stringType) {
                    NSLog(@"%3d %3d string %@  %@", level, position, keys[position], (CFStringRef) values[position]);
                } else if (elementTypeID == dictionaryType) {
                    NSLog(@"%3d %3d dictionary %@", level, position, keys[position]);
                    listDictionaryLevel(currentLevel+1,  values[position]);
                } else if (elementTypeID == arrayType) {
                    NSLog(@"%3d %3d array %@", level, position, keys[position]);
                    listDictionaryLevel(currentLevel+1,  values[position]);
                }
            }
        } else if (typeID == arrayType) {
            CFIndex count = CFArrayGetCount(dictionary);
            int position;
            for (position = 0; position < count; position++) {
                CFTypeRef element = CFArrayGetValueAtIndex(dictionary, position);
                CFTypeID elementTypeID = CFGetTypeID(element);
                if (elementTypeID == numberType) {
                    SInt32 numericValue;
                    CFNumberGetValue(element,kCFNumberSInt32Type, &numericValue);
                    NSLog(@"%3d %3d number   %d", level, position, numericValue);
                } else if (elementTypeID == stringType) {
                    NSLog(@"%3d %3d string %@  ", level, position, (CFStringRef) element);
                } else if (elementTypeID == dictionaryType) {
                    NSLog(@"%3d %3d dictionary ", level, position);
                    listDictionaryLevel(currentLevel+1,  element);
                } else if (elementTypeID == arrayType) {
                    NSLog(@"%3d %3d array ", level, position);
                    listDictionaryLevel(currentLevel+1,  element);
                }
            }
        } else {
            NSLog(@"%@ not valid for parameter of listDictionaryLevel",CFCopyTypeIDDescription(typeID));
        }
    }
/**
 *  Display information on a MIDI endpoint.
 *  
 *  @param device MIDI device object
 *  @param entity MIDI entity object
 *  @param endpoint MIDI endpoint object
 */
void endpointData(MIDIDeviceRef device, MIDIEntityRef entity, MIDIEndpointRef endpoint) {
    OSStatus status = 0;
    CFStringRef deviceName = NULL;
    CFStringRef entityName = NULL;
    CFStringRef endpointName = NULL;
    CFStringRef endpointDisplayName = NULL;
    SInt32 endpointReceivesNotes = 0;
    SInt32 endpointTransmitsNotes = 0;
    NSLog(@"     *****");
    status = MIDIObjectGetStringProperty(device, kMIDIPropertyName, &deviceName);
        logger(@"device,kMIDIPropertyName", status);
    status = MIDIObjectGetStringProperty(entity, kMIDIPropertyName, &entityName);
    logger(@"entity,kMIDIPropertyName", status);
    status = MIDIObjectGetStringProperty(endpoint, kMIDIPropertyName, &endpointName);
        logger(@"endpoint,kMIDIPropertyName", status);
    NSLog(@"          Device: %@", deviceName);
    NSLog(@"          Entity: %@", entityName);
    NSLog(@"          Endpoint: %@", endpointName);
    status = MIDIObjectGetStringProperty(endpoint, kMIDIPropertyDisplayName, &endpointDisplayName);
    if (status == 0) {
         NSLog(@"               Endpoint Display Name: %@", endpointDisplayName);
    } else if (status == -10835) {
        NSLog(@"                Endpoint Display Name: property not supported");
    } else {
        logger(@"endpoint,kMIDIPropertyDisplayName", status);
    }
    status = MIDIObjectGetIntegerProperty(endpoint, kMIDIPropertyReceivesNotes, &endpointReceivesNotes);
    if (status == 0) {
        NSLog(@"               Receives Notes: %d", endpointReceivesNotes);
    } else if (status == -10835) {
        NSLog(@"               Receives Notes: property not supported");
    } else {
    logger(@"endpoint,kMIDIPropertyReceivesNotes", status);
    }
    status = MIDIObjectGetIntegerProperty(endpoint, kMIDIPropertyTransmitsNotes, &endpointTransmitsNotes);
    if (status == 0) {
        NSLog(@"               Transmits Notes: %d", endpointTransmitsNotes);
    } else if (status == -10835) {
        NSLog(@"               Transmits Notes: property not supported");
    } else {
        logger(@"endpoint,kMIDIPropertyTransmitsNotes", status);
    }
    objectDictionary(endpoint);
}
