//
//  BRossToolsSynthesizer.h
//  BRossTools
//
//  Created by Bradley Ross on 5/23/21.
//

#ifndef BRossToolsSynthesizer_h
#define BRossToolsSynthesizer_h
#include <AppKit/AppKit.h>
#include <Foundation/Foundation.h>
#include "BRossToolsMIDI.h"
#include "BRossTools.h"
#include "LocalClasses.h"
@interface SequencerDemos:NSObject
- (void) debugTest;
// @todo remove file
/**

 @brief Uses NSOpenPanel to asynchronously select inputMidiFile.
 
 @todo NSOpenPanel does not have default title for panel.   NSSavePanel does have title.
<ul>
 <li><a href="https://developer.apple.com/documentation/appkit/nssavepanel/1525357-runmodal?language=objc"
 target="_blank">NSSavePanel runModal</a> This page mentions NSFileHandlingPanelOKButton and
 NSFileHandlingPanelCancelButton, which are apparently both deprecated.</li>
 <li><a href="https://developer.apple.com/documentation/appkit/nssavepanel?language=objc"
    target="_blank">NSSavePanel</a></li>
 <li><a href="https://developer.apple.com/library/archive/documentation/FileManagement/Conceptual/FileSystemProgrammingGuide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40010672-CH1-SW1/" target="_blank">File System Programming Guide</a>.</li>
 </ul>
 */
- (void) selectInputMidiFile;
/**
 @brief Select a MIDI file for output.
 */
- (void) selectOutputMidiFile;
/**
 @brief Select a MIDI file asynchronously for input.
 */
- (void) selectInputMidiFileAsync;
/**
@brief select a MIDI file asynchronously for output.
 */
- (void) selectOutputMidiFileAsync;
- (void) selectInputMidiDevice;
- (void) selectOutputMidiDevice;
@end
#endif /* BRossToolsSynthesizer_h */

