//
//  LocalClasses.h
//  BRossTools
//
//  Created by Bradley Ross on 2/1/21.
//

#ifndef LocalClasses_h
#define LocalClasses_h
#import "BRossTools.h"


@interface test1 : NSObject
/**
 Runs a snippet of code that creates an array of NSString objects and then sends it to the log.
 
 https://stackoverflow.com/questions/39907988/how-to-make-an-array-of-nsstrings
 */
+ (void)runtest;
@end
/**
   Test case for reusable panel for handling text.
 */
@interface test2 : NSObject
/**
 Runs a test case for a new panel that can be used to
 process text.
 */
+ (void)runtest;
@end
/**
   Test case for some operations with arrays.
 */
@interface test3 : NSObject
/**
   Runs a test case involving creating an array with multiple
      text strings.
 */
+ (void) runtest;
@end
/**
     Place a menu on the main window of the application
          to select running of other programs.
 */
@interface mainMenu : BRossToolsSimpleGridMenu


+ (void)createMainMenuForWindow:(NSWindow *)aWindow;

@end
#endif /* LocalClasses_h */
