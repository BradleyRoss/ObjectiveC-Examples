//
//  BRossToolsSynthesizer.m
//  BRossTools
//
//  Created by Bradley Ross on 5/23/21.
//

#import <Foundation/Foundation.h>
#import "BRossToolsSynthesizer.h"

@implementation SequencerDemos {
    MIDIDeviceRef inputMidiDevice;
    MIDIDeviceRef outputMidiDevice;
    NSURL *outputMidiFile;
    NSURL *inputMidiFile;
}
- (void) debugTest {
    [self selectInputMidiFile];
    [self selectOutputMidiFile]
    ;
}
/**
 @brief Uses NSOpenPanel to select inputMidiFile.
<ul>
 <li><a href="https://developer.apple.com/documentation/appkit/nssavepanel/1525357-runmodal?language=objc"
 target="_blank">NSSavePanel runModal</a> This page mentions NSFileHandlingPanelOKButton and
 NSFileHandlingPanelCancelButton, which are apparently both deprecated.</li>
 <li><a href="https://developer.apple.com/documentation/appkit/nssavepanel?language=objc"
    target="_blank">NSSavePanel</a></li>
 <li><a href="https://developer.apple.com/library/archive/documentation/FileManagement/Conceptual/FileSystemProgrammingGuide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40010672-CH1-SW1/" target="_blank">File System Programming Guide</a>.</li>
 </ul>
 @todo Should it be runModal or startithCompletionHandler?
 */

- (void) selectInputMidiFileAsync {
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    [openPanel beginWithCompletionHandler:^(NSInteger result) {
        if (result == NSModalResponseOK) {self->inputMidiFile = openPanel.URL;
            NSLog(@"file name is %@", [self->inputMidiFile absoluteString]);
        } else if (result == NSModalResponseAbort) {
            NSLog(@"selectInputMidiFile NSOpenPanel has been aborted");
        } else if (result == NSModalResponseCancel) {
            NSLog(@"selectInputMidiFile NSOpenPanel has been cancelled");
        } else {
            NSLog(@"selectInputMidiFile NSOpenPanel ended with unknown condition");
        };
    }];
    NSLog(@"Block that will obtain input file name has been launched");
    NSLog(@"At this point, input file has not been selected and value is %@", inputMidiFile);
}
/**
 Uses NSSavePanel to select outputMidiFile.
 */
- (void) selectOutputMidiFileAsync {
    NSSavePanel *savePanel = [NSSavePanel savePanel];
    [savePanel beginWithCompletionHandler:^(NSInteger result) {
        if (result == NSModalResponseOK) {self->outputMidiFile = savePanel.URL;
            NSLog(@"file name is %@", [self->outputMidiFile absoluteString]);
        } else if (result == NSModalResponseAbort) {
            NSLog(@"selectOutputMidiFile NSSavePanel has been aborted");
        } else if (result == NSModalResponseCancel) {
            NSLog(@"selectOutputMidiFile NSSavePanel has been cancelled");
        } else {
            NSLog(@"selectOutputMidiFile NSSavePanel ended with unknown condition");
        };
    }];
    NSLog(@"Block that will obtain file name has been launched");
    NSLog(@"At this point, output file has not been selected and value is %@", outputMidiFile);
}
- (void) selectInputMidiFile {
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    NSModalResponse result;
    result = [openPanel runModal];
    if (result == NSModalResponseOK) {
        inputMidiFile = openPanel.URL;
        NSLog(@"file name is %@", [inputMidiFile absoluteString]);
    } else if (result == NSModalResponseAbort) {
        NSLog(@"selectInputMidiFile NSOpenPanel has been aborted");
    } else if (result == NSModalResponseCancel) {
        NSLog(@"selectInputMidiFile NSOpenPanel has been cancelled");
    } else {
        NSLog(@"selectInputMidiFile NSOpenPanel ended with unknown condition");
    };
 
}
- (void) selectOutputMidiFile {
    NSSavePanel *savePanel = [NSSavePanel savePanel];
    NSModalResponse result;
    result = [savePanel runModal];
    if (result == NSModalResponseOK) {
        outputMidiFile = savePanel.URL;
        NSLog(@"file name is %@", [outputMidiFile absoluteString]);
    } else if (result == NSModalResponseAbort) {
        NSLog(@"selectOutputMidiFile NSSavePanel has been aborted");
    } else if (result == NSModalResponseCancel) {
        NSLog(@"selectOutputMidiFile NSSavePanel has been cancelled");
    } else {
        NSLog(@"selectOutputMidiFile NSSavePanel ended with unknown condition");
    };
}
- (void) selectInputMidiDevice {
    
}
- (void) selectOutputMidiDevice {
    
}
@end
