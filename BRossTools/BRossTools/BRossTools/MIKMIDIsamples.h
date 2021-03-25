//
//  MIKMIDIsamples.h
//  BRossTools
//
//  Created by Bradley Ross on 3/7/21.
//

#ifndef MIKMIDIsamples_h
#define MIKMIDIsamples_h
/**
 \file MIKMIDIsamples.h
 @brief MIKMIDI is an Objective-C library and this file describes a set of tests and samples.
 */
#import "BRossTools.h"
#import "LocalClasses.h"
#import <MIKMIDI/MIKMIDI.h>
@interface MIDIsampleMenu:NSView
/**
 
 @create main menu for MIKMIDI samples.
 
 - [GitHub for MIKMIDI](https://github.com/mixedinkey-opensource/MIKMIDI)
 */

@end
//
//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****
//  *****  *****  *****  *****
//
/**
 @brief Sample code for playing MIDI file using MIKMIDI.
 
 This sample will allow the user to specify a MIDI file, open it and then play it.  This sample uses the MIKMIDI framework.
 
 - NSOpenPanel /NSSavePanel[ Ùsing the Open and Save Panels ](https://developer.apple.com/library/archive/documentation/FileManagement/Conceptual/FileSystemProgrammingGuide/UsingtheOpenandSavePanels/UsingtheOpenandSavePanels.html)
 
 
 */
@interface playMIDI:NSObject
+ (void)runtest;

@end

#endif /* MIKMIDIsamples_h */
