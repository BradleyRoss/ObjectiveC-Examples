//
//  BRossToolsMIDIPlayMIDIFile.m
//  BRossTools
//
//  Created by Bradley Ross on 6/5/21.
//

#import <Foundation/Foundation.h>
#import "BRossToolsMIDI.h"

@implementation PlayMIDIFile {
    /**
     MIDI file to be played.
     */
    NSURL *fileURL;
    /**
     soundbank to be used.
     */
    NSURL *soundBankURL;
    NSBundle *mainBundle;
    AVMIDIPlayer *midiPlayer;
    /**
     Switches from NO to YES when song is done playing.
     */
    BOOL done;
}


- (PlayMIDIFile *) init {

    mainBundle = [NSBundle mainBundle];
    done = NO;
    return self;
    
}
- (void) songFinished {
    done = YES;
}
- (BOOL) pickMIDIFileURL {

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
        
        if (response == NSModalResponseOK) {
            NSLog(@"OK button clicked");
            theDoc = [[panel URLs] objectAtIndex:0];
            NSLog(@"%@", theDoc);
            fileURL = theDoc;
            return YES;
        } else if (response == NSModalResponseCancel) {
            NSLog(@"Cancel button clicked");
            return NO;
        } else {
            NSLog(@"unrecognized click");
            return NO;
        }
  
    
}

- (BOOL) selectSoundBank:(UInt8) option {
    BOOL success;
    NSError *error;
    @try {
        if (option == 1) {
            soundBankURL = [mainBundle URLForResource:@"GeneralUser GS MuseScore v1.442" withExtension:@"sf2"];
            NSLog(@"Using GeneralUser GS MuseScore v1.442.sf2");
            
        } else if (option == 2) {
            soundBankURL = [mainBundle URLForResource:@"gs_instruments" withExtension:@"dls"];
            NSLog(@"Using gs_instruments.dls");
            
        } else {
            return NO;
        }
        success = [soundBankURL checkResourceIsReachableAndReturnError:&error];
        if (success) {
            NSLog(@"soundbank is reachable");
            return YES;
        } else {
            NSLog(@"soundbank is not reachable -- error code is %ld", [error code]);
        }
    }
     @catch (NSException *e) {
         NSLog(@"Exception raised while finding soundbank %@  %@  ", e.name, e.reason);
         return NO;
     }
}
- (BOOL) selectBuiltinFile:(UInt8) option {
    BOOL success;
    NSError *error;
    @try {
        if (option == 1) {
            fileURL = [mainBundle URLForResource:@"sibeliusGMajor" withExtension:@"mid"];
            NSLog(@"Sibelius G Major scale");
            
        } else if (option == 2) {
        fileURL = [mainBundle URLForResource:@"ntbldmtn" withExtension:@"mid"];
            NSLog(@"Night on Bald Mountain");
            
        } else {
            return NO;
        }
        success = [fileURL checkResourceIsReachableAndReturnError:&error];
        if (success) {
            NSLog(@"MIDI file is reachable");
            return YES;
        } else {
            NSLog(@"MIDI file is not reachable -- error code is %ld", [error code]);
        }
        
    }
     @catch (NSException *e) {
         NSLog(@"Exception raised while finding MIDI file %@  %@  ", e.name, e.reason);
         return NO;
     }
}
- (BOOL) setMIDIFileURL:(NSURL *) url {
    fileURL = url;
    return YES;
}

- (void) test1 {
    AVMIDIPlayerCompletionHandler completionHandler =
     ^{
         NSLog(@"AVMIDICompletionHandler run for AVMIDIPlayer");
         [self songFinished];
     };
    
    NSError *error;
    [self selectSoundBank:1];
    [self selectBuiltinFile:1];
    midiPlayer = [[AVMIDIPlayer alloc] initWithContentsOfURL:fileURL
        soundBankURL:soundBankURL error:&error];
    if (midiPlayer == nil) {
        NSLog(@"Unable to initialize AVMIDIPlayer  code:%ld", (long)[error code]);
        return;
    }
    NSLog(@"Preparing to play");
    [midiPlayer prepareToPlay];
    [midiPlayer play: completionHandler];
    /*  This is needed to keep thread alive */
    for (int i=0; i < 100; i++) {
        if (done) { return; }
        [NSThread sleepForTimeInterval:3.0];
    }
}


- (void) test2 {
    BOOL result;
    AVMIDIPlayerCompletionHandler completionHandler =
     ^{
         NSLog(@"AVMIDICompletionHandler run for AVMIDIPlayer");
         [self songFinished];
     };
    
    NSError *error;
    result = [self selectSoundBank:1];
    if (!result) {
        NSLog(@"Unable to load sound bank");
        return;
    }
    result = [self selectBuiltinFile:2];
    if (!result) {
        NSLog(@"Unable to load MIDI file");
    }
    midiPlayer = [[AVMIDIPlayer alloc] initWithContentsOfURL:fileURL
        soundBankURL:soundBankURL error:&error];
    if (midiPlayer == nil) {
        NSLog(@"Unable to initialize AVMIDIPlayer  code:%ld", (long)[error code]);
        return;
    }
    NSLog(@"Preparing to play");
    [midiPlayer prepareToPlay];
    [midiPlayer play:completionHandler];
    /*  This is needed to keep thread alive */
    for (int i=0; i < 100; i++) {
        if (done) { return; }
        [NSThread sleepForTimeInterval:3.0];
    }
}

- (void) pickMIDIFileAndPlay {
   
    BOOL result;
    AVMIDIPlayerCompletionHandler completionHandler =
     ^{
         NSLog(@"AVMIDICompletionHandler run for AVMIDIPlayer");
         [self songFinished];
     };
    
    NSError *error;
    result = [self selectSoundBank:1];
    if (!result) {
        NSLog(@"Unable to load sound bank");
        return;
    }
    result = [self pickMIDIFileURL];
    if (!result) {
        NSLog(@"Unable to load MIDI file");
        return;
    }
    midiPlayer = [[AVMIDIPlayer alloc] initWithContentsOfURL:fileURL
        soundBankURL:soundBankURL error:&error];
    if (midiPlayer == nil) {
        NSLog(@"Unable to initialize AVMIDIPlayer  code:%ld", (long)[error code]);
        return;
    }
    NSLog(@"Preparing to play");
    [midiPlayer prepareToPlay];
    NSLog(@"Start playing");
    [midiPlayer play:completionHandler];
    /*  This is needed to keep thread alive */
    for (int i=0; i < 100; i++) {
        if (done) { return; }
        [NSThread sleepForTimeInterval:3.0];
    }
}
@end
