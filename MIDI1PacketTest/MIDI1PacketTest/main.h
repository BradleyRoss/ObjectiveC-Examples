//
//  main.h
//  MIDI1PacketTest
//
//  Created by Bradley Ross on 4/16/21.
//

#ifndef main_h
#define main_h
/**
 @brief Converts time in seconds to mach_absolute_time ticks
 @param seconds time duration in seconds
 @return tiime duration in mach_absolute_time ticks
 

 @see https://eclecticlight.co/2020/09/08/changing-the-clock-in-apple-silicon-macs/ for information on the differences between translating mach_absolute_time to and from nanoseconds on various
 apple platforms
 */
MIDITimeStamp getTicks(float seconds);
/**
 @brief Converts mach_absolute_time ticks to seconds
 @param ticks time duration in mach_absolute_time ticks
 @return time duration in seconds
 
 @see getTicks(float) for more information
 */
float getSeconds(UInt64 ticks);
/**
  @brief Add a "note off" command to the packet list.
 @param time Time in seconds to be converted for the MIDITimeStamp field in the MIDIPacket.  The value for the time stamp would normally be the length of time since the epoch date.  However, the absolute time in seconds was used to make it easier to understand the demonstration.
 
 @param channel Channel number for MIDI channel expressed as 0 to 15 (The channels are numbered from 1 to 16)
 
 @param pitch a number from 0 to 127 to indicate the pitch of the note.  A value of 60 represents Middle C.
 
 @param velocity  a number from 0 to 127 to indicate the loudness of the note.  Since this command turns the note off, it is not clear what it is used for, however there were some comments on the internet that some vendors may use it in a proprietary fashion.
 
 @return 0 if sucess in adding packet, 1 otherwise
 
    @see https://stackoverflow.com/questions/15923236/proper-use-of-midipacketlistadd-coremidi for some information on adding packets to a packet list
 @see https://stackoverflow.com/questions/15923236/proper-use-of-midipacketlistadd-coremidi for some information on building the MIDIPacketList.
 */
int addNoteOff(float time, int channel, int pitch, int velocity);


/**
 @brief Add a "note on" command to a MIDIPacketList.
 
 @param time see addNoteOff
 
 @param channel MIDI channel to be used
 
 @param pitch frequency of note involved
 
 @param velocity  loudness of note

 @return 0 if sucess in adding packet, 1 otherwise
 
 @see addNoteOff(float,int,int,int) for more information.
 */
int addNoteOn(float time, int channel, int pitch, int velocity);
/**
 @brief Parse and display the contents of a MIDIPacketList object;
 
 @param pktList MIDIPacketList object to be parsed
 */
void readPacketList(MIDIPacketList *pktList);
/**
 @brief Get current time as mach_absolute_time
 @return time
 @see https://developer.apple.com/documentation/kernel/1462446-mach_absolute_time
 */
uint64_t mach_absolute_time(void);

void readPacketList(MIDIPacketList *pktList);
#endif /* main_h */
