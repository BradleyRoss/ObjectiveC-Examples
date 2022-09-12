//
//  main.m
//  Experiments2
//
//  Created by Bradley Ross on 8/19/22.
//
/**
 *    \file main.m
 *    Experiments for CoreMIDI.
 *
 *  [CoreMIDI documentation](https://developer.apple.com/documentation/coremidi?language=objc)
 *  [MIDI1UPNoteOn](https://developer.apple.com/documentation/coremidi/3667330-midi1upnoteon?language=objc)
 *    Order of parameters (group, channel, note, velocity)
 *    [MIDI article 1](https://people.carleton.edu/~jellinge/m208w14/pdf/02MIDIBasics_doc.pdf)
 *
 *   The functions such as MIDI1UPNoteOff, MIDI1UPNoteOn, MIDI1UPControlChange, MIDI11UPPitchBlend, etc. are actually CF_INLINE mscros defined in
 *       CoreMIDIMessages.h
 *      Look for MIDI 1.0 Universal MIDI Pscket (MIDI-1UP) Channel Voice Message generalized structure
 *
 *   MIDI1UPControlChange (UInt8 group, UInt8 channel, UInt8 index, UInt8 data)
 *      MIDI1UPChannelVoiceMessage (Uint8 group, UInt8 status, UInt8 channel, UInt8 data1, UInt8 data2)
 *      NSString
 */
/*
 *
 */
#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>
#import <CoreMIDI/CoreMIDI.h>
#include <stdio.h>
#include <string.h>
#include "machTiming.h"
#include "sourceListener.h"
#include "BRossToolsMIDIUP.h"
#include "configuration.h"

void break32(MIDIMessage_32);
/**
 * @brief Runs one of a number of cases.
 * @param option  Number of case to be run.
 */
void runCase (UInt option);
sourceListener *listener;
// UInt option;
int main(int argc, const char * argv[]) {

    UInt option;

    @autoreleasepool {
        // insert code here..

        for (UInt8 i = 0; i<= 10; i++) {
            printf("*****  *****  *****\n");
            printf("\n Options\n\n");
            printf("1   Compare MIDI1UPNoteOff and MIDI1UPChannelVoiceMessage\n");
            printf("2   MIDI1UPNoteOn and MIDI1UPNoteOff\n");
            printf("3   Program Change using MIDI1UPChannelVoiceMessage\n");
            printf("4   List sources and destinations\n");
            printf("5   MachTiming\n");
            printf("6   Listen for MIDI source\n");
            printf("7   Stop listening for MIDI source\n");
            printf("8   Test for building MIDIEventList\n");
            printf("9   Show MIDI Configuration\n");
            printf("99  Exit program\n");
            printf(" Status Code is  9 for Note On, 8 for Note Off is 8 \n");
            printf("%s", "Enter value for  option, then hit Return/Enter key: ");
            scanf("%ud",&option);
            printf("\n Using option %d \n", option);

            printf("\n*****  *****  *****\n\n");
            if (option > 9 || option == 0) {
                return 0;
            }
            
        runCase(option);
        }
        return 0;
    }
}
        void runCase(UInt option) {
            MIDIMessage_32 testMessage;
        if (option == 1) {
            printf(" *****  Compare the next two calls\n");
            printf("Call using MIDI1UPNoteOff\n");
            printf("MIDI1UPNoteOff   group 0, channel 2, note x36, velocity x4A\n");
            testMessage = MIDI1UPNoteOff(0, 2, 0x36,0x4A);
            break32(testMessage);
            /*
             *  Status byte is 0x82, but it appears that the status parameter is just the first hexadecimal digit or 08
             *  MIDI1UPChannelVoiceMessage(UInt8 group, UInt8 status, UInt8 channel, UInt8 data1, UInt8 data 2)
             */
            printf("Call using MIDI1UPChannelVoiceMessage\n");
            printf("MIDI1UPChannelVoiceMessage, 0, 0x8, 2, 0x36, 0x4a \n");
            testMessage = MIDI1UPChannelVoiceMessage(0, 0x8, 2, 0x36, 0x4a);
            break32(testMessage);
            printf("***** End of comparison\n");
        }
        if (option == 2) {
            printf("2   MIDINoteOn and MIDI1 NoteOff\n");
            printf("MIDI1UPNoteOff   group 1, channel 2, note x36, velocity x4A\n");
            testMessage = MIDI1UPNoteOff(1, 2, 0x36,0x4A);
            break32(testMessage);
            printf("MIDI1UPNoteOn   group 0, channel 2, note x36, velocity x4A\n");
            testMessage = MIDI1UPNoteOn(0, 2, 0x36,0x4A);
            break32(testMessage);
            printf("MIDI1UPNoteOn   group 1, channel 2, note x36, velocity x4A\n");
            testMessage = MIDI1UPNoteOn(1, 2, 0x36,0x4A);
            break32(testMessage);
            printf("MIDI1UPNoteOn   group 1, channel 3, note x36, velocity x4A\n");
            testMessage = MIDI1UPNoteOn(1, 3, 0x36,0x4A);
            break32(testMessage);
            printf("MIDI1UPNoteOn   group 1, channel 3, note x36, velocity x4A\n");
            testMessage = MIDI1UPNoteOn(1, 3, 0x36,0x4A);
            break32(testMessage);
        }
        /*
         * Channel 2 program change  - status byte is C channel is 1
         * Change to instrument 0x36
         */
        if (option == 3) {
            printf("3   Program Change using MIDI1UPChannelVoiceMessage\n");
        printf("MIDI1UPChannelVoiceMessage group 0, status 0xC, channel 2, data 1 (patch) 0x36\n");
        testMessage = MIDI1UPChannelVoiceMessage(0, 0xC, 2, 0x36, 0x0);
        break32(testMessage);
        }
        if (option ==4) {
            printf("4  Show sources and destinations\n");
            UInt8 numSources = MIDIGetNumberOfSources();
            printf("Number of sources = %d \n", numSources);
            CFStringRef name = nil;
            // https://stackoverflow.com/questions/9166291/converting-a-cfstringref-to-char
            /*
             * I can convert CFStringRef to NSString by using NSString with the methods
             * alloc and initWithFormat
             *
             * NSString can be converted to a C string by using the NSString instance method
             *    cStringUsingEncoding with the parameter NSUTF8StringEncoding
             *
             * Converting between CFStringRef and C strings apparently requires bridges or allocation
             * of memory.
             */
            if (numSources > 0) {
                for (UInt i1 = 0; i1 < numSources; i1++) {
                    MIDIEndpointRef endPoint = MIDIGetSource(i1);
                    if (noErr != MIDIObjectGetStringProperty(endPoint, kMIDIPropertyDisplayName, &name)) {
                        printf("%d  Unable to read string", i1) ;
                    } else {
                        NSString *temp = [[NSString alloc] initWithFormat:@"%@", name];
                        printf("%d       %s\n",  i1, [temp cStringUsingEncoding:NSUTF8StringEncoding]);
                        }
                }
            } else {
                printf("**** There are no sources\n");
            }
            UInt8 numDest = MIDIGetNumberOfDestinations();
            printf("Number of destinations = %d  \n", numDest);
            if (numDest > 0) {
                for (UInt i2 = 0; i2 < numDest; i2++) {
                    MIDIEndpointRef endPoint = MIDIGetDestination(i2);
                    if (noErr != MIDIObjectGetStringProperty(endPoint, kMIDIPropertyDisplayName, &name)) {
                        printf("%d  Unable to read string", i2) ;
                    } else {
                        NSString *temp = [[NSString alloc] initWithFormat:@"%@", name];
                        printf("%d       %s\n",  i2, [temp cStringUsingEncoding:NSUTF8StringEncoding]);
                        }
                }
            } else {
                printf ("**** There are no destinations\n");
            }
        } else if (option == 5) {
            /*
             *  https://stackoverflow.com/questions/35103745/read-a-string-as-an-input-using-scanf
             */
            // int itemCount;
            // int option2;
            printf("5   MachTiming\n");
            // char  stack[30];
            int tempChar;
            MachTiming *timer = [[MachTiming alloc] init];
            // printf ("Started\n");
            printf("Strike lower case q key followed by enter/return key to quit loop\n");
            printf("Strike any other key to get another time\n");
            while (true) {
                // scanf("%d", &option2);
                /*
                 *  Must execute fflush before fgets and getchar
                 */
                fflush(stdin);
                tempChar = getchar();
                printf("Character entered was %d %c\n", tempChar, tempChar);
                // fgets(stack, 9, stdin);
                // printf("Remaining string is %s\n", stack);
           
                if (tempChar == 'q') {break;};
                // itemCount = scanf("%[^\n]s", &stack);
                // printf("%d\n", itemCount);
            
                [timer showTime];
                printf("*** ***\n");
            }
        } else if (option == 6) {
            printf("6 Listen for MIDI source\n");
            listener = [[sourceListener alloc] initAndStart];
            
            
        } else if (option == 7) {
            [listener stopListener];
        } else if (option == 8) {
            // MIDIEventList eventList;
            buildMIDIEventList();
        } else if (option == 9) {
            printf("9   Show MIDI Configuration\n");
            showConfiguration();
        } else {
            printf("Unknown option\n");
        }
    }

    

void break32(MIDIMessage_32 value) {
    MIDIUniversalMessage *header;
    header = (MIDIUniversalMessage *) &value;
    // NSLog(@"    testMessage %0x", value);
    printf("%s\n", [[NSString stringWithFormat:@"    testMessage %0x", value] cStringUsingEncoding:NSUTF8StringEncoding]);
    printf("%s\n", [[NSString stringWithFormat:@"    group %x, type %x    ", header->group, header->type]  cStringUsingEncoding:NSUTF8StringEncoding ]);
}

