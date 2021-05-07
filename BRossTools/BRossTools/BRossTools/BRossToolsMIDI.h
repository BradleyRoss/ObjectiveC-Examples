//
//  CoreMIDIsamples.h
//  BRossTools
//
//  Created by Bradley Ross on 3/18/21.
//
#import <Foundation/Foundation.h>
#import <CoreMIDI/CoreMIDI.h>
#import "BRossTools.h"
#import "BRossToolsMIDI.h"
#import "LocalClasses.h"
#ifndef BRossToolsMIDI_h
#define BRossToolsMIDI_h

//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****


/**
 @brief Use CoreMIDI to read key strokes for notes.
 
 Listens for keystrokes on a MIDI keyboard.
 
 I first tried using this
 [starting eample](http://comelearncocoawithme.blogspot.com/2011/08/reading-from-external-controllers-with.html]
 however it gave me a message that the program was trying to start a task on
 the main queue and that was not allowed.  It also gave me a number of statements
 that functions used in the program were deprecated.
 
 */

@interface BRossToolsMIDIListenForInput:NSObject
- (void) runtest;
- (BRossToolsTextWindow *) getTextWindow;
- (void) setTextWindow:(BRossToolsTextWindow *) window;
@end

//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****  *****

/**
 @brief Read keyboard presses using the legacy apis.
 
 @todo Insert code for selecting MIDI device.
 
 @todo  If I have the clent  create an output Port, will it show up on Audio MIDI Setup?  Will GarageBand be able to connectt to the port?
 
 @todo Running this version resulted in the following message being sent to the log.  I don't know if this is a problem.  <i>2021-03-31 20:59:33.847954-0400 BRossTools[12359:542211] [plugin] AddInstanceForFactory: No factory registered for id <CFUUID 0x60000398e400> F8BB1C28-BAE8-11D6-9C31-00039315CD46</i>
 */
@interface BRossToolsMIDIListenForInput2:NSObject {
    OSStatus result;
    /**
    @brief Identifier for MIDI client software.
     */
    MIDIClientRef midiClient;
    /**
    @brief Identifier for external MIDI device (keyboard)
     */
    MIDIEndpointRef sourceRef;
    /**
     @brief MIDIObjectRef for Input Port.
     
     The Input Port receives information from the
     external source indicated by sourceRef
     so that it can be processed by the client
     indicated by midiClient.
     */
    MIDIPortRef inputPort;
    /**
    @brief option for client creation;
         
         0 = ClientCreate with null entry for NotifyProc
         
         2021-04-02 22:11:22.615261-0400 BRossTools[21102:1056359] BRossToolsMIDIListenForInput2 - use subroutines from original article
         
         2021-04-02 22:11:22.641355-0400 BRossTools[21102:1056359] Client created with name of MIDI client
         
         2021-04-02 22:11:22.726058-0400 BRossTools[21102:1056359] [plugin] AddInstanceForFactory: No factory registered for id <CFUUID 0x600002d1d0e0> F8BB1C28-BAE8-11D6-9C31-00039315CD46
        
            1 = ClientCreate with entry for ReadProc
        */
        int clientCreateOption;
        /**
         @brief option for creating input port
         */
        int inputPortOption;
        
    /**
     @brief name of source device (keyboard)
     */
    CFStringRef sourceName;
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
    BRossToolsTextWindow *windowValue;
    }
- (void) runtest;
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
 * @brief Create a dummy MIDIPacketList and send it to the first MIDI destination.
 */
@interface TestSendDummy:NSObject
/**
 * @brief Send a dummy MIDIPacketList to a destination.
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
 @brief Send MIDI commands to synthesizer.
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
    int outputPortOption;
        
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

- (void) initWithWindow:(BRossToolsTextWindow *) window;

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
- (id)initWithWindow:(BRossToolsTextWindow *) window;
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



#endif /* BRossToolsMIDI_h */
