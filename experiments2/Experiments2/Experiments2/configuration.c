//
//  configuration.c
//  Experiments2
//
//  Created by Bradley Ross on 9/8/22.
//

#include "configuration.h"
void showConfiguration() {
    Boolean result2;
    OSStatus result;
    CFStringRef deviceDisplayName = NULL;
    CFStringRef entityDisplayName = NULL;
    CFStringRef destinationDisplayName = NULL;
    CFStringRef sourceDisplayName = NULL;
    CFStringRef manufacturerDisplayName = NULL;
    char deviceName[100];
    deviceName[0] = '\0';
    char entityName[100];
    entityName[0] = '\0';
    char manufacturerName[100];
    manufacturerName[0]='\0';
    char destinationName[100];
    destinationName[0] = '\0';
    char sourceName[100];
    sourceName[0]='\0';
    ItemCount deviceCount = MIDIGetNumberOfDevices();
    if (deviceCount == 0) {
        printf("There are no devices\n");
    } else {  // start  block a
        printf("There are %lu devices\n", deviceCount);
        for (ItemCount i = 0; i<deviceCount; i++) {  // start block b
            MIDIDeviceRef device = MIDIGetDevice(i);
            result = MIDIObjectGetStringProperty(device,kMIDIPropertyName, &deviceDisplayName);
            result2 = CStringPtr(deviceDisplayName, deviceName, 90, kCFStringEncodingUTF8);
            result = MIDIObjectGetStringProperty(device,kMIDIPropertyManufacturer, &manufacturerDisplayName);
            result2 = CStringPtr(manufacturerDisplayName, manufacturerName, 90, kCFStringEncodingUTF8);
            /*
            printf(" %lu  Device Name: %s\n", i,
                   CFStringGetCStringPtr(deviceDisplayName, kCFStringEncodingUTF8 ) );
             */
            printf(" %lu  Device Manufacturer: %s Name: %s\n", i,manufacturerName, deviceName);
            deviceInfo(device);
            ItemCount entityCount = MIDIDeviceGetNumberOfEntities(device);
            if (entityCount == 0) {
                printf("     There are no entities\n");
            } else {
                printf("      Number of entities is %lu \n", entityCount);
                for (ItemCount j=0; j<entityCount; j++) {  //start block c
                    MIDIEntityRef entity = MIDIDeviceGetEntity(device, j);
                    result = MIDIObjectGetStringProperty(entity,kMIDIPropertyName, &entityDisplayName);
                    result2 = CStringPtr(entityDisplayName, entityName, 90, kCFStringEncodingUTF8);
                    result = MIDIObjectGetStringProperty(entity,kMIDIPropertyName, &entityDisplayName);
                    result2 = CStringPtr(entityDisplayName, entityName, 90, kCFStringEncodingUTF8);
                    /*
                    printf("      %lu  Device/Entity: %s --  %s\n", j,
                           CFStringGetCStringPtr(deviceDisplayName, kCFStringEncodingUTF8 ),
                           CFStringGetCStringPtr(entityDisplayName, kCFStringEncodingUTF8 ));
                     */
                    printf("           %lu  Device/Entity: %s --  %s\n", j, deviceName, entityName);
             
                    entityInfo(entity);
                    ItemCount destCount = MIDIEntityGetNumberOfDestinations(entity);
                    if (destCount == 0) {
                        printf("          There are no destinations\n");
                    } else {
                        printf("          Number of destinations is %lu \n", destCount);
                        for (ItemCount k = 0; k<destCount; k++) {
                            MIDIEndpointRef destination = MIDIEntityGetDestination(entity, k);
                            result = MIDIObjectGetStringProperty(destination,kMIDIPropertyName, &destinationDisplayName);
                            result2 = CStringPtr(destinationDisplayName, destinationName, 90, kCFStringEncodingUTF8);
                            
                            /*
                            printf("      %lu  Device/Entity: %s --  %s  --%s \n", j,
                                   CFStringGetCStringPtr(deviceDisplayName, kCFStringEncodingUTF8 ),
                                   CFStringGetCStringPtr(entityDisplayName, kCFStringEncodingUTF8 ),
                                   CFStringGetCStringPtr(destinationDisplayName, kCFStringEncodingUTF8 ));
                             */
                            printf("           %lu  Device/Entity/Endpoint: %s --  %s  -- %s \n", j, deviceName, entityName, destinationName);
                            destinationInfo(destination);
                        }
                    }
                    ItemCount sourceCount = MIDIEntityGetNumberOfSources(entity);
                    if (sourceCount == 0) {
                        printf("          There are no sources\n");
                    } else {
                        printf("          Number of sources is %lu \n", sourceCount);
                        for (ItemCount k = 0; k<sourceCount; k++) { // start loop 1
                            MIDIEndpointRef source = MIDIEntityGetSource(entity, k);
                            result = MIDIObjectGetStringProperty(source,kMIDIPropertyName, &sourceDisplayName);
                            result2 = CStringPtr(sourceDisplayName, sourceName, 90, kCFStringEncodingUTF8);
                            printf("           %lu  Device/Entity/Endpoint: %s --  %s -- %s\n", j, deviceName, entityName, sourceName);
                                  
                            /*
                             printf("      %lu  Device/Entity: %s --  %s -- %s\n", j,
                                    CFStringGetCStringPtr(deviceDisplayName, kCFStringEncodingUTF8 ),
                                    CFStringGetCStringPtr(entityDisplayName, kCFStringEncodingUTF8 ),
                                    CFStringGetCStringPtr(entityDisplayName, kCFStringEncodingUTF8 ));
                             */
                            
                            sourceInfo(source);
                        } // end loop 1
                    }
                        
                }
        }
    }
        
    }
    
} // end of function showConfiguration
void deviceInfo(MIDIDeviceRef device) {

    
        
}  // end of function deviceInfo

void entityInfo(MIDIEntityRef entity) {
    
}
void sourceInfo(MIDIEndpointRef source) {
    
}
void destinationInfo(MIDIEndpointRef destination) {
    
}
Boolean CStringPtr (CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding ) {
    Boolean result;
    result = CFStringGetCString(theString, buffer, bufferSize, encoding);
    return result;
}

