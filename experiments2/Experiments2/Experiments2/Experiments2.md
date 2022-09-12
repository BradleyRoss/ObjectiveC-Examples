
The purpose of this program is to contain some code demonstrating snippets using the CoreMIDI 
framework in MacOS.  The program asks the user for an integer which determines which part of the program is run.

##  1 Compare MIDI1UPNoteOff and MIDI1UPChannelVoiceMessage

There are a number of functions that can build MIDI messages.  These are MIDI1UPNoteOn, MIDI1NoteOff, MIDI1UPPitchBend,
and MIDI1UPControlChange.  However, there was no function call for Program Change.  
(The start of the function names stands for "MIDI 1.0 using Universal Packets".)However, all of these are 
merely macros that call MIDI1UPChannelVoiceMessage.  This snippet shows how the same MIDI message can be generated
using MIDI1NoteOff and MIDI1UPChannelVoiceMessage.

##  2 MIDINoteOn and MIDI1NoteOff

This snippet generates some MIDI messages for Note On and Note Off.

##  3 Program Change using MIDI1UPChannelVoiceMessage

As mentioned above, there is no MIDI1UPProgramChange method to create the Program Change message.


##  4 List Sources and Destinations

This snippet lists all of the sources and destinations that are connected to the MIDI software.

##  5 MachTiming

The time stamps in MIDIEventList use mach_absolute_time.  This snippet shows some sample code for handling mach_absolute_time.  

##  6 Listen for MIDI source

This snippet allows the user to select a MIDI source and then listens to all of the keystrokes on the source.

##  7 Stop listening for MIDI SOURCE

This will have to be changed.  It was originally for terminating the reporting of keystrokes in option 6.


##  8 Test for building MIDIEventList

This snippet builds and parses a sample MIDIEventList.




I ran Google for .coremidi writing MIDIEventList

[Replace deprecated Core MIDI method with designated ones for iOS 14.2 #296](https://github.com/mixedinkey-opensource/MIKMIDI/issues/296)

[ Torrey Holbrook Walker](https://twitter.com/MIDIWalker/status/1280584426821259264) CoreAudio at Appple [LinkedIn](https://www.linkedin.com/in/midiwalker) [Bandcamp](https://bandcamp.com/holbysouth) User id on Twitter is (at)MIDIWalker



[Apple Documentation for CoreMIDI](https://developer.apple.com/documentation/coremidi?language=objc)

[Finding error codes](https://eclecticlight.co/2016/05/21/error-numbers-the-final-hurdle/)

[Rust Documentation](https://docs.rs/coremidi-sys/latest/coremidi_sys/fn.MIDIEventListInit.html)

[Rust Main page for CoreMidi](https://crates.io/crates/coremidi)

## Questions on CoreMIDI

[Is CoreMIDI thread safe?](https://github.com/chris-zen/coremidi/issues/14)

https://www.logicprohelp.com/forums/topic/142470-please-help-me-to-control-midi-in-onoff-in-automation-with-logic-script/page/2/

https://cpp.hotexamples.com/examples/-/-/MIDISend/cpp-midisend-function-examples.html

[Asking for help writing CoreMIDI software](https://forum.lazarus.freepascal.org/index.php?topic=50833.0)

https://forum.lazarus.freepascal.org/index.php?topic=50833.0

[Asking for help](https://www.elektronauts.com/t/any-good-coremidi-resources-for-maxos-midi-tool-creation/53594)

Computer Music Instruments II: Realtime and Object-Oriented Audio by Victor Lazzarini

Swift Programming The Big Nerd Ranch Guidehttps://push.columbian.com › redir_esc
PDF
29 minutes ago — and copious code examples, you'll ... 3D positional audio; using Core MIDI ... programming with real-world examples ...

## MIDI functions, structures, typedefs, etc.

[MIDIReceiveBlock](https://developer.apple.com/documentation/coremidi/midireceiveblock?language=objc)  Is there a problem with thread safety with regard to how the MIDIReceiveBlock processes the MIDIEventList.  Can only one instance of the MIDIReceiveBlock run at a time?








 
### [MIDI Services](https://developer.apple.com/documentation/coremidi/midi_services?language=objc)

### MIDI Services - MIDI Object Configuration

### MIDI Services - Client Management

[MIDIClientCreate](https://developer.apple.com/documentation/coremidi/1495360-midiclientcreate?language=objc)  It is unclear whether thishould be marked as deprecated since it uses MIDINotifyProc.  It would appear that the latest version is MIDIClientCreateWithBlock.

[MIDIClientCreateWithBlock](https://developer.apple.com/documentation/coremidi/midinotifyblock?language=objc)

[MIDIClientDispose](https://developer.apple.com/documentation/coremidi/1495335-midiclientdispose?language=objc)

[[MIDIClientRef](https://developer.apple.com/documentation/coremidi/midiclientref?language=objc)  This is a subtype of MIDIObjectRef.

### MIDI Services - Device Lookup

[MIDIGetNumberOfDevices]

[MIDIGetDevice]

[MIDIGetNumberOfExternalDevices]

[MIDIGetExternalDevice]

[MIDIDeviceGetNumberOfEntities]

[MIDIDeviceGetEntity]




### MIDI Services - Entity Lookup

[MIDIEntityRef]

### MIDI Services - PortManagement

[MIDIOutputPortCreate](https://developer.apple.com/documentation/coremidi/1495166-midioutputportcreate?language=objc)

[MIDIInputPortCreateWithProtocol](https://developer.apple.com/documentation/coremidi/3566488-midiinputportcreatewithprotocol?language=objc)

### MIDI Services - Endpoint Management

### MIDI Services - Event List Management

[MIDIEventPacket](https://developer.apple.com/documentation/coremidi/midieventpacket?language=objc)

[MIDIEventPacketNext](https://developer.apple.com/documentation/coremidi/3566487-midieventpacketnext?language=objc)


[MIDISendEventList](https://developer.apple.com/documentation/coremidi/3566494-midisendeventlist?language=objc)

[MIDIReceivedEventList](https://developer.apple.com/documentation/coremidi/3566493-midireceivedeventlist?language=objc)

[MIDIEventList](https://developer.apple.com/documentation/coremidi/midieventlist?language=objc)

[MIDIEventListInit](https://developer.apple.com/documentation/coremidi/3566482-midieventlistinit?language=objc)

[MIDIEventListAdd](https://developer.apple.com/documentation/coremidi/3566481-midieventlistadd?language=objc)  The MIDI messages are built in an array of UInt64 words.




## Unsorted

[MIDIMessage_32](https://developer.apple.com/documentation/coremidi/midimessage_32?language=objc)  This is actually defined via _TYPEDEF UInt32 MIDIMessage\_32_.

[MIDI1UPChannelVoiceMessage](https://developer.apple.com/documentation/coremidi/3667327-midi1upchannelvoicemessage?language=objc)  This can be used to process the following MIDI messages to fit in a 32 bit integers.It is used for MIDI1UPNoteOff, MIDI1UPNoteOn, MIDI1UpControlChange, MIDI1UPPitchBend.

[MIDI2ChannelVoiceMessage]() This can be used to process the following MIDI 2 messages to fit it in two 32 bit integers.  It is used for MIDI2NoteOn, MIDI2NoteOff, MIDI2PolyPressure, MIDI2RegisteredPNC, MIDI2AssisgnablePNC, MID2ControlChange, MIDI2RegisteredControl, MIDI2AssignableControl, MIDI2ProgramChange, MIDI2ChannelPressure, MIDI2PitchBend, MIDI2PerNotePitchBend. 

MIDIEventVisitor  ???

MIDIEventListForEachEvent ???

[ByteCount](https://developer.apple.com/documentation/kernel/bytecount/)   In the kernel this is defined as _typedef IOByteCount ByteCount_ while DriverKit defines as _typedef IOByteCount64 IOByteCount_ and _typedef uint64\_t IOByteCount64_

##MIDI constants
| Command | kCF constants | value |
|---      |---            | ---|
| Note Off  | [kMIDICVStatusNoteOff](https://developer.apple.com/documentation/coremidi/midicvstatus/kmidicvstatusnoteoff)  | 8 |
| Note On  | [kMIDICVStatusNoteOn](https://developer.apple.com/documentation/coremidi/midicvstatus/kmidicvstatuscontrolchange)  | 9  |
| Polyphonic Aftertouch |  [kMIDICVStatusPolyPressure](https://developer.apple.com/documentation/coremidi/midicvstatus/kmidicvstatuspolypressure) |10|
| Control Change | [kMIDICVStatusControlChange](https://developer.apple.com/documentation/coremidi/midicvstatus/kmidicvstatuscontrolchange) |  11 |
| Program Change | [kMIDICVStatusProgramChange](https://developer.apple.com/documentation/coremidi/midicvstatus/kmidicvstatusprogramchange)  | 12|
| Channel Aftertouch | [kMIDICVStatusChannelPressure](https://developer.apple.com/documentation/coremidi/midicvstatus/kmidicvstatuschannelpressure)  |  13|
| Pitch Bend   | [kMIDICVStatusPitchBend](https://developer.apple.com/documentation/coremidi/midicvstatus/kmidicvstatuspitchbend) | 14 |

## Reading MIDIEventList


## Writing MIDIEventList
