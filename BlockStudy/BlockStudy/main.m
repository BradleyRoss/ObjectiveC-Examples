//
//  main.m
//  BlockStudy
//
//  Created by Bradley Ross on 3/27/21.
//

#import <Foundation/Foundation.h>
#import <CoreMIDI/CoreMIDI.h>
#import "stdio.h"
#import "string.h"
#import "stdarg.h"
/*
 ObjectiveC-Blocks
 This is an attempt to understand Objective-C Blocks
 
 [Blocks Programming Topics](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Blocks/Articles/00_Introduction.html#//apple_ref/doc/uid/TP40007502-CH1-SW1)
 
 The following is the declaration for the MIDIReceiveBlock
 
 typedef void (^MIDIReceiveBlock)(const MIDIEventList *evtList, void *srcConnRefCon);
 
 The following is the declaration for the MIDINotifyBlock
 
 typedef void (^MIDINotifyBlock)(const MIDINotification *message);
 */

/**
 @brief copy of oneFrom
 
 The block is copied by copying the entire struct that contains the block.  This
 means that the values stored in the block are the ones that existed the original
 block was first created.
 */
float (^oneFromCopy)(float);
void nextFunction(void);
int (^myBlockCopy)(int);

void testArguments(int count, ...);
typedef void (^MIDIReceiveBlock)(const MIDIEventList *evtList, void *srcConnRefCon);
typedef void (^MIDINotifyBlock)(const MIDINotification *message);
// void *blockAddress1;
// void *blockAddress2;
void testing(void);
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        printf("Start of program\n");
        testing();
        NSLog(@"Start of samples for blocks/closures");
        int dummy1 = 5;
        int dummy2 = 9999;
        float (^oneFrom)(float) = ^(float aFloat) {
            printf("start of oneFrom \n");
            float result  = aFloat - 1.0;
            printf("oneFrom dummy values %d  %d \n",
                   dummy1, dummy2);
            printf("end of oneFrom \n");
            return result;
        };
        /*
         The block is stored as a struct.  Using an assignment statement as
         in the next line copies the entire struct.
         */
        oneFromCopy = oneFrom;
        
        // blockAddress1 = &oneFrom;
      
        int multiplier = 7;

        int (^myBlock)(int) = ^(int num) { return num * multiplier; };
        myBlockCopy = myBlock;
       //  blockAddress2 = &myBlock;
        printf(" ***** ***** ***** \n");
        printf ("%d    myBlock(3) \n", myBlock(3));
        printf(" ***** ***** ***** \n");
        printf("%.3f   onefrom(4.0) \n", oneFrom(4.0));
        printf(" ***** ***** ***** \n");
        printf(" multiplier for myBlock changed to 15 \n");
        printf(" dummy values changed to 24, 25  \n");
        multiplier = 15;
        dummy1 = 24;
        dummy2 = 25;
        printf(" ***** ***** ***** \n");
        printf("%d  myBlock(3) \n", myBlock(3));
        printf(" ***** ***** ***** \n");
        printf("%.3f  oneFrom(6.5) \n", oneFrom(6.5));
        printf(" ***** ***** ***** \n");
        nextFunction();
        };
    printf(" ***** ***** ***** \n");
    return 0;
}
/*
 CFStringCreateWithFormat
 */
    void testing() {

        /*
         CFStringRef CFStringCreateByCombiningStrings(CFAllocator alloc, CFArrayRef theArray, CFSTRingRef separatorString);
         CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks);
         use &kCFTypeArrayCallBacks for *callBacks
         
         
         CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
         */
       // CFStringRef CFStringCreateByCombiningStrings(kCFAllocatorDefault)
     
   
        CFStringRef l1 = CFSTR("first line\n");
        CFStringRef l2 = CFSTR("second line\n");
        CFStringRef l3 = CFSTR("third line\n");
        CFStringRef args[3] = {l1, l2, l3};
        CFArrayRef array = CFArrayCreate(kCFAllocatorDefault, (const void**)args, 3, &kCFTypeArrayCallBacks);
        
        CFStringRef combined =CFStringCreateByCombiningStrings(kCFAllocatorDefault, array, CFSTR(" "));
        // Boolean result;
        char buffer[512];
    
        NSLog(@"%@", combined);

        Boolean result = CFStringGetCString(combined, buffer, 512, kCFStringEncodingUTF8);
        printf("Did creation of C String succeed %d \n", result);
        printf("1 for true, 0 for false\n");
        printf("\n %s \n", buffer);
    return;
}
void nextFunction() {
    printf("\n\nStarting nextFunction \n");
    int multiplier2 = 20;
    // int multiplier =5;
    /*
     The error message below is generated if I try running the oneFrom block here
     Thread 1: EXC_BAD_ACCESS (code=1, address=0x10)
     */
     printf(" ***** ***** ***** \n");
     printf("  %.3f   oneFromCopy(4.0) \n", oneFromCopy(4.0));
    printf(" ***** ***** ***** \n");
    printf(" ***** ***** *****\n");
     printf("  %.3f   oneFromCopy(3.0) \n", oneFromCopy(3.0));
    printf(" ***** ***** ***** \n");
    printf(" ***** ***** *****\n");
     printf("  %d   myBlockCopy(3) \n", myBlockCopy(3));
    printf(" ***** ***** ***** \n");
    testArguments(4, 2., 3.45, 8.12345, 77.9876);
    printf(" ***** ***** ***** \n");
    // printf("%d \n", *address(10));
}
/**
  It appears that when dealing with something like appendWithFormat, the first
    step would be to parse the format statement in the beginning to get the
        number of arguments and the type of each argument.
 */
void testArguments(int count, ...) {
    int i;
    double val;
    printf("%d is first argument and count of remaining arguments \n", count);
    va_list v1;
    /*
     The second argument for va_start would be the number of remaining
     arguments, which may not be the first argument.  va_list and
     va_start are macros.  v1 is the structure used for analyzing the
     varadiac (varying length) parameter lists.
     */
    va_start(v1, count);
    for (i=0; i<count; i++) {
        /*
         va_arg is another macro and the second argument is the
         type of value to be read.
         */
        val = va_arg(v1,double);
        printf("%.2f  \n", val);
    }
    /*
     va_end is the macro ending the processing of the list.
     */
    va_end(v1);
}

