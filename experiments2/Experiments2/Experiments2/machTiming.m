//
//  machTiming.m
//  Experiments2
//
//  Created by Bradley Ross on 8/24/22.
//
/**
 *  \file machTiming.m
 */
#import <Foundation/Foundation.h>
#import "machTiming.h"
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
@implementation MachTiming
 typedef struct mach_timebase_info       *mach_timebase_info_t;
 typedef struct mach_timebase_info       mach_timebase_info_data_t;
 
 */
@implementation MachTiming 

- (void) showTime {
    printf("Showing time \n");
    UInt64 currentTime = mach_absolute_time();
    double elapsedTime = ((double) numer / (double) denom) * (double) (currentTime - firstTime) / 1.0E9;
    printf("Elapsed time:  %f   seconds\n", elapsedTime);
}
- (double) getTime {
    UInt64 currentTime = mach_absolute_time();
    double elapsedTime = ((double) numer / (double) denom) * (double) (currentTime - firstTime) / 1.0E9;
    return elapsedTime;
}
- (UInt64) getOffsetTime:(double)offset {
    return firstTime + (offset*(double)denom /(double)numer*1.0E9);
}
- (UInt64) getInitTime {
    return firstTime;
}
- (void) test1{
   // MachTiming *timer = [[MachTiming alloc] init];
}
- (instancetype) init {
kern_return_t kern_result = mach_timebase_info(&info);
    // printf("Test of MachTiming init\n");
    firstTime =  mach_absolute_time();
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
// UInt64 firstTime = mach_absolute_time();
    printf("numerator: %d,  denominator: %d \n", numer, denom);
    printf ("%llx time\n", firstTime);
    return self;
}
@end
