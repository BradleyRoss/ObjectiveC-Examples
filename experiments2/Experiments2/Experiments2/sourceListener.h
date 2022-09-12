//
//  sourceListener.h
//  Experiments2
//
//  Created by Bradley Ross on 8/27/22.
//
/**
 *  \file sourceListener.h
 *  @brief listen for keystrokes
 */
#ifndef sourceListener_h
#define sourceListener_h
#import <CoreMIDI/CoreMIDI.h>
#import "restart.h"
#import "machTiming.h"
/**
 * @brief Listens for MIDI events from a MIDI source.
 *  MIDIClientCreateWithBlock [Apple Doc](https://developer.apple.com/documentation/coremidi/1495330-midiclientcreatewithblock?language=objc)
 *
 *  MIDINotifyBlock   [Apple Doc](https://developer.apple.com/documentation/coremidi/midinotifyblock?language=objc)
 *
 *  MIDIDestinationCreateWithProtocol  [Apple Doc](https://developer.apple.com/documentation/coremidi/3566476-mididestinationcreatewithprotoco?language=objc)
 *
 *  MIDISourceCreateWithProtocol [Apple Doc](https://developer.apple.com/documentation/coremidi/3566495-midisourcecreatewithprotocol?language=objc)
 *
 *  MIDIInputPortCreateWithProtocol  [Apple Doc](https://developer.apple.com/documentation/coremidi/3566488-midiinputportcreatewithprotocol?language=objc)  When creating an input port, a MIDIReceiveBlock is specified which will process the incoming MIDIEventList items.
 *
 *  MIDIOutputPortCreate [Apple Doc](https://developer.apple.com/documentation/coremidi/1495166-midioutputportcreate?language=objc)  (There was a mistake in my notes.  It does not appear that MIDIOutputPortWithProtocol exists.)
 *
 *  MIDIReceiveBlock [Apple Doc](https://developer.apple.com/documentation/coremidi/midireceiveblock?language=objc)  For some reason, referring to the page in the Apple Documentation has this listed under Deprecated Functions in the left sidebar, although the Deprecated icon does not appear next to the function.
 *
 *  MIDIPortConnectSource [Apple Doc](https://developer.apple.com/documentation/coremidi/1495278-midiportconnectsource?language=objc]) The comments are confusing on this one.  The description of port indicates that the data arrives via MIDIReadProc.  The description of connRefCon indicates that it can arrive via MIDIReadProc or MIDIReadBlock.  However, it seems that arriving via MIDIReceiveBlock is the  only undeprecated means by which data can arrive.
 */
@interface sourceListener:NSObject {
    endpoints *ends;
    MIDIClientRef clientID;
    MIDIPortRef sourceID;
    CFStringRef clientName;
    MIDIObjectRef inputPort;
    MachTiming *machTiming;
}
- (instancetype) initAndStart;
- (void) stopListener;
@end

#endif /* sourceListener_h */
