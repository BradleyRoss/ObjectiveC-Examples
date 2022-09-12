//
//  BRossToolsMIDIUP.m
//  Experiments2
//
//  Created by Bradley Ross on 8/24/22.
//
/**
 *    \file BRossToolsMIDIUP.m
 */
#import "BRossToolsMIDIUP.h"


 
// BRossToolsTextWindow *localWindow =self->textWindow;
/*
 The following is based on an article from
 https://eclecticlight.co/2020/09/08/changing-the-clock-in-apple-silicon-macs/
 
 https://developer.apple.com/documentation/driverkit/mach_timebase_info_t
 
 The MIDI timestamp can no longer be assumed to be in nanoseconds
 
 mach_time.h
 struct mach_timebase_info {
     uint32_t        numer;
     uint32_t        denom;
 };

 typedef struct mach_timebase_info       *mach_timebase_info_t;
 typedef struct mach_timebase_info       mach_timebase_info_data_t;
 
 */
// id info = mach_timebase_info();
/*
struct mach_timebase_info info;
kern_return_t kern_result = mach_timebase_info(&info);
uint32_t denom;
uint32_t numer;
if (kern_result == KERN_SUCCESS) {
    numer = info.numer;
    denom = info.denom;
    NSString *message = [[NSString alloc]initWithFormat:@"Mach time conversion numerator: %d denominator: %d \n",numer, denom ];
    if (textWindow != NULL) {
        [textWindow appendString:message];
    } else {
        NSLog(@"%@", message);
    }
    
} else {
    numer = 1;
    denom = 1;
}
UInt64 firstTime = mach_absolute_time();

BRossToolsTextWindow *tempWindow = windowValue;
[tempWindow appendString:@"test"];

 --- start of closure/block/lambda ---

 Executed when MIDI ecent list is received.

 * This is the MIDIReceiveBlock block/lambda/closure to be executed when MIDI data is received from the keyboard.
 
 * pktList is the MIDIPacketList item sent by the client
 
 * srcConnRefCon is the data sent to the client from MIDIPortConnectSource
 
 @todo It appears that a packet can comtain more than one MIDI command.  The code will have to be changed to keep looking for commands until the combined length of the MIDI commands is packet->length
 */
// struct mach_timebase_info info;
// @end

@implementation packetUP
+ (NSString *) showNote:(UInt8) note {
    SInt16 octave = (note / 12) - 1;
    UInt8 key = note %  12;
    /*  '
     Sharp is unicode U+266F
     Flat is U+266D
     */
    switch (key) {
        case 0:
            
            return ([NSString stringWithFormat:@"C %d", octave]);
            break;
        case 1:
            return ([NSString stringWithFormat:@"C\u266F %d", octave]);
            break;
        case 2:
            return ([NSString stringWithFormat:@"D %d", octave]);
            break;
        case 3:
            return ([NSString stringWithFormat:@"D\u266F %d", octave]);
            break;
        case 4:
            return ([NSString stringWithFormat:@"E %d", octave]);
            break;
        case 5:
            return ([NSString stringWithFormat:@"F %d", octave]);
            break;
        case 6:
            return ([NSString stringWithFormat:@"F\u266F %d", octave]);
            break;
        case 7:
            return ([NSString stringWithFormat:@"G %d", octave]);
            break;
        case 8:
            return ([NSString stringWithFormat:@"G\u266F %d", octave]);
            break;
        case 9:
            return ([NSString stringWithFormat:@"A %d", octave]);
            break;
        case 10:                                                                                                        return ([NSString stringWithFormat:@"A\u266F %d", octave]);
            break;
        case 11:
            return ([NSString stringWithFormat:@"B %d", octave]);
            break;
        case 12:
            return ([NSString stringWithFormat:@"B\u266F %d", octave]);
            break;
        default:
            return ([NSString stringWithFormat:@"Unknown %d", octave]);
    }
    
    
}
@end
typedef struct mach_timebase_info       *mach_timebase_info_t;
typedef struct mach_timebase_info       mach_timebase_info_data_t;
/**
 *  @brief Build a MIDIEventList.
 *
 *    MIDIMessage_32 MIDI1UPChannelVoiceMessage(UInt8 group, UInt8 status, UInt8 channel, UInt8 data1, UInt8 data2);
 *
 *    MIDIEventPacket * MIDIEventListAdd(MIDIEventList *evtlist, ByteCount listSize, MIDIEventPacket *curPacket, MIDITimeStamp time, ByteCount wordCount, const UInt32 *words);
 *
 *    The following is taken from Messages.h.
 *
 *      MIDI 1.0 Universal MIDI Packet (MIDI-1UP) Channel Voice Message generalized structure
 *
 *   Word0: [aaaa][bbbb][cccc][dddd][0eeeeeee][0fffffff]
 *
 *    a: Universal MIDI Packet Message Type (0x2 for all voice messages)
 *    b: Channel group number
 *    c: MIDI status
 *    d: MIDI channel
 *    e: MIDI note number
 *    f: Velocity
 *
 *    This routine should start a three note chord two seconds after the start time and terminate it four seconds after the start time.
 */
void buildMIDIEventList(){
    MIDIEventList *addrList;
    UInt32 buffer[1024];
    struct mach_timebase_info info;
    /**
     * Denominator for conversion multiplier
     */
    uint32_t denom;
    /**
     *  Numerator for conversion multiplier
     */
    uint32_t numer;
    /**
     * mach_absolute_time when instance created
     */
    UInt64 startTime = mach_absolute_time();
    kern_return_t kern_result = mach_timebase_info(&info);
        // printf("Test of MachTiming init\n");
    if (kern_result == KERN_SUCCESS) {
        numer = info.numer;
        denom = info.denom;
        // NSLog(@"Mach time conversion numerator: %d denominator: %d \n",numer, denom );
        /*
        NSString *message = [[NSString alloc]initWithFormat:@"Mach time conversion numerator: %d denominator: %d \n",numer, denom ];
        if (textWindow != NULL) {
            [textWindow appendString:message];
        } else {
            NSLog(@"%@", message);
        }
        */
    } else {
        numer = 1;
        denom = 1;
    }
    double factor = (double)denom /(double)numer*1.0E9;
    addrList = (MIDIEventList *)buffer;
    MIDIEventPacket *curPacket = MIDIEventListInit(addrList, kMIDIProtocol_1_0);
    printf("Value of kMIDIProtocol_1_0 is %d\n", kMIDIProtocol_1_0);
    printf("Protocol of event list is %d\n", addrList->protocol);
    printf("Number of MIDIEventPackets is %d\n", addrList->numPackets);
    MIDIEventPacket working;
    working.timeStamp = 0;
    UInt32 words[32];
    UInt32 currentWords = 0;
    words[currentWords] = MIDI1UPChannelVoiceMessage(0, kMIDICVStatusNoteOn, 2, 60, 80);
    currentWords = 1;
    words[currentWords] = MIDI1UPChannelVoiceMessage(0, kMIDICVStatusNoteOn, 2, 62, 80);
    currentWords = 2;
    words[currentWords] = MIDI1UPChannelVoiceMessage(0, kMIDICVStatusNoteOn, 2, 64, 80);
    currentWords = 3;
    curPacket = MIDIEventListAdd(addrList, 1024, curPacket, startTime+factor*2.0, currentWords, words);
    printf("Number of MIDIEventPackets is %d\n", addrList->numPackets);
    currentWords = 0;
    words[currentWords] = MIDI1UPChannelVoiceMessage(0, kMIDICVStatusNoteOff, 2, 60, 80);
    currentWords = 1;
    words[currentWords] = MIDI1UPChannelVoiceMessage(0, kMIDICVStatusNoteOff, 2, 62, 80);
    currentWords = 2;
    words[currentWords] = MIDI1UPChannelVoiceMessage(0, kMIDICVStatusNoteOff, 2, 64, 80);
    currentWords = 3;
    curPacket = MIDIEventListAdd(addrList, 1024, curPacket, startTime+factor*4.0, currentWords, words);
    printf("Number of MIDIEventPackets is %d\n", addrList->numPackets);
    /*
     * Now that the MIDIEventList has been built, try to read it.
     */
    curPacket= &addrList->packet[0];
    printf("Number of MIDIEventPackets is %d\n", addrList->numPackets);
    
    for (int i=1; i<=addrList->numPackets; i++)  {
        printf("Reading packet %d\n",i);
        printf("     There are %d words in the packet", curPacket->wordCount);
        printf("     Timestamp is %llx \n ", curPacket->timeStamp);
        printf("The words are:\n");
        for (int j = 0; j < curPacket->wordCount; j++) {
            UInt32 message = curPacket->words[j];
          
            UInt16 first = message / 65536;
            UInt16 second = message % 65536;
            UInt8 type = first /4096;
            UInt8 group = (first / 256) % 16;
            UInt8 status = (first / 16) % 16;
            UInt8 channel = first % 16;
            
            UInt8 data1 = (second / 256) % 128;
            UInt8 data2 = second % 128;
            printf("     %x type:%d  group:%d  status:%d  channel:%d\n", message, type, group, status, channel);
            printf("           data1:%d   data2:%d\n", data1, data2);
        }
        printf("\n");
        curPacket = MIDIEventPacketNext(curPacket);
    }
}
    double ticksPerSecond() {
        struct mach_timebase_info info;
        /*
         * Denominator for conversion multiplier
         */
        uint32_t denom;
        /*
         *  Numerator for conversion multiplier
         */
        uint32_t numer;
        
        kern_return_t kern_result = mach_timebase_info(&info);
        if (kern_result == KERN_SUCCESS) {
            numer = info.numer;
            denom = info.denom;
            // NSLog(@"Mach time conversion numerator: %d denominator: %d \n",numer, denom );
            /*
            NSString *message = [[NSString alloc]initWithFormat:@"Mach time conversion numerator: %d denominator: %d \n",numer, denom ];
            if (textWindow != NULL) {
                [textWindow appendString:message];
            } else {
                NSLog(@"%@", message);
            }
            */
        } else {
            printf ("Error reading mach_timebase_info structure\n");
            numer = 1;
            denom = 1;
        }
        double factor = (double)denom /(double)numer*1.0E9;
        return factor;
    }
    
    
    


