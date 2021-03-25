//
//  CoreMIDIsamples.m
//  BRossTools
//
//  Created by Bradley Ross on 3/18/21.
//

#import <Foundation/Foundation.h>
#import "CoreMIDIsamples.h"
/*
 The Doxygen documentation for CoreMIDI is located in
 /Users/bradleyross/Documents/DoxygenAppleDocs
 
 The Doxygen documentation for BRossTools is in
 /Users/bradleyross/Documents/GitHubObjectiveC-Examples/BRossTools/BRosTools/html
 */
@implementation TextWindow
+ (BRossToolsTextWindow *) getTextWindow {
    if (commonTextWindow == NULL) {
        commonTextWindow = [ BRossToolsTextWindow newWindow];
    }
    return commonTextWindow;
}
+ (BRossToolsTextWindow *) textWindow {
    return [TextWindow getTextWindow];
}
+ (void) setTextWindow: (BRossToolsTextWindow *) window {
    commonTextWindow = [TextWindow getTextWindow];
}
static BRossToolsTextWindow *commonTextWindow = NULL;
@end
/**
 It looks like MIDIEventList has replaced MIDIPacketList
 */
@implementation CoreMidi2
static void midiInputCallback (const MIDIPacketList *list, void *procRef, void *srcRef) {
    NSLog(@"midiInputCallback was called");
}

+ (void) runtest {
    MIDIClientRef midiClient;
    OSStatus result;
    NSString *buildMessage;
    CFStringRef description = NULL;
    [[TextWindow getTextWindow] appendString:@"Starting CoreMidi2"];
    /*
     GetMacOSStatusErrorString and GetMacOSStatusCommentString are both deprecated.
     */
    result = MIDIClientCreate(CFSTR("MIDI client"), NULL, NULL, &midiClient);
    if (result != noErr) {
        NSString *message = [NSString stringWithFormat:@"Error creating MIDI client: %s - %s", GetMacOSStatusErrorString(result), GetMacOSStatusCommentString(result) ];
        [[TextWindow getTextWindow] appendString:message];
              return;
    }
    MIDIPortRef inputPort;
    result = MIDIInputPortCreate(midiClient, CFSTR("Input"), midiInputCallback, NULL, &inputPort);
    if (result != noErr) {
        NSString *message = [NSString stringWithFormat:@"Error crreating MIDI client: %s - %s", GetMacOSStatusErrorString(result), GetMacOSStatusCommentString(result) ];
        [[TextWindow getTextWindow] appendString:message];
        return;
    }
    ItemCount numSources = MIDIGetNumberOfSources();
    if (numSources <= 0) {
        [[TextWindow getTextWindow] appendString:@"No sources available - aborting"];
        return;
    }
    MIDIEndpointRef source = MIDIGetSource(0);
    if (source == 0) {
        [[TextWindow getTextWindow] appendString:@"Invalid address for source - aborting"];
        return;
    }
    MIDIObjectGetStringProperty(source, kMIDIPropertyModel, &description);
    buildMessage = [[NSString alloc] initWithFormat:@"%@ found", description];
    [[TextWindow getTextWindow] appendString:buildMessage];
}
@end
