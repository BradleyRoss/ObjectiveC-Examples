//
//  restart.m
//  Experiments2
//
//  Created by Bradley Ross on 8/25/22.
//
/**
  *  \file restart.m
  */
#import <Foundation/Foundation.h>
#import "restart.h"

@implementation endpoints:NSObject
- (instancetype) init {
    source = nil;
    destination = nil;
    return self;
}
- (OSStatus) selectSource:(MIDIObjectRef *)objectRef {
    int option = 0;
    int itemCount;
    UInt8 numSources = MIDIGetNumberOfSources();
    printf("Number of sources = %d \n", numSources);
    CFStringRef name = nil;
    // https://stackoverflow.com/questions/9166291/converting-a-cfstringref-to-char
    /*
    * I can convert CFStringRef to NSString by using NSString with the methods
    * alloc and initWithFormat
    *
    * NSString can be converted to a C string by using the NSString instance method
    *    cStringUsingEncoding with the parameter NSUTF8StringEncoding
    */
    if (numSources > 0) {
    for (UInt i1 = 0; i1 < numSources; i1++) {
            MIDIObjectRef endPoint = MIDIGetSource(i1);
            if (noErr != MIDIObjectGetStringProperty(endPoint, kMIDIPropertyDisplayName, &name)) {
                printf("%d  Unable to read name", i1) ;
            } else {
                NSString *temp = [[NSString alloc] initWithFormat:@"%@", name];
                printf("%d       %s\n",  i1, [temp cStringUsingEncoding:NSUTF8StringEncoding]);
            }
        }
    } else {
        printf("**** There are no sources\n");
        source = nil;
        objectRef=nil;
        return kMIDIUnknownEndpoint;
    }
    printf("Select number of source to be used, then use return/enter key \n");
    itemCount = scanf( "%u", &option);
    if (itemCount == 0) {
        printf ("Nothing was selected\n");
        objectRef=nil;
        return kMIDIUnknownEndpoint;
    }
    *objectRef = (MIDIObjectRef) MIDIGetSource(option);
    if (noErr != MIDIObjectGetStringProperty(*objectRef, kMIDIPropertyDisplayName, &name)) {
        printf("  Unable to read name") ;
    } else {
        NSString *temp = [[NSString alloc] initWithFormat:@"%@", name];
        printf("Selected      %s\n", [temp cStringUsingEncoding:NSUTF8StringEncoding]);
    }
    return noErr;
}
- (OSStatus) selectDestination:(MIDIObjectRef *)objectRef {
    int itemCount;
    int option;
    CFStringRef name = nil;
    UInt8 numDest = MIDIGetNumberOfDestinations();
    printf("Number of destinations = %d  \n", numDest);
    if (numDest > 0) {
        for (UInt i2 = 0; i2 < numDest; i2++) {
            MIDIObjectRef endPoint = MIDIGetDestination(i2);
            if (noErr != MIDIObjectGetStringProperty(endPoint, kMIDIPropertyDisplayName, &name)) {
                    printf("%d  Unable to read string", i2) ;
            } else {
                NSString *temp = [[NSString alloc] initWithFormat:@"%@", name];
                printf("%d       %s\n",  i2, [temp cStringUsingEncoding:NSUTF8StringEncoding]);
                    }
            }
        } else {
            printf ("**** There are no destinations\n");
            destination = nil;
            objectRef=nil;
            return kMIDIUnknownEndpoint;
        }
    
    printf("Select number of source to be used, then use return/enter key ");
    itemCount = scanf( "   then use return/enter key:  %u", &option);
    if (itemCount == 0) {
        printf ("Nothing was selected\n");
        objectRef=nil;
        return kMIDIUnknownEndpoint;
    }
    *objectRef = (MIDIObjectRef) MIDIGetDestination(option);
    destination = objectRef;
    if (noErr != MIDIObjectGetStringProperty(*objectRef, kMIDIPropertyDisplayName, &name)) {
        printf("  Unable to read name") ;
    } else {
        NSString *temp = [[NSString alloc] initWithFormat:@"%@", name];
        printf("Selected      %s\n", [temp cStringUsingEncoding:NSUTF8StringEncoding]);
    }
    return noErr;
}
- (MIDIEndpointRef *) getSource {
    return source;
}
- (MIDIEndpointRef *) getDestination {
    return destination;
}
@end

