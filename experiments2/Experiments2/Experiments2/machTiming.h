//
//  machTiming.h
//  Experiments2
//
//  Created by Bradley Ross on 8/24/22.
//
/**
 *  \file machTiming.h
 *  @brief tests for mach_absolute_time
 */
#ifndef machTiming_h
#define machTiming_h
#import <stdio.h>
#import <time.h>
/**
  * @brief A class for demonstrating calculation of elapsed time.
  *
  * This is item 5 in the original menu.
 
 */
@interface MachTiming:NSObject {
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
    UInt64 firstTime;
    
}
 /**
  *   Initializes class.
  */
- (instancetype) init;
/**
  * Calculates time since object was initialized.
 * Prints message containing elapsed time.
 */
- (void) showTime;
/**
 * @ brief Returns time since class initialized.
 *
 * @return time in seconds
 */
- (double) getTime;
/*
 * Return mach_absolute_time of when object initialized.
 *
 * @return initialization time as mach_absolute_time
 */
- (UInt64) getInitTime;
/**
 * @brief First test for functioning of methods in class.
 */
- (void) test1;
/**
 *  @brief Return the mach_absolute_time that is offset from time initialization by a
 *  specified number of seconds.
 *
 *  @param offset length of offset in seconds (can be positive or negative).
 *
 *  @return mach_absolute_time_value;
 */
- (UInt64) getOffsetTime:(double)offset;
@end
#endif /* machTiming_h */
