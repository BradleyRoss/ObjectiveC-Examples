//
//  BRossToolsMIDI.h
//  BRossTools
//
//  Created by Bradley Ross on 3/18/21.
//
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

#import <AppKit/AppKit.h>
#import <CoreMIDI/CoreMIDI.h>
#import <AVFAudio/AVFAudio.h>

#import "BRossTools.h"
// #import "LocalClasses.h"
// #import "BRossToolsMIDI.h"

// #import "CoreMidiSamples.h"
#ifndef BRossToolsMIDI_h
#define BRossToolsMIDI_h

//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****






/**
 
 
 @brief Read keyboard presses using the legacy apis.
 
 I first tried using this
 [starting eample](http://comelearncocoawithme.blogspot.com/2011/08/reading-from-external-controllers-with.html]
 
 @todo Insert code for selecting MIDI device.
 
 @todo  If I have the clent  create an output Port, will it show up on Audio MIDI Setup?  Will GarageBand be able to connectt to the port?
 
 @todo Running this version resulted in the following message being sent to the log.  I don't know if this is a problem.  2021-03-31 20:59:33.847954-0400 BRossTools[12359:542211] [plugin] AddInstanceForFactory: No factory registered for id <CFUUID 0x60000398e400> F8BB1C28-BAE8-11D6-9C31-00039315CD46
 */
@interface BRossToolsMIDIListenForInput2:NSObject
- (instancetype) init;
- (void) runtest;
- (void) runtestWithWindow:(BRossToolsTextWindow *)window;
- (BRossToolsTextWindow *) getTextWindow;
- (void) setTextWindow:(BRossToolsTextWindow *) window;
- (void) killClient;
- (void) playMidiFile;
- (void) recordMidiFile;
@end

//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
/**
 * @brief Create a dummy MIDIPacketList and send it to the first MIDI destination.
 */
@interface TestSendDummy:NSObject
/**
 * @brief Send a dummy MIDIPacketList to a destination.
 *
 * @todo These are going to have to be renamed since they take the place of the init method.
 */
- (void) runtestWithWindow:(BRossToolsTextWindow *) window;

- (void) runtest ;

@end

//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****

/**
 * @brief create a dummy MIDIPacketList and parse it.
 *
 * This method generates a dummy MIDIPacketList object and then parses it using
 * [BRossToolsMIDIPacketListRead processPacketList].
 */
@interface TestReadDummy:NSObject
- (void) runtest;

@end

//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****

/**
 @brief Send MIDI commands to external or virtual synthesizer.
 @todo  Insert code for selecting MIDI device.
 */
@interface BRossToolsMIDISendMIDI:NSObject {
    OSStatus result;
    /**
    @brief Identifier for MIDI client object.
     */
    MIDIClientRef midiClient;
    /**
    @brief Identifier for external MIDI device (synthesizer)
     */
    MIDIEndpointRef destRef;
    /**
     * @brief MIDIObjectRef for output port.
     *
     * The Output Port belongs to the client andsends information from the
     * client indicated by sourceRef
     * so that it can be processed by the client
     * indicated by midiClient.
     */
    MIDIPortRef outputPort;
    /**
     * @brief option for client creation;
     *
     * Option used for creeate client
     *
     * 0 = MIDIClientCreate with null entry for NotifyProc
     *
     * 1 = MIDIClientCreate with entry for ReadProc
     */
    int clientCreateOption;
    /**
     *   @brief option for creating output port
     *
     * The value is currently hard-coded to a value of 1
     * but is not used by the class.  The software uses MIDIOutputPortCreate
     * for creation of the ouput port for the client.
     */
    // int outputPortOption;
        
    /**
     @brief name of source device (keyboard)
     */
    CFStringRef destName;
    /**
     @brief name of client
     */
    CFStringRef clientName;
    /**
     @brief name of input port
     */
    CFStringRef portName;
    /**
    @brief Pointer to BRossToolsTextWindow.
         
    */
    BRossToolsTextWindow *textWindow;
    
    }
- (void) runtestWithWindow:(BRossToolsTextWindow *)window;
- (BRossToolsTextWindow *) getTextWindow;
- (void) setTextWindow:(BRossToolsTextWindow *) window;
- (void) killClient;
@end


//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
/**
 @brief Read the contents of a MIDIPacketList
 */
@interface BRossToolsMIDIPacketListRead:NSObject
/**
 @todo should have instancetype for methods beginning with init - test change below
 */
- (instancetype) initWithWindow:(BRossToolsTextWindow *) window;

- (void) processPacketList:(MIDIPacketList *) packetList;
/**
 @brief Process the contents of an individual MIDIPacket
 
 This method processes the contents of a MIDI packet.  By subclassing and
 overriding this method, you can substitute your desired action for processing
 the packet.
 */
- (void) processPacket:(MIDIPacket *) packet;
@end

//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****

/**
  * @brief Construct a MIDIPacketList object
 
  The following are some of the structures used for MIDIPacketList,
 
 *  - struct MIDIPacketList, and MIDITimeStamp
 *        - UInt32              numPackets
 *        - MIDIPacket          packet[1]
 *  - struct MIDIPacket
 *       - MIDITimeStamp       timeStamp
 *       - UInt16              length
 *       - Byte                data[256]
 *  - UInt64  MIDITimeStamp
 */
@interface BRossToolsMIDIPacketListBuild:NSObject
/**
 @brief initialize packet list
 @param window Text window to be used for displaying information.
 */
- (instancetype)initWithWindow:(BRossToolsTextWindow *) window;
/**
 @brief Add the packet to the packet list.
 
 In adding the packet, it will increment the number of packets in the packet list and initialize
 the data structure for the next packet.
 @param time MIDITimeStamp to be inserted into packet header.
 @returns (0 if successfully added packet, otherwise error code
 */
 - (int *) addPacket:(MIDITimeStamp) time;
/**
 @brief Add MIDI command to packet (excl SysEx).
 @param command value indicating type of command
 @param channel channel to which command is sent
 @param values array of integer values containing values used with command
 @returns 0 if sucessfully added command, otherwise error code



 The following are the constants for the command codes.
  
 See https://www.midi.org/specifications-old/item/table-1-summary-of-midi-message
 
 <table>
 <tr><td>kMIDICVStatusNoteOff</td><td>value = 0x8,  2 data bytes</td></tr>
 <tr><td>kMIDICVStatusNote On </td><td>value = 0x9,  2 data  bytes</td></tr>
 <tr><td>kMIDICVStatusPolyPressure</td><td>value = 0xA, 2 data bytes</td></tr>
 <tr><td>kMIDICVStatusControlChange</td><td>value = 0xB, 2 data bytes</td></tr>
 <tr><td>kMIDICVStatusProgramChange </td><td>value = 0xC, 1 data byte</td></tr>
 <tr><td>kMIDICVStatusChannelPressure</td><td>value =0xD, 1 data byte</td></tr>
 <tr><td>kMIDICVStatusPitchBend  </td><td> value = 0xE, 2 data bytes holding a 14 bit integer </td></tr>
 <tr><td>A value of 15 indicates non musical commands</td>
    <td>value = 0xF, variable number of data  bytes</td></tr>
 </table>
 */
- (int) addCommand:(u_int)command channel:(u_int)channel values:(u_int *)values;
/**
 @Finish packet list
 @return error code
 */
- (MIDIPacketList *) build;

- (void) setPort: (MIDIPortRef)portValue;

- (void) setDest:(MIDIEndpointRef)destValue ;
    
- (void) setDelay:(float) value;

- (MIDIPacketList *) sendPacketList;

@end

//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****

/**
 
 The following methods are inherited from AVAudioUnitSampler: prepareToPlay, play
 
 The following methods are inherited from AVAudioUnitMIDIInstrument: sendController:withValue:onChannel:,
 sendMIDIEvent:data1:, sendMIDIEvent:data1:data2:,msendMIDISysExEvent:, sendPitchBend:onChannel:, sendPressure:onChannel:, sendPressureForKey:withValue:onChannel:, sendProgramChange:bankMSB:bankLSB:onchannel:, sendProgramChange:onChannel:, startNote:withVelocity:onChannel:, stopNote:onChannel:
 
 */
@interface VirtualSynthesizer:NSObject
/**
 @brief Initialize synthesizer.
 
 Initialize the object with a default sound bank, but no MIDI file will be set up for playing.  The methods inherited
 from AVAudioUnitMIDIInstrument can be used to play notes on the synthesizer.  In addition, the MIDI file can be
 selected and played using the other methods for this class.
 
 @returns self.
 */

- (instancetype) init;
/**
 Select one of the two sound bank files bundled with the app.
 
 @param option indicates bundled sound bank to use.
 
 1 = GeneralUser GS MuseScore v1.442.sf2
 
 2 = gs_instruments.dls
 
 @returns BOOLEAN YES/NO to indicate whether file picker was successful.  (YES = succeess)
 */
- (BOOL) setSoundBank:(UInt8) option;

/**
 Select one of the two MIDI files bundled in the app.
 
 @param option indicates bundled MIDI file to use.
 
 1 = sibeliusGMajor.mid
 
 2 = ntbldmtn.mid (Night on Bald Mountain)
 
 @returns BOOLEAN YES/NO to indicate whether file picker was successful.  (YES = succeess)
 */
- (BOOL) selectBuiltInFile:(UInt8) option;
/**
 @Select the default instrument to be used.
 
 <a href="https://www.midi.org/specifications-old/item/gm-level-1-sound-set" target="_blank">
 A list of instruments can me found on the MIDI&trade;
 Association web site</a>.  Note that the values entered for the option ranges from 0 to 127 while the numbers for the instruments
 range from 1 to 128.
 
 */
/**
 @brief Open the file picker to select the MIDI file to play.
 @returns BOOLEAN YES/NO to indicate whether file picker was successful.  (YES = succeess)
 */
 - (BOOL) pickMIDIFileURL;

/**
 @brief Specify the NSURL for the MIDI file to be played.
 
 @param url  NSURL object for file to be played.
 
 @returns BOOLEAN YES/NO to indicate whether file picker was successful.  (YES = succeess)
 */
- (BOOL) setMIDIFileURL:(NSURL *) url;
- (BOOL) loadSoundbankAndInstrument;
- (BOOL) startEngine;
- (void) debugValues;
- (void) test1;
- (AVAudioUnitSampler *) getSynthesizer;
- (AVAudioEngine *) getAudioEngine;
@end

//  *****  *****  *****  ******  *****  ******



@interface PlayMIDIFile:NSObject
- (PlayMIDIFile *) init;
/**
 @brief Select one of the MIDI files contained in the app.
 
 @param option Indicsates built in MIDI file to play.
 
 There are two MIDI files contained in the main bundle of the application.
 
 1 = sibeliusGMajor.mid
 
 2 = ntbldmtn.mid (Night on Bald Mountain)
 
 @returns BOOLEAN YES/NO to indicate whether the method was run successfully - YES indicates success
 */
- (BOOL) selectBuiltinFile:(UInt8) option;
- (void) songFinished;

// ******  *****  *****  *****  *****  *****  *****
// ******  *****  *****  *****  *****  *****  *****
// ******  *****  *****  *****  *****  *****  *****
// ******  *****  *****  *****  *****  *****  *****
// ******  *****  *****  *****  *****  *****  *****
// ******  *****  *****  *****  *****  *****  *****


/**
 @brief Open a modal window to select a MIDI file.
 
 @returns BOOLEAN YES/NO to indicate whether the method was run successfully - YES indicates success
 */
- (BOOL) pickMIDIFileURL;



/**
 @brief specify the source of the MIDI file to be played.
 
 @param url This is the NSURL value for the file to be played.  It is the same
                NSURL value that would be loaded if you were using
                pickMIDIFileURL to specify the file
 @returns BOOLEAN YES/NO to indicate whether the method was run successfully - YES indicates success
 */
- (BOOL) setMIDIFileURL:(NSURL *) url;



// ******  *****  *****  *****  *****  *****  *****
// ******  *****  *****  *****  *****  *****  *****
// ******  *****  *****  *****  *****  *****  *****
// ******  *****  *****  *****  *****  *****  *****
// ******  *****  *****  *****  *****  *****  *****
// ******  *****  *****  *****  *****  *****  *****


/**
 @brief Select one of two sound banks that are stored in the main bundle.
 @param option Indicates sound bank to use
 
 1 = GeneralUser GS MuseScore v1.442.sf2
 
 2 = gs_instruments.dls
 */
- (BOOL) selectSoundBank:(UInt8) option;

// ******  *****  *****  *****  *****  *****  *****
// ******  *****  *****  *****  *****  *****  *****
// ******  *****  *****  *****  *****  *****  *****
// ******  *****  *****  *****  *****  *****  *****
// ******  *****  *****  *****  *****  *****  *****
// ******  *****  *****  *****  *****  *****  *****

/**
 @brief First sample program.
 '
 Play a G Major scale
 
 The code to launch this sample case is as follows.
 <ul>
 <li>PlayMIDIFile *midiTest = [[PlayMIDIFile alloc] init];</li>
 <li>[midiTest test1];</li>
 </ul>
 */
- (void) test1;

// ******  *****  *****  *****  *****  *****  *****
// ******  *****  *****  *****  *****  *****  *****
// ******  *****  *****  *****  *****  *****  *****
// ******  *****  *****  *****  *****  *****  *****
// ******  *****  *****  *****  *****  *****  *****
// ******  *****  *****  *****  *****  *****  *****

/**
@brief Second sample program.
 
 Play "Night on Bald Mountain"
 
 The code to launch this sample case is as follows.
 <ul>
 <li>PlayMIDIFile *midiTest = [[PlayMIDIFile alloc] init];</li>
 <li>[midiTest test2];</li>
 </ul>
 */
-  (void) test2;
 /**
  @brief Third sample program. - Pick a midi file and play it through software syntesizer.
  
  A file picker is used to let the user pick the MIDI file to be played.
  
  The selected sound bank is GeneralUser GS MuseScore v1.442.sf2.
  
  The code to launch this sample case is as follows.
  <ul>
  <li>PlayMIDIFile *midiTest = [[PlayMIDIFile alloc] init];</li>
  <li>[midiTest test3];</li>
  </ul>
  */
- (void) pickMIDIFileAndPlay;

@end
#endif /* BRossToolsMIDI_h */
