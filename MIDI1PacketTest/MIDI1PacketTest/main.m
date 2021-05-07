//
//  main.m
//  MIDI1PacketTest
//
//  Created by Bradley Ross on 4/15/21.
//

#import <Foundation/Foundation.h>
#import <CoreMIDI/CoreMIDI.h>
#import "main.h"

#define PACKETLIST_SIZE 1024

MIDIPacketList *packetList;
struct mach_timebase_info info;
uint64_t offset;
uint32_t denom;
uint32_t numer;
MIDIPacket *currentPacket;
Byte buffer[1000];
// static uint32 bufferLength = 995;
/**
 @brief An experiment with CoreMIDI
 This note dates to 2013 and describes how to initialize MIDIPacketList
 and add MIDIPacket items to the list.
 
 @see https://stackoverflow.com/questions/15923236/proper-use-of-midipacketlistadd-coremidi
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int result;
        offset = mach_absolute_time();
        // insert code here...
        if (packetList) {
               free(packetList);
               packetList = NULL;
           }

           packetList = (MIDIPacketList *)malloc(PACKETLIST_SIZE * sizeof(char));
           currentPacket = MIDIPacketListInit(packetList);
        kern_return_t kern_result = mach_timebase_info(&info);

        if (kern_result == KERN_SUCCESS) {
            numer = info.numer;
            denom = info.denom;
        printf("Mach time conversion numerator: %d denominator: %d\n",numer, denom );
            
        } else {
            numer = 1;
            denom = 1;
        }
        result = addNoteOn(0.5, 0, 60, 60);
        if (result == 0) {
            printf("Failure for addNoteOn");
            return 1;
        }
        result = addNoteOff(1.0, 0, 60, 0);
        if (result == 0) {
            printf("Failure for addNoteOff");
            return 1;
        }
        result = addNoteOn(1.5, 0, 72, 60);
        if (result == 0) {
            printf("Failure for addNoteOn");
            return 1;
        }
        result = addNoteOff(2.0, 0, 72, 0);
        if (result == 0) {
            printf("Failure for addNoteOff");
            return 1;
        }
        readPacketList(packetList);
    }

    return 0;
}
void clearPacketList() {
    packetList->numPackets = 0;
    currentPacket = MIDIPacketListInit(packetList);
}

int addNoteOn(float time, int channel, int pitch, int velocity) {
    Byte data3[50];
    data3[0] = 9*16 + channel;
    data3[1] = pitch;
    data3[2] = velocity;
    currentPacket = MIDIPacketListAdd(packetList,PACKETLIST_SIZE, currentPacket, (MIDITimeStamp)getTicks(time) + offset, 3, (unsigned char *)data3);
    if (currentPacket == 0) {
        return 0;
    } else {
        return 1;
    }
}

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

int addNoteOff(float time, int channel, int pitch, int velocity) {
    Byte data2[50];
    data2[0] = 8*16 + channel;
    data2[1] = pitch;
    data2[2] = velocity;
    currentPacket = MIDIPacketListAdd(packetList,PACKETLIST_SIZE, currentPacket, (MIDITimeStamp)getTicks(time) + offset, 3, (unsigned char *)data2);
    if (currentPacket == 0) {
        return 0;
    } else {
        return 1;
    }

}
/*
 @brief Converts mach_absolute_time ticks to seconds
 @param ticks time duration in mach_absolute_time ticks
 @return time duration in seconds
 
 uint64_t multiplied = packet->timeStamp * numer / denom;
 printf(" %llx %lld MIDITimeStamp nanoseconds\n", multiplied, multiplied);
 double seconds = (double)multiplied / 1.0e9;
 printf(" %f  MIDITimeStamp seconds\n",
       seconds);
 */

float getSeconds(UInt64 ticks) {
    return ticks / 1.0e9 * numer / denom;
}
/**
 @brief Converts time in seconds to mach_absolute_time ticks
 @param seconds time duration in seconds
 @return tiime duration in mach_absolute_time ticks
 */
MIDITimeStamp getTicks(float seconds) {
    return (MIDITimeStamp)(seconds * (float)denom / (float)numer * 1.0e9);
}
void readPacketList(MIDIPacketList *pktList) {
    UInt16 nBytes;
    // NSLog(@"First time: %llx   ", firstTime);
    const MIDIPacket *packet = &pktList->packet[0];
    unsigned int numPackets = (unsigned int) pktList->numPackets;
    printf(" packets in list: %d\n", numPackets);
    // start b
    for ( int i = 0; i < numPackets; i++) {
        printf("\nExamining packet %d\n", i+1);
        Byte data[256];
        nBytes = packet->length;
        int i2;
        for (i2=0; i2<nBytes; i2++) {
        data[i2] = packet->data[i2];
        }
        
        // uint64 difference = packet->timeStamp - firstTime;
        // NSLog(@" %llx %lld MIDITimeStamp", difference, difference);
        uint64_t multiplied = (packet->timeStamp - offset) * numer / denom;
        printf(" %llx %lld MIDITimeStamp nanoseconds\n", multiplied, multiplied);
        double seconds = (double)multiplied / 1.0e9;
        printf(" %4.2f  MIDITimeStamp seconds\n",
              seconds);
        // describeNote(data, nBytes, localWindow);
        
        printf("There are %d data bytes in packet\n", nBytes);
        unsigned int firstByte = (unsigned int)data[0];
        // printf("First data byte is %x\n", firstByte);
        // printf("Second data byte is %x\n", data[1]);
        unsigned int channel = firstByte % 16;
        unsigned int command = firstByte / 16;
        // NSString *desc;
        // start a
        if (command == 9) {
            /* second byte is pitch, third byte is velocity  */
            printf(" NOTE ON  ch:%d p:%d v:%d \n", channel, (unsigned int)data[1], (unsigned int)data[2]);
        } else if (command == 8) {
            printf("NOTE OFF  ch %d p %d  v %d \n", channel, (unsigned int)data[1], (unsigned int)data[2]);
        } else if (command == 24) {
            /* second byte indicates instrument */
            printf("PROGRAM CHANGE ch %d inst %d  \n", channel, (unsigned int)data[1]);
        } else {
            printf(" command %d  ??? channel %d   \n", command, channel);
        }
        // end a
        /*  Move the pointer for the MIDIPacket to the next location */
        packet = MIDIPacketNext(packet);
    }
    // end b
}
void sendPacketList(MIDIPacketList *pktList) {
    
}
