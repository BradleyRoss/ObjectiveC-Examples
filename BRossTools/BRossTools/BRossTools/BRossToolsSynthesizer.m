//
//  BRossToolsSynthesizer.m
//  BRossTools
//
//  Created by Bradley Ross on 5/23/21.
//

#import <Foundation/Foundation.h>
#import "BRossToolsSynthesizer.h"
// @todo remove file
@implementation SequencerDemos {
    MIDIDeviceRef inputMidiDevice;
    MIDIDeviceRef outputMidiDevice;
    Boolean useVirtualSynthesizer;
    NSURL *outputMidiFile;
    NSURL *inputMidiFile;
}
- (void) debugTest {
    [self selectInputMidiFile];
    [self selectOutputMidiFile];
    // [self selectInputMidiFileAsync];
    // [self selectOutputMidiFileAsync];
}
/**
 @brief Uses NSOpenPanel to select inputMidiFile.
 
 NSOpenPanel does not have title.  NSSavePanel does have title.
 
<ul>
 <li><a href="https://developer.apple.com/documentation/appkit/nssavepanel/1525357-runmodal?language=objc"
 target="_blank">NSSavePanel runModal</a> This page mentions NSFileHandlingPanelOKButton and
 NSFileHandlingPanelCancelButton, which are apparently both deprecated.</li>
 <li><a href="https://developer.apple.com/documentation/appkit/nssavepanel?language=objc"
    target="_blank">NSSavePanel</a></li>
 <li><a href="https://developer.apple.com/library/archive/documentation/FileManagement/Conceptual/FileSystemProgrammingGuide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40010672-CH1-SW1/" target="_blank">File System Programming Guide</a>.</li>
 </ul>
 @todo Should it be runModal or startWithCompletionHandler?
 */

- (void) selectInputMidiFileAsync {
    NSLog(@"Starting selectInputMidiFileAsync");
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    [openPanel setMessage:@"Select input file asynchronously"];
    [openPanel beginWithCompletionHandler:^(NSInteger result) {
        if (result == NSModalResponseOK) {self->inputMidiFile = openPanel.URL;
            NSLog(@"file name is %@", [self->inputMidiFile absoluteString]);
        } else if (result == NSModalResponseAbort) {
            NSLog(@"selectInputMidiFileAsync NSOpenPanel has been aborted");
        } else if (result == NSModalResponseCancel) {
            NSLog(@"selectInputMidiFileAsync NSOpenPanel has been cancelled");
        } else {
            NSLog(@"selectInputMidiFileAsync NSOpenPanel ended with unknown condition");
        };
    }];
    NSLog(@"Block that will obtain input file name has been launched");
    NSLog(@"At this point, input file has not been selected and value is %@", inputMidiFile);
}
/**
 Uses NSSavePanel to select outputMidiFile.
 */
- (void) selectOutputMidiFileAsync {
    NSLog(@"Starting selectOutputMidiFileAsync");
    NSSavePanel *savePanel = [NSSavePanel savePanel];
    [savePanel setMessage:@"Select output file asynchronously"];
    [savePanel beginWithCompletionHandler:^(NSInteger result) {
        if (result == NSModalResponseOK) {self->outputMidiFile = savePanel.URL;
            NSLog(@"Output file name is %@", [self->outputMidiFile absoluteString]);
        } else if (result == NSModalResponseAbort) {
            NSLog(@"selectOutputMidiFileAsync NSSavePanel has been aborted");
        } else if (result == NSModalResponseCancel) {
            NSLog(@"selectOutputMidiFileAsync NSSavePanel has been cancelled");
        } else {
            NSLog(@"selectOutputMidiFileAsync NSSavePanel ended with unknown condition");
        };
    }];
    NSLog(@"Block that will obtain file name has been launched");
    NSLog(@"At this point, output file has not been selected and value is %@", outputMidiFile);
}
- (void) selectInputMidiFile {
    NSLog(@"Starting selectInputMidiFile");
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    [openPanel setTitleVisibility:true];  // No effect
    [openPanel setTitle:@"Open File"];
    [openPanel setMessage:@"Select input file"];
    NSModalResponse result;
    result = [openPanel runModal];
    if (result == NSModalResponseOK) {
        inputMidiFile = openPanel.URL;
        NSLog(@"Input file name is %@", [inputMidiFile absoluteString]);
    } else if (result == NSModalResponseAbort) {
        NSLog(@"selectInputMidiFile NSOpenPanel has been aborted");
    } else if (result == NSModalResponseCancel) {
        NSLog(@"selectInputMidiFile NSOpenPanel has been cancelled");
    } else {
        NSLog(@"selectInputMidiFile NSOpenPanel ended with unknown condition");
    };
 
}
- (void) selectOutputMidiFile {
    NSLog(@"Starting selectOutputMidiFile");
    NSSavePanel *savePanel = [NSSavePanel savePanel];
    [savePanel setMessage:@"Select output file"];
    NSModalResponse result;
    result = [savePanel runModal];
    if (result == NSModalResponseOK) {
        outputMidiFile = savePanel.URL;
        NSLog(@"Output file name is %@", [outputMidiFile absoluteString]);
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
