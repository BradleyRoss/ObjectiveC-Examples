//
//  CoreMIDIsamples.h
//  BRossTools
//
//  Created by Bradley Ross on 3/18/21.
//

#ifndef CoreMIDIsamples_h
#define CoreMIDIsamples_h
#import <CoreMIDI/CoreMIDI.h>
#import "BRossTools.h"
@interface TextWindow:BRossToolsTextWindow
+  (BRossToolsTextWindow *) textWindow;
+  (BRossToolsTextWindow *) getTextWindow;
+  (void) setTextWindow:(BRossToolsTextWindow *) window;
@end;

/**
 *  * [CoreMIDI and Friends]( https://www.slideshare.net/invalidname/core-midi-and-friends )
 
 *  * [Yet Another Learn Cocoa With Me Blog]( http://comelearncocoawithme.blogspot.com/2011/08/reading-from-external-controllers-with.html )
 
 *  *  [zoul/OSStatus.m]( https://gist.github.com/zoul/633827)
 *  * [SecCopyErrorMessageString]( https://developer.apple.com/documentation/security/1394686-seccopyerrormessagestring?language=objc  )
 *  * [Setting up to receive MIDI ] ( http://lists.apple.com/archives/coreaudio-api/2003/Dec/msg00247.html )
*
 
 */
@interface CoreMidi2:NSObject
+ (void) runtest;
@end
/**
 
 
 */
@interface CoreMidi3:NSObject;
+ (void) runtest;
@end



#endif /* CoreMIDIsamples_h */
