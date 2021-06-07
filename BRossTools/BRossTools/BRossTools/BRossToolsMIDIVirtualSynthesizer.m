//
//  BRossToolsMIDIVirtualSynthesizer.m
//  BRossTools
//
//  Created by Bradley Ross on 6/5/21.
//

#import <Foundation/Foundation.h>
#import "BRossToolsMIDI.h"


@implementation VirtualSynthesizer {
    UInt8 defaultBankMSB;
    UInt8 defaultBankLSB;
    UInt8 gmMarimba;
    UInt8 gmHarpsichord;
    AVAudioEngine *audioEngine;
    AVAudioUnitSampler *synthesizer;
    AVAudioSequencer *sequencer;
    UInt8 gm_instrument;
    NSURL *soundbank;
    NSBundle *mainBundle;
}
    
- (instancetype) init {
    [self commonInit];
    gm_instrument = 1;
    [self setSoundBank:1];
    return self;
}
- (void) commonInit {
    defaultBankMSB = kAUSampler_DefaultMelodicBankMSB;
    defaultBankLSB = kAUSampler_DefaultBankLSB;
    gmMarimba = 12;
    gmHarpsichord = 6;
    audioEngine = [[AVAudioEngine alloc] init];
    synthesizer = [[AVAudioUnitSampler alloc] init];
    NSLog(@"Synthesizer and AudioEngine have been initialized");
    [audioEngine attachNode:synthesizer];
    NSLog(@"AudioEngine connected to synthesizer");
    NSLog(@"About to connect synthesizer to mixer");
    [audioEngine connect:synthesizer to:audioEngine.mainMixerNode format:nil];
    NSLog(@"Synthesizer connected to mixer");
    mainBundle = [NSBundle mainBundle];
}
- (BOOL) setSoundBank:(UInt8) option {
    BOOL success;
    NSError *error;
    if (option == 1) {
        @try {
            soundbank = [mainBundle
                URLForResource:@"GeneralUser GS MuseScore v1.442" withExtension:@"sf2"];
            NSLog(@"soundbank GeneralUser GS MuseScore v1.442 found");
        }
        @catch (NSException *e) {
            NSLog(@"Unable to find GeneralUser GS MuseScore v1.442");
            NSLog(@"Exception raised: %@  %@  ", e.name, e.reason);
            return NO;
          }
  } else if (option == 2) {
        @try {
            soundbank = [mainBundle URLForResource:@"gs_instruments" withExtension:@"dls"];
            NSLog(@" soundbank gs_instruments.dls found");
       } @catch (NSException *e) {
           NSLog(@"Unable to find gs_instruments.dls");
           NSLog(@"Exception raised: %@  %@  ", e.name, e.reason);
           return NO;
      }
    }
    success = [soundbank checkResourceIsReachableAndReturnError:&error];
    if (success) {
        NSLog(@"soundbank is reachable");
    } else {
        NSLog(@"soundbank is not reachable");
        return NO;
    }
    
    
}
- (BOOL) selectInstrument:(UInt8) option {
    gm_instrument = option;
    return YES;
}
- (BOOL) startEngine {
    if (audioEngine.running) {
        NSLog(@"Engine is already running");
        return YES;
    }
    NSError *outError;
    BOOL success;
    @try {
        NSLog(@"AudioEngine is not running - attempting to start");
        
        success = [audioEngine startAndReturnError:&outError];
        if (success) {
            NSLog(@"NSAudioEngine successfully started");
            return YES;
        } else {
            NSLog(@"Starting AudioEngine failed");
            NSAlert *theAlert = [NSAlert alertWithError:outError];
            [theAlert runModal];
            return NO;
        }
        // NSLog(@"NSError: %@", outError);
        // NSInteger *errorCode = (NSError * __autoreleasing *)outError;
        NSLog(@"Engine started");    }
    @catch (NSException *e) {
        NSLog(@"Unable to start engine:  %@  %@", e.name, e.reason);
        return NO;
    }
}
- (BOOL) loadSoundbankAndInstrument {
    NSError *outError;
    BOOL success;
        @try {
          success =  [synthesizer loadSoundBankInstrumentAtURL:soundbank program:gm_instrument
                bankMSB:defaultBankMSB bankLSB:defaultBankLSB error:&outError];
            if (success) {
            NSLog(@"Instrument and soundbank loaded");
            return YES;
            } else {
                NSLog(@"Instrument and soundbank not loaded");
                NSLog (@"Error code is %ld  %@", outError.code, outError.localizedFailureReason);
            }
        }
        @catch (NSException *e) {
                  NSLog (@"Problem loading instrument and soundbank %@ %@", e.name, e.reason);
            return NO;
        }
    
    }
    
    
    

- (BOOL) selectBuiltInFile:(UInt8) option {
    return NO;
}
- (BOOL) pickMIDIFileURL {
    return YES;
}
- (BOOL) setMIDIFileURL:(NSURL *) url {
    return YES;
}
- (void) debugValues {
    NSLog(@"Debug values");
    NSLog(@" gm_instrument= %d   defaultBankMSB=%d   defaultBankLSB=%d",
          gm_instrument, defaultBankMSB, defaultBankLSB);
    NSLog(@"soundbank %@",soundbank);
}

+ (void) test1 {
    VirtualSynthesizer *synth = [[VirtualSynthesizer alloc] init];
    BOOL success = [synth startEngine];
    if (success) {
        NSLog(@"Engine started");
    } else {
        NSLog(@"Failure in starting engine");
    }
    success = [synth loadSoundbankAndInstrument];
    if (success) {
        [synth startNote:64 withVelocity:75 onChannel:0];
        [NSThread sleepForTimeInterval:2.0];
        [synth stopNote:64 onChannel:0];
    } else {
        [synth debugValues];
        [NSThread sleepForTimeInterval:4.0];
        
    }
    NSLog(@"VirtualSynthesizer test1 complete");
}
@end
