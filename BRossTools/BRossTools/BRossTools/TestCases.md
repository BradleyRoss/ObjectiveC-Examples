#  ObjectiveC-Examples

I have created a number of Objective-C examples dealing with CoreMIDI,
CoreAudio, and the Foundation Framework.  The [GitHub repository](https://github.com/BradleyRoss/ObjectiveC-Examples) contains the Xcode project in the directory BRossTools, while there is an [associated URL for documentation](https://bradleyross.github.io/ObjectiveC-Examples/Documentation/BRossTools/).



### MIDI Examples

When you compile and execute the BRossTools application, a window appears with a number of buttons for running the various examples.

#### Listen for keystrokes

If there is only one MIDI source attached to the system, the actions of the
keystrokes will be sent to a software synthesizer.

There are two buttons on the main menu related to this example: "Start listening for keystrokes" (The identifier is "m3") and "Stop listening for keystrokes" (The identifier is "m4".)

The code attached to m3 is

* window = [BRossToolsTextWindow newWindow];
* window.title=@"Listen for notes";
* listener = [BRossToolsMIDIListenForInput2 alloc];
* [listener runtestWithWindow:window];

The code attached to m4 is
 
* [listener killClient];

##### Provides examples of

* [AVAudioUnitSampler](https://developer.apple.com/documentation/avfaudio/avaudiounitsampler/) This is a software synthesizer.
* [MIDIClientCreateWithBlock](https://developer.apple.com/documentation/coremidi/1495330-midiclientcreatewithblock?language=objc)
* [MIDIInputPortCreateWithBlock](https://developer.apple.com/documentation/coremidi/1495333-midiinputportcreatewithblock?language=objc)  For MIDI 2.0, this will be replaced by  [MIDIInputPortCreateWithProtocol](https://developer.apple.com/documentation/coremidi/3566488-midiinputportcreatewithprotocol?language=objc)
* [MIDINotifyBlock](https://developer.apple.com/documentation/coremidi/midinotifyblock?language=objc) Blocks are also known as closures and this block is called when modifications are made to the MIDI configuration.
* [MIDIPortConnectSource](https://developer.apple.com/documentation/coremidi/1495278-midiportconnectsource?language=objc) This function connects a virtual input port on a client to a MIDI source.
* [MIDIReadBlock](https://developer.apple.com/documentation/coremidi/midireadblock?language=objc) (For MIDI 2.0, this will be replaced by [MIDIReceiveBlock](https://developer.apple.com/documentation/coremidi/midireceiveblock?language=objc)).  This block is called when MIDI information is received by a virtual input port or a virtual destination.


#### Select and play a MIDI file

This sample will allow the user to select a MIDI file via a panel and then play the file on the internal synthesizer.

The identifier for this button is "m1a" and the associated code is ...

* PlayMIDIFile *midiTest = [[PlayMIDIFile alloc] init];
* [midiTest pickMIDIFileAndPlay];

##### Provides examples of

* [AVMIDIPlayer](https://developer.apple.com/documentation/avfaudio/avmidiplayer) This is a convenience class for playing MIDI files through the software synthesizer. Processes involving manipulation of the MIDI data will have to use different classes.


#### Read a dummy MIDIPacketList
This program creates a MIDI 1 [MIDIPacketList](https://developer.apple.com/documentation/coremidi/midipacketlist?language=objc) and then parses it.  This was developed to check the algorithms for building and parsing the list.  MIDI 2 uses [MIDIEventList](https://developer.apple.com/documentation/coremidi/midieventlist?language=objc) and a different set of classes and functions.

The identifier for this button is "m5", and the associated code is ...

* [[TestReadDummy alloc] runtest];

#### Send a dummy MIDIPacketList

The identifier for this button is "m6", and the associated code is ...

*  BRossToolsTextWindow *sendWindow = [BRossToolsTextWindow newWindow];
*  [[TestSendDummy alloc] runtestWithWindow:sendWindow];

This example creates the same MIDIPacketList as in the previous example.  If there is one and only one MIDI destination, it will send the MIDIPacketList to that destination.

This seems to be some sort of intermittent problem that sometimes doesn't allow the notes to play.



#### Show MIDI configuration

This sample shows the devices, entities, sources, and destinations on a system.  This is a hierarchical arrange with a number of devices on the system, (0, 1, or many) entities exist per device, (0, 1, or many) sources exist per entity, and (0, 1, or many) destinations exist per entity.  This code also expands the arrays and dictionaries belonging to the various items. 

The identifier for this button is "b5", and the associated code is ...

* [CoreMidiSample1 runtest];

##### Exammples of

* [MIDIGetNumberOfDevices](https://developer.apple.com/documentation/coremidi/1495164-midigetnumberofdevices?language=objc)  Gets the number of MIDI devices on the system.
* [MIDIGetDevice](https://developer.apple.com/documentation/coremidi/1495368-midigetdevice?language=objc)  Obtains a specific device from the list of devices on the system.  Although the list referenced in MIDIGetNumberOfDevices, the set of devices and their order can change if the configuration of the MIDI system is changed.
* [MIDIDeviceGetNumberOfEntities](https://developer.apple.com/documentation/coremidi/1495354-mididevicegetnumberofentities?language=objc) Gets the number of MIDI entities for a given device.
* [MIDIDeviceGetEntity](https://developer.apple.com/documentation/coremidi/1495261-mididevicegetentity?language=objc)  Obtains information on a specific entity belonging to the device.  As with the list of devices, the members and order of entities can change if changes are made to the configuration.
* [MIDIEntityGetNumberOfDestinations](https://developer.apple.com/documentation/coremidi/1495188-midientitygetnumberofdestination?language=objc) Gets the number of destinations for a specific entity.
* [MIDIEntityGetDestination](https://developer.apple.com/documentation/coremidi/1495223-midientitygetdestination?language=objc) Obtains information on a specific destination belonging to the entity. As with the list of devices, the members and order of destinations can change if changes are made to the configuration.
* [MIDIEntityGetNumberOfSources](https://developer.apple.com/documentation/coremidi/1495284-midientitygetnumberofsources?language=objc) Gets the number of sources for a specific entity.
* [MIDIEntityGetSource](https://developer.apple.com/documentation/coremidi/1495236-midientitygetsource?language=objc) Obtains information on a specific source belonging to an entity As with the list of devices, the members and order of sources can change if changes are made to the configuration.


#### Show MIDI sources/destinations

The identifier for this button is "b6", and the associated code is ...

* [[CoreMMidiSample1 runtest2];

##### Examples of 

* [MIDIGetNumberOfSources](https://developer.apple.com/documentation/coremidi/1495116-midigetnumberofsources?language=objc)  Obtains the number of active MIDI sources in the system.
* [MIDIGetSource](https://developer.apple.com/documentation/coremidi/1495168-midigetsource?language=objc) Obtains a specific source from the list of active sources on the system.  The members and order of the list can change if changes are made to the configuration.
* [MIDIGetNumberOfDestinations](https://developer.apple.com/documentation/coremidi/1495309-midigetnumberofdestinations?language=objc) Obtains the number of active MIDI destinations in the system.
* [MIDIGetDestination](https://developer.apple.com/documentation/coremidi/1495108-midigetdestination?language=objc) Obtains a specific destination from a list of active destinations in the system.  The members and order of the list can change if changes are made to the configuration.

### Foundation Framework Examples

#### b1

* [e2 runtest];

#### b2

* [test1 runtest];

#### b3 BRossToolsTextWindow

* [test2 runtest];

#### b4

* [test4 runtest];

#### b7 CFArray, CFDictionary

* [test5 runtest];


#### b8 Playing with pointers

* [test4 runtest];

