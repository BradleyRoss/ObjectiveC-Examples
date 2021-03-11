//
//  MIKMIDIsamples.m
//  BRossTools
//
//  Created by Bradley Ross on 3/7/21.
//
/**
 \file
 @brief MIKMIDI example files.
 MIKMIDI is an Objective-C library for MIDI
 */
#import <Foundation/Foundation.h>
#import "MIKMIDIsamples.h"
@implementation MIDIsampleMenu

+ (void)bleep:(id)sender {

    NSString *message = [sender getIdent];
        if (message == nil){
            NSLog(@"No identifier provided");
        }else {
            NSLog(@"bleep method entered: message is %@", message);
            if ([message isEqualToString:@"b1"]) {
                [playMIDI runtest];
                return;
            }
            if ([message isEqualToString:@"b2"]) {
                [playMIDI runtest];
                return;
            }
            if ([message isEqualToString:@"b3"]) {
                [playMIDI runtest];
                return;
            }
            if ([message isEqualToString:@"b4"]) {
                [test3 runtest];
                return;
            }
            if ([message isEqualToString:@"b5"]) {
                [CoreMidiSample1 runtest];
            }
            if ([message isEqualToString:@"b6"]) {
                [CoreMidiSample1 runtest2];
            }
            if ([message isEqualToString:@"b7"]) {
                [test5 runtest];
            }
            if ([message isEqualToString:@"b8"]) {
                [test4 runtest];
            }
            
        }
}
/**
   Builds view containing main menu.
 
     @returns pointer to NSStackView object.
 https://stackoverflow.com/questions/36020540/why-is-instancetype-used
 */
+ (NSView *)menu {
    // NSStackView *stackView = [NSStackView alloc]
    
    BRossToolsButton *b1 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"This is the midi1 sample which reads a MIDI file and plays it." ident:@"b1" ];
    /*
    BRossToolsButton *b2 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"run test1 new window plus fields" ident:@"b2" ];
    BRossToolsButton *b3 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"run test2 text handling window" ident:@"b3" ];

    BRossToolsButton *b4 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"run test3" ident:@"b4" ];
    
    BRossToolsButton *b5 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"run test4 - CoreMidiTest1" ident:@"b5" ];
    
    BRossToolsButton *b6 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"run test4b - CoreMidiDemo2" ident:@"b6" ];
    
    BRossToolsButton *b7 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"run test5 - CFDictionary, CFArray, etc." ident:@"b7" ];
    
    BRossToolsButton *b8 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"run test4 - Playing with pointers" ident:@"b8" ];
     */
    
    NSStackView *stackView = [NSStackView stackViewWithViews:@[b1]];
    //     NSStackView *stackView = [NSStackView stackViewWithViews:@[b1,  b2, b3, b4, b5, b6, b7, b8]];
    stackView.orientation = NSUserInterfaceLayoutOrientationVertical;
    return stackView;
}
@end
@implementation playMIDI
+ (void) runtest {
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    panel.canChooseFiles = YES;
    panel.canChooseDirectories = NO;
    panel.resolvesAliases = YES;
    panel.allowsMultipleSelection = NO;
    panel.accessoryViewDisclosed = NO;
    NSModalResponse response = [panel runModal];
    /*
     NSFileHandlingPanelOKButton deprecated
     use NSModalResponseOK
     
     NSFileHandlingPanelCancelButton deprecated
     use NSModalResponseCancel
     */
    NSURL *theDoc;
    NSError *error;
    if (response == NSModalResponseOK) {
        NSLog(@"OK button clicked");
        theDoc = [[panel URLs] objectAtIndex:0];
        NSLog(@"%@", theDoc);
        
        MIKMIDISequence *sequence = [MIKMIDISequence sequenceWithFileAtURL:theDoc error:&error];
        NSLog(@"Error code is %lu", (long) error.code);
        MIKMIDISequencer *sequencer = [MIKMIDISequencer sequencerWithSequence:sequence];
        [sequencer startPlayback];
         
    } else if (response == NSModalResponseCancel) {
        NSLog(@"Cancel button clicked");
    } else {
        NSLog(@"unrecognized click");
    }
   
    /**
        This is the code contained in the MIKMIDI main GitHub page for swift
     
     let sequence = try! MIKMIDISequence(fileAt: midiFileURL)
     let sequencer = MIKMIDISequencer(sequence: sequence)
     sequencer.startPlayback()
     
     MIKMIDISequence *sequence = [MIKMIDISequence sequenceWithFileAtURL:midiFileURL error:&error];
     MIKMIDISequencer *sequencer = [MIKMIDISequencer sequencerWithSequence:sequence];
     [sequencer startPlayback];
     */
 //   MIKMIDISequence *sequence = [MIKMIDISequence sequenceWithFileAtURL: error:&error];
//    NSWindow* window = [[[self windowControllers] objectAtIndex:0] window];
}


@end
