//
//  LocalClasses.m
//  BRossTools
//
//  Created by Bradley Ross on 2/1/21.
//

/**
 \file LocalClasses.m
 @brief implementation file LocalClasses.
 Implementation code for LocalClasses.
 */
#import <Foundation/Foundation.h>
#import "BRossTools.h"
#import "LocalClasses.h"
// import "MIKMIDIsamples.h"
#import "BRossToolsSynthesizer.h"


//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

/**
  * Creates the main menu for display on the first window.
 <table>
 <tr><th>code</th> <th> Caption<br />Action</th><th>ObjectiveC Method </th></tr>
 <tr><td>temp</td><td>Placeholder for temporary code</td><td>[tempTest runtest]</td></tr>
 <tr><td> m3 </td><td>Listen for keystrokes using CoreMIDI<br />
    listener  = [BRossToolsMIDIListenForInput alloc]<br />
    [listener runtestWithWindow:window]</td>
    <td> [BRossToolsMIDIListenForinput runTestWithWindow] </td></tr>
 <tr><td>m3a</td><td>Send keystrokes to virtual synthesizer</td>
        <td>[BRossToolsMIDIListenForInput initWithsynthesizer]</td></tr>
 <tr><td>m4</td>  <td>Kill CoreMIDI Client (Ver 2)<br />
    m3 is run first<br />
    [listener killClient]</td><td> [BRossToolsMIDIListenForInput killClient]   </td></tr>
 
 <tr><td>m1a</td><td>Select and play MIDI song</td>
        <td></td></tr>
 <tr><td>m5 </td><td>Read a dummy MIDIPacketList </td><td> [TestReadDummy runtest]
    </td></tr>
 <tr><td>m6</td><td>Send a dummy MIDIPacketList</td>
       <td>[[TestSendDummy alloc] runtestWithWindow:sendWindow]</td></tr>
 <tr><td>b5</td><td>CoreMIDI - Show Configuration </td><td>[CoreMidiSample1 runTest]</td></tr>
 <tr><td>b6 </td><td>CoreMIDI - Show sources/destinations</td><td>[CoreMidiSample1 runTest2]</td></tr>
 <tr><td>b1</td><td>Opens a window, colors, text fields, buttons</td> <td>[e2 runtest]</td></tr>
 <tr><td>b2</td><td>new window plus fields </td><td>[test1 runtest]</td></tr>
 <tr><td>b3</td><td>Text handling window BRossToolsTextWindow</td><td>[test2 runtest]</td></tr>
 <tr><td>b4</td><td>test3</td><td>[test3 runtest]</td></tr>
 <tr><td>b7</td><td>run test5 - CFDictionary, CFArray, etc. </td><td>[test5 runtest]</td></tr>
 <tr><td>b8</td><td>run test4 - Playing with pointers</td><td>[test4 runtest]</td></tr>
  </table>
 
 * listener is an instance of BRossToolsMIDIListenForInput2
 * The method [mainMenu menu] creates the menu
 */
@implementation mainMenu
static BRossToolsTextWindow *window;
static BRossToolsMIDIListenForInput *listener;
static BRossToolsMIDIListenForInputUMP *listenerUMP;
+ (void)bleep:(id)sender {

    NSString *message = [sender getIdent];
        if (message == nil){
            NSLog(@"No identifier provided");
        }else {
            NSLog(@"bleep method entered: message is %@", message);
            if ([message isEqualToString:@"b1"]) {
                [e2 runtest];
                return;
            }
            if ([message isEqualToString:@"b2"]) {
                [test1 runtest];
                return;
            }
            if ([message isEqualToString:@"b3"]) {
                [test2 runtest];
                return;
            }
            if ([message isEqualToString:@"b4"]) {
                [test3 runtest];
                return;
            }
            if ([message isEqualToString:@"b5"]) {
                [CoreMidiSample1 runtest];
            } else if ([message isEqualToString:@"b6"]) {
                [CoreMidiSample1 runtest2];
            } else if ([message isEqualToString:@"b7"]) {
                [test5 runtest];
            } else if ([message isEqualToString:@"b8"]) {
                [test4 runtest];
            } else if ([message isEqualToString:@"m1a"]) {
                PlayMIDIFile *midiTest = [[PlayMIDIFile alloc] init];
                [midiTest pickMIDIFileAndPlay];
            } else if ([message isEqualToString:@"m3"]){
                window = [BRossToolsTextWindow newWindow];
                window.title=@"Listen for notes";
                 listenerUMP = [BRossToolsMIDIListenForInputUMP alloc];
                  [listenerUMP    runtestWithWindow:window];
            } else if ([message isEqualToString:@"m4"]) {
                [listenerUMP killClient];
            } else if ([message isEqualToString:@"m3ump"]){
                window = [BRossToolsTextWindow newWindow];
                window.title=@"Listen for notes  UMP";
                 listenerUMP = [BRossToolsMIDIListenForInputUMP alloc];
                  [listenerUMP    runtestWithWindow:window];
            } else if ([message isEqualToString:@"m4ump"]) {
                [listenerUMP killClient];
            } else if ([message isEqualToString:@"m5"]) {
                [[TestReadDummy alloc] runtest];
            } else if ([message isEqualToString:@"m6"]) {
                BRossToolsTextWindow *sendWindow = [BRossToolsTextWindow newWindow];
                [[TestSendDummy alloc] runtestWithWindow:sendWindow];
            } else if ([message isEqualToString:@"temp"]) {
                [tempTest runtest:5];
            } else {
                NSLog(@"invalid code");
            }
        }
}
/**
   Builds view containing main menu.
 
     @returns pointer to NSStackView object.
 https://stackoverflow.com/questions/36020540/why-is-instancetype-used
 */
+ (NSView *) menu {
    // NSStackView *stackView = [NSStackView alloc]
    BRossToolsButton *temp = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"Temporary place holder for tests"
            ident:@"temp" ];
    BRossToolsButton *b1 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@" e2 test - opens a window, colors it, and inserts a few text fields and buttons" ident:@"b1" ];
    BRossToolsButton *b2 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"run test1 new window plus fields" ident:@"b2" ];
    BRossToolsButton *b3 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"run test2 text handling window" ident:@"b3" ];

    BRossToolsButton *b4 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"run test3" ident:@"b4" ];
    
    BRossToolsButton *b5 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"CoreMIDI - Show configuration" ident:@"b5" ];
    
    BRossToolsButton *b6 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"CoreMIDI - Show sources/destinations" ident:@"b6" ];
    
    BRossToolsButton *b7 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"run test5 - CFDictionary, CFArray, etc." ident:@"b7" ];
    
    BRossToolsButton *b8 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"run test4 - Playing with pointers" ident:@"b8" ];
    

    BRossToolsButton *m1a = [BRossToolsButton initUsingObjectIdent:self
        selector:@selector(bleep:)
        caption:@"Select and play MIDI file"
        ident:@"m1a"];
    
 
    BRossToolsButton *m3 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:)
        caption:@"Start listening for keystrokes"
        ident:@"m3"];
    BRossToolsButton *m4 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:)
        caption:@"Stop listening to Keystrokes "
        ident:@"m4"];
    BRossToolsButton *m3UMP = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:)
        caption:@"Start listening for keystrokes UMP"
        ident:@"m3ump"];
    BRossToolsButton *m4UMP = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:)
        caption:@"Stop listening to Keystrokes UMP"
        ident:@"m4ump"];
    BRossToolsButton *m5 = [BRossToolsButton initUsingObjectIdent:self
        selector:@selector(bleep:)
        caption:@"Read a dummy MIDIPacketList"
        ident:@"m5"];
    BRossToolsButton *m6 = [BRossToolsButton initUsingObjectIdent:self
        selector:@selector(bleep:)
        caption:@"Send a dummy MIDIPacketList"
        ident:@"m6"];
    NSStackView *stackView = [NSStackView
        stackViewWithViews:@[ temp, m3, m4, m3UMP, m4UMP, m1a, m5, m6, b5, b6, b1, b2, b3, b4, b7, b8]];
    stackView.orientation = NSUserInterfaceLayoutOrientationVertical;
    return stackView;
}
@end

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

@implementation tempTest
+ (void) runtest {
    /*
    SequencerDemos *instance = [[SequencerDemos alloc] init];
    [instance debugTest];
     */
    /*
    [VirtualSynthesizer test1];
     */
    NSLog(@"PlayMIDIFile pickMIDIFileAndPlay");
     PlayMIDIFile *midiTest = [[PlayMIDIFile alloc] init];
     [midiTest pickMIDIFileAndPlay];
     

    
}
+ (void) runtest:(UInt16)testNumber {
    if (testNumber == 1) {
        NSLog(@"PlayMIDIFile test1");
        PlayMIDIFile *midiTest = [[PlayMIDIFile alloc] init];
        [midiTest test1];
        
    }else if (testNumber == 2) {
        NSLog(@"PlayMIDIFile test2");
        PlayMIDIFile *midiTest = [[PlayMIDIFile alloc] init];
        [midiTest test2];
    } else if (testNumber == 3) {
        NSLog(@"PlayMIDIFile pickMIDIFileAndPlay");
        PlayMIDIFile *midiTest = [[PlayMIDIFile alloc] init];
        [midiTest pickMIDIFileAndPlay];
    } else if (testNumber == 4 ) {
        NSLog(@"VirtualSynthesizer test1");
        VirtualSynthesizer *instance = [[VirtualSynthesizer alloc] init];
        [instance test1];
    } else if (testNumber == 5) {
        NSLog(@"Starting tempTest runTest:5");
        NSWindow *newPanel;
        CGPoint origin;
            CGRect rectangle;
            origin.x = 100.0;
            origin.y = 250.0;
            // Parameters are width followed by height
            NSSize newSize = NSMakeSize(500.0, 500.0);
            rectangle.origin = origin;
            rectangle.size = newSize;
            /*
                NSBorderlessWindowMask deprecated
                but appears in developer documentation
                for [NSWindow initWithContentRect:styleMask:backing:defer ]
             */
        NSWindowStyleMask style = NSWindowStyleMaskTitled + NSWindowStyleMaskClosable + NSWindowStyleMaskResizable + NSWindowStyleMaskMiniaturizable;
            newPanel = [[NSWindow alloc] initWithContentRect:rectangle
                    styleMask: style
                    backing:NSBackingStoreBuffered
                    defer:YES];
        [newPanel orderFront:self];
        NSView *topView;
        // NSView *demoView;
        topView = newPanel.contentView;
        /*
         Commented this out because I couldn't find an implementation
         section for BRossToolsSimpleGridMenu.
         */
        // [BRossToolsSimpleGridMenu createMainMenuForWindow:newPanel];
    }
    
}
@end
@implementation test1
/** Creates an array of three character strings and then displays them.
 */
+ (void)runtest {
    BRossToolsTextWindow *textWindow;
    textWindow = [BRossToolsTextWindow newWindow];
    textWindow.title=@"test1";
    NSMutableArray* stringArray = [NSMutableArray new];
    [stringArray addObject:@"aaa"];
    [stringArray addObject:@"This is bbb"];
    [stringArray addObject:@"ccc"];
    [textWindow appendString:@"\n"];
    NSUInteger count = stringArray.count;
    [textWindow appendString:@"\n This is the test1 test case"];
    [textWindow appendString:@"\n It creates three character strings, puts them in an"];
    [textWindow appendString:@"\n array, and then prints them"];
    [textWindow appendString:@"\n"];
    int i;
    for (i=0; i<count; i++) {
        [textWindow appendString:@"\n"];
        [textWindow appendString:@"   "];
        [textWindow appendString:stringArray[i]];
    }
    // NSString *expand = [NSString alloc];
   // [expand initWithFormat:@"\n%@\n" arguments:stringArray];
    // [textWindow appendString:stringArray];
    // NSLog(@"\n%@\n", stringArray);
   // [textWindow appendString:expand];
}
@end

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

@implementation test2
+ (void) runtest{
    BRossToolsTextWindow *textWindow;
    textWindow = [BRossToolsTextWindow newWindow];
    textWindow.title=@"test2";
    [textWindow appendString:@"\nAdded line\n"];
}
@end

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

@implementation test3
+ (void) runtest {
    // NSScreen *thisScreen = [NSScreen mainScreen];
    // NSRect r1 = thisScreen.frame;
    BRossToolsTextWindow *textWindow;
    textWindow = [BRossToolsTextWindow newWindow];
    textWindow.title=@"test3";
    NSString *c1 = @"first string";
    NSString *c2 = @"second string";
    NSString  *c3 = [[NSString alloc] initWithString:c1];
    NSString  *c4 = [[NSString alloc] initWithString:c2];
    // [c3 initWithString:c1];
    // [c4 initWithString:c2];
    NSString *t1 =[NSString stringWithFormat:@" %@   %@   %@   %@ \n", c1, c2, c3, c4];
   //  [textWindow appendFormat:@" %@   %@   %@   %@", c1, c2, c3, c4];
    [textWindow appendString:t1];
    
    c3 = c1;
    c1 = c2;
    // NSString *t1 = [NSString alloc];
    NSString *t2 =[NSString stringWithFormat:@" %@   %@   %@   %@ \n ", c1, c2, c3, c4];
    NSLog(@"%@", t2);
    //[textWindow appendFormat:@" %@   %@   %@   %@", c1, c2, c3, c4];
    [textWindow appendString:t2];
    
    
   }
@end

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

@implementation test4
+ (void) runtest {
    BRossToolsTextWindow *textWindow;
    textWindow = [BRossToolsTextWindow newWindow];
    textWindow.title=@"test4 immutable/mutable and void";
   // NSString  *actualArray[] = {@"first", @"second", @"third"};
    // void *ptr1 = &actualArray;
    
    // void **voidSample  = (void **) actualArray;
    // void *temp = @"first item";
    // void* ptr1 =  &temp;
    // NSString *temp2 =  ptr1;
    int x1 = 2;
    void *ptr2 = &x1;
    void *ptr3 = ptr2;
    int *x2 = (int *) ptr3;
    NSString * build = [[NSString alloc] initWithFormat:@"  %d  %d  %lu \n", x1, *x2, sizeof(ptr3)];
    [textWindow appendString:build];
    
}
@end

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

/**
 @brief Sample code for CFArray/CFDictionary parsing.
 There are better ways.
 */
@implementation test5
/*
 * Try using the context variable as a level counter.
 */

void applier(const void *key, const void *value, void *context);
static BRossToolsTextWindow *textWindowStorage5;
+ (void) setTextWindow:thisWindow {
    textWindowStorage5 = thisWindow;
    textWindowStorage5.title = @"MIDI Configuration";
}
+ (BRossToolsTextWindow *) textWindow{
    return textWindowStorage5;
}
/**
  *   @brief Sample code applied to nodes of CFDictuonary/CFType
  *    Goes through key/value pairs in a CFDictionary object;
  * @param key Key belonging to key/value pair.
  * @param value Value belonging to a key/value pair.  Type of parameter will
  *      a subtype of CFTypeRef.
  * @param context Context value for CFDictionary.  In this case, it is the
  *        nesting depth.
 */
void applier(const void *key, const void *value, void *context) {
    int *level = (int *) context;
    
    CFTypeID dictionaryType = CFDictionaryGetTypeID();
    CFTypeID arrayType = CFArrayGetTypeID();
    CFTypeID stringType = CFStringGetTypeID();
    CFTypeID numberType = CFNumberGetTypeID();
    NSString *working;
    working = [[NSString alloc] initWithFormat:@"Level %d  ", *level];
    [[test5 textWindow] appendString:working];
    /*
     CFDictionaryApplyFunction
     CFDictionaryApplierFunction
     */
    CFTypeID elementTypeID = CFGetTypeID(value);
    if (elementTypeID == numberType) {
        CFNumberRef element = (CFNumberRef) value;
        SInt32 numericValue;
        CFNumberGetValue(element,kCFNumberSInt32Type, &numericValue);
        // key and numericValue are the key/value pair
        // NSLog (@"%d", result);
        working = [[NSString alloc] initWithFormat:@" number type, key \"%@\", value %d \n", key, numericValue];
        [[test5 textWindow] appendString:working];
    } else if (elementTypeID == stringType) {
        working = [[NSString alloc] initWithFormat:@"string type, key \"%@\", value \"%@\" \n", key, value];
        [[test5 textWindow] appendString:working];
        // key and (CFStringRef)value are the key/value pair
    } else if (elementTypeID == dictionaryType) {
        //key is the value of the key and value is the reference to the dictionary
        working = [[NSString alloc]initWithFormat:@"Dictionary:  key is %@\n", key];
        [[test5 textWindow] appendString:working];
        // listDictionaryLevel(currentLevel+1,  values[position]);
    } else if (elementTypeID == arrayType) {
//key is the value of the key and value is the reference to the array
        
        // listDictionaryLevel(currentLevel+1,  values[position]);
    }
    
    /*
     * The code that I copied this from didn't dealloc the
     * allocated memory.  I therefore added the two
     * free statements in the code below
     * to prevent memory leaks.
     *
     * When I put the code in, the program failed.
     */
    // free(keysByLevel[currentLevel]);
    // free(valuesByLevel[currentLevel]);
}

+ (void) runtest {
    BRossToolsTextWindow * thisWindow = [BRossToolsTextWindow newWindow];
    [test5 setTextWindow:thisWindow];
    thisWindow.title = @"Dictionary/Array Demo";
    [[test5 textWindow] appendString:@"Starting test5\n"];
    NSString *string1 = [[NSString alloc] initWithFormat:@"abc123 %d", 5];
    NSArray *array1 = @[string1, @"Hello, World", @42];
    NSLog(@"%@", array1[0]);
    NSLog(@"%@", [array1 objectAtIndex:1]);
    NSLog(@"Item 2 - %@", [array1 objectAtIndex:2]);

    CFStringRef keys[10];
    keys[0] = CFSTR("first");
    keys[1] = CFSTR("second");
    
    
    CFTypeRef values[10];
    int tempInt = 5;
    CFNumberRef number = CFNumberCreate (
                                         kCFAllocatorDefault,
                                         kCFNumberSInt32Type,
                                         &tempInt);
    values[0] = number;
    values[1] = CFSTR("second value");
    // values[1] not set
    CFDictionaryRef firstDictionary = CFDictionaryCreate(kCFAllocatorDefault, (const void **) keys, (const void **) values, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    [[self textWindow] appendString:@"Dictionary has been built\n"];
    CFRelease(number);
    tempInt = 1;
    CFDictionaryApplyFunction(firstDictionary, applier, &tempInt);
    [thisWindow appendString:@"Starting second parse\n"];
    BRossToolsCFDictionaryArray *walker = [[BRossToolsCFDictionaryArray alloc] init];
    [walker setDestination:[test5 textWindow]];
    [walker showDictionaryContents:firstDictionary];
    return;
}
@end
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

@implementation e2
+ (void)runtest {
   // SEL bleep1 = sel_registerName("bleep:");
    //  NSView *thisObject = [[NSView alloc] init];
   /*
      NSScreen is screen being used
    */
    NSScreen *thisScreen = [NSScreen mainScreen];
    NSRect r1 = thisScreen.frame;
    [e2 logSizePositionOf:&r1 title:@"Frame of screen" ];
    NSRect windowFrame;
    windowFrame.size = NSMakeSize (thisScreen.frame.size.width/2.0, thisScreen.frame.size.height*0.5);
    windowFrame.origin = NSMakePoint ((CGFloat)0.0,(CGFloat) 0.0);
   //  windowFrame.origin = NSMakePoint(screenFrame.size.width*0.1, screenFrame.size.height*0.1);
    NSUInteger style = NSWindowStyleMaskTitled | NSWindowStyleMaskResizable;
    
    NSWindow *thisWindow = [[NSWindow alloc] initWithContentRect:windowFrame styleMask:style backing:NSBackingStoreBuffered defer:NO];
 /*  Make a window */
    [thisWindow setTitle:@"test e2"];
    [thisWindow setBackgroundColor:[NSColor greenColor]];
    [thisWindow makeKeyAndOrderFront:NSApp];
    NSRect r3 = thisWindow.frame;
    [e2 logSizePositionOf:&r3 title:@"Frame of new window"];
    NSRect r4 = thisWindow.contentView.frame;
    [e2 logSizePositionOf:&r4 title:@"Frame of contentView of new window"];
    NSRect r5 = thisWindow.contentView.bounds;
    [e2 logSizePositionOf:&r5 title:@"Bounds of contentView of new window"];
    /*  Build a text field */
    /*
     NSRect is a struct
     f1 is an object of type NSTextField
     frame is a property of f1 and is a struct
     bounds is a property of f1 and is a struct
     origin and size are components of the NSRect struct
     
     https://forums.macrumors.com/threads/create-button-programmatically.740537/
     https://stackoverflow.com/questions/2455161/unrecognized-selector-sent-to-instance-error-in-objective-c
     
     you can use the value of f1.frame.origin.x in an expression (?)
     However, you can't assign a value to f1.frame.origin.x because it involves both
         property relationships of an object and components of a struct
     */
    NSTextField *f1 = [NSTextField textFieldWithString:@"First text"];
    [f1 setTextColor:[NSColor purpleColor] ];
    NSView *topView = thisWindow.contentView;
    NSRect f1Frame = f1.frame;
    f1Frame.origin = NSMakePoint((CGFloat) 100.0, (CGFloat) 150.0);
    f1.frame = f1Frame;
    [topView addSubview:f1];

    [e2 logSizePositionOf:&f1Frame title:@"Information on frame f1"];
    NSRect f1Bounds = f1.bounds ;
    [e2 logSizePositionOf:&f1Bounds title:@"Information on bounds of f1"];
    
    BRossToolsButton *b1 =[BRossToolsButton initUsingObjectIdent:self  selector:@selector(bleep:) caption:@"Show alert" ident:@"first"];
    NSRect b1Frame = b1.frame;
    b1Frame.origin = NSMakePoint((CGFloat) 100.0, (CGFloat) 50.0);
    b1.frame = b1Frame;
    BRossToolsButton *b2 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"Show second alert" ident:@"second"];
    //   Order of parameters is x, y   and width, height
    NSRect b2Frame = b2.frame;
    b2Frame.origin = NSMakePoint((CGFloat) 200.0, (CGFloat) 50.0);
    b2.frame = b2Frame;
    [topView addSubview:b1];
    [topView addSubview:b2];
}
+ (void)logSizePositionOf:(NSRect *)object title:(NSString *)titleString {
    NSLog(@"%@", titleString);
    NSLog(@"    width %f     height %f", object->size.width, object->size.height);
    NSLog(@"    x %f     y %f", object->origin.x, object->origin.y);
}
 + (void)bleep : (id)sender{
     if (sender == nil){
         NSLog(@"bleep used with identifying string");
     } else {
     NSLog(@"bleep entered message is %@", [sender getIdent]);
     }
 }
     @end

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

@implementation BRossToolsView


 
+ (void) displayToLog:(NSString*)name view:(NSView*)target output:(BRossToolsTextWindow *)output {
    [output appendString:@"\n.....  .....\n"];
    [output appendFormat:@"Name of view is %@ \n", name ];
    [output appendFormat:@"Bounds represent dimensions in view's coordinate system \n"];
    [output appendFormat:@"        width %f , height %f \n", target.bounds.size.width, target.bounds.size.height];
    [output appendFormat:@"        x %f , y %f \n", target.bounds.origin.x, target.bounds.origin.y];
    [output appendFormat:@"Frame respresents dimensions in superview's coordinate system \n"];
    [output appendFormat:@"        width %f , height %f \n", target.frame.size.width, target.frame.size.height];
    [output appendFormat:@"        x %f , y %f \n", target.frame.origin.x, target.frame.origin.y];
}
@end

@implementation CoreMidiSample1

//
//  main.m
//  CoreMidiSample1
//
//  Created by Bradley Ross on 9/13/17.
//  Copyright © 2017 Bradley Ross. All rights reserved.
//

struct timespec wallStart;

void deviceData(MIDIDeviceRef deviceId);
void elapsed(void);
/**
 Sends a NSString to a BRossToolsTextWindow
 @brief sends string to a text window
 @param window BRossTools window to be used
 @param message NSString message to be sent
 */

/**
 List data on an entity belonging to a device
 */
void entityData(MIDIDeviceRef device, MIDIEntityRef entity);
void endpointData(MIDIDeviceRef device, MIDIEntityRef entity, MIDIEndpointRef endpoint);
void objectDictionary(MIDIObjectRef object);

/**
 *    Returns a string value based on the error code.
 *    @param text string value to be returned
 *    @param code error code returned from method
 *    <p>The CF_ENUM OSStatus in CoreMIDI/MIDIServices.h lists the error codes for the Core MIDI methods.
 *       The names of the enumeration values are listed at
 *       <a href="https://developer.apple.com/documentation/coremidi/1495156-error_constants?language=objc" target="_blank">
 *       Documentation -> Core MIDI -> MIDI Services -> Error Constants</a>.  It is my assumpton the CF_ENUM enumeration
 *       declarations in different header files are combined into a single enumerations.</p>
 */

/**
 Status value returned by some functions in the CoreMidi library
 */
OSStatus status;
NSString *buildMessage;
static BRossToolsTextWindow *textWindowStorage = nil;

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
/**
 @brief List MIDI Configuration..
 
 MIDIGetNumberOfDevices is used to loop through the MIDI devices.
 MIDIDeviceGetNumberOfEntities and MIDIDeviceGetEntity are then
 used to look through the entities for a given device.  Finally, MIDIEntityGetNumberOfSources and
 MIDIEntityGetSource are used to loop through the source endpoints for a given entity and
 MIDIEntityGetNumberOfDestinations and MIDIEntityGetDestination are used to get the
 destinations.
 
 */
+ (void) runtest{
// int main(int argc, const char * argv[]) {
    // BRossToolsTextWindow *textWindow;
    // textWindow = [BRossToolsTextWindow newWindow];
    [[self textWindow] setTitle:@"test4 -- MIDI Configuration"];
    [[self textWindow] setAutoscroll:YES];
    // [self setTextWindow:textWindow];
    buildMessage = [NSString alloc];
    [[self textWindow] appendString:@"Starting CoreMidiSample1"] ;
    // buildMessage = @"xxx";
    // sendMessage(buildMessage);
    // sendMessage( buildMessage);
        clock_gettime(CLOCK_MONOTONIC, &wallStart);
        ItemCount deviceCount = MIDIGetNumberOfDevices();
    buildMessage = [[NSString alloc] initWithFormat:@"Number of MIDI Devices: %lu", deviceCount];
        sendMessage( @"-----");
    sendMessage(buildMessage);
        for (ItemCount i = 0 ; i < deviceCount ; ++i) {
            // Grab a reference to curent device
            MIDIDeviceRef device = MIDIGetDevice(i);
  
            // Is this device online? (Currently connected?)
            SInt32 isOffline = 0;
            status = MIDIObjectGetIntegerProperty(device, kMIDIPropertyOffline, &isOffline);
            if (status != 0) {
                buildMessage = [[NSString alloc]
                                initWithFormat:@"Error %d: kMIDIPropertyOffline", status];
                sendMessage(buildMessage);
                
            }
            deviceData(device);
            // How many entities do we have?
            ItemCount entityCount = MIDIDeviceGetNumberOfEntities(device);
            // Iterate through this device's entities
            for (ItemCount j = 0 ; j < entityCount ; ++j) {
                // Grab a reference to an entity
                MIDIEntityRef entity = MIDIDeviceGetEntity(device, j);
          
                entityData(device, entity);
                
                // Iterate through this device's source endpoints (MIDI In)
                ItemCount sourceCount = MIDIEntityGetNumberOfSources(entity);
                sendMessage( @"     *****");
                sendMessage( @"     Sources endpoints");
                for (ItemCount k = 0 ; k < sourceCount ; ++k) {
                    // Grab a reference to a source endpoint
                    MIDIEndpointRef source = MIDIEntityGetSource(entity, k);
                    endpointData(device, entity, source);
                }
                // Iterate through this device's destination endpoints
                ItemCount destCount = MIDIEntityGetNumberOfDestinations(entity);
                sendMessage( @"     *****");
                sendMessage(@"      Destination endpoints");
                for (ItemCount k = 0 ; k < destCount ; ++k) {
                    
                    // Grab a reference to a destination endpoint
                    MIDIEndpointRef dest = MIDIEntityGetDestination(entity, k);
                    endpointData(device, entity, dest);
                }
            }
            buildMessage = [[NSString alloc ] initWithFormat:@"------\n"];
            sendMessage( buildMessage);
            }
        elapsed();

    
}
NSString *getDisplayName(MIDIObjectRef object)
{
    // Returns the display name of a given MIDIObjectRef as an NSString
    CFStringRef name = nil;
    if (noErr != MIDIObjectGetStringProperty(object, kMIDIPropertyDisplayName, &name))
        return nil;
    return (__bridge NSString *)name;
}
/**
 @brief List MIDI sources and destinations.
 
 runtest2 is based on CoreMidiDemo2.
 
 It uses MIDIGetNumberOfDestinations MIDIGetDestination to loop through the
 MIDI destinations.  It then uses MIDIGetNumberOfSources and MIDIGetSource
 to loop through the MIDI sources.
 */
+ (void) runtest2 {
    clock_gettime(CLOCK_MONOTONIC, &wallStart);
    sendMessage(@"CoreMidiDemo2");
        for (int j = 0; j < 1; j++) {
            SInt32 uniqueId = 0;
            SInt32 version = 0;
            CFStringRef description = NULL;
            CFStringRef manufacturer = NULL;
            CFStringRef displayName = NULL;
            SInt32 deviceID = 0;
            sendMessage(@"Iterate through destinations");
            ItemCount destCount = MIDIGetNumberOfDestinations();
            for (ItemCount i = 0 ; i < destCount ; ++i) {
                // Grab a reference to a destination endpoint
                MIDIEndpointRef dest = MIDIGetDestination(i);
                /*  Should this be compared to 0 instead of NULL? */
                if (dest != 0) {
                    buildMessage = [[NSString alloc] initWithFormat:@"  Destination %lu: %@", i, getDisplayName(dest)];
                    sendMessage(buildMessage);
                    /*
                     * Code past this point in block was added to provide additional examples.
                     */
                    MIDIObjectGetIntegerProperty(dest,kMIDIPropertyUniqueID, &uniqueId);
                    MIDIObjectGetIntegerProperty(dest, kMIDIPropertyDriverVersion, &version);
                    MIDIObjectGetStringProperty(dest, kMIDIPropertyManufacturer, &manufacturer);
                    MIDIObjectGetIntegerProperty(dest, kMIDIPropertyDeviceID, &deviceID);
                    MIDIObjectGetStringProperty(dest, kMIDIPropertyModel, &description);
                    buildMessage = [[NSString alloc] initWithFormat:@"       Unique ID: %d %08x", uniqueId, uniqueId];
                    sendMessage(buildMessage);
                    buildMessage = [[NSString alloc] initWithFormat:@"       Device ID: %d", deviceID];
                    sendMessage(buildMessage);
                    buildMessage = [[NSString alloc] initWithFormat:@"       Version: %d", version];
                    sendMessage(buildMessage);
                    buildMessage = [[NSString alloc] initWithFormat:@"       Manufacturer: %@", manufacturer];
                    sendMessage(buildMessage);
                    buildMessage = [[NSString alloc] initWithFormat:@"       Description: %@", description];
                    sendMessage(buildMessage);
                    buildMessage = [[NSString alloc] initWithFormat:@"       Endpoint Reference: %d", dest];
                    sendMessage(buildMessage);
                    }
                }
            elapsed();
            sendMessage(@"Iterate through sources");
            // Virtual sources and destinations don't have entities
    
            ItemCount sourceCount = MIDIGetNumberOfSources();
        for (ItemCount i = 0 ; i < sourceCount ; ++i) {
        MIDIEndpointRef source = MIDIGetSource(i);
        // NSLog(@" *** Processing source  %lu", i);
        if (source != 0) {
            // NSLog(@"%d", source);
           MIDIObjectGetStringProperty(source, kMIDIPropertyManufacturer, &manufacturer);
            // NSLog(@"%@", manufacturer);
            MIDIObjectGetStringProperty(source, kMIDIPropertyDisplayName, &displayName);
            // NSLog(@"Point 2");
            // NSLog(@"  Source: %@", getDisplayName(source));
            buildMessage = [[NSString alloc] initWithFormat:@"  Source (Display Name) %lu: %@", i, displayName];
            sendMessage(buildMessage);
            MIDIObjectGetIntegerProperty(source,kMIDIPropertyUniqueID, &uniqueId);
            MIDIObjectGetIntegerProperty(source, kMIDIPropertyDriverVersion, &version);
            MIDIObjectGetStringProperty(source, kMIDIPropertyManufacturer, &manufacturer);
            MIDIObjectGetIntegerProperty(source, kMIDIPropertyDeviceID, &deviceID);
            MIDIObjectGetStringProperty(source, kMIDIPropertyModel, &description);
            buildMessage = [[NSString alloc] initWithFormat:@"       Unique ID: %d %08x", uniqueId, uniqueId];
            sendMessage(buildMessage);
            buildMessage = [[NSString alloc] initWithFormat:@"       Device ID: %d", deviceID];
            sendMessage(buildMessage);
            buildMessage = [[NSString alloc] initWithFormat:@"       Version: %d", version];
            sendMessage(buildMessage);
            buildMessage = [[NSString alloc] initWithFormat:@"       Manufacturer: %@", manufacturer];
            sendMessage(buildMessage);
            buildMessage = [[NSString alloc] initWithFormat:@"       Description: %@", description];
            sendMessage(buildMessage);
            buildMessage = [[NSString alloc] initWithFormat:@"       Endpoint Reference: %d", source];
            sendMessage(buildMessage);
            }
        }
        elapsed();
            buildMessage = [[NSString alloc] initWithFormat:@"CLOCKS_PER_SEC: %ld", CLOCKS_PER_SEC];
            sendMessage(buildMessage);
            buildMessage = [[NSString alloc] initWithFormat:@"End of pass  %d", j];
            sendMessage(buildMessage);
        }
    }


+ (void)setTextWindow:textWindow {
    textWindowStorage = textWindow;
}
+ (BRossToolsTextWindow *)getTextWindow {
    return (BRossToolsTextWindow *) textWindowStorage;
    
}
+ (BRossToolsTextWindow *)textWindow {
    if (textWindowStorage == nil) {
        textWindowStorage = [BRossToolsTextWindow newWindow];
        return textWindowStorage;
        
    } else {
        return textWindowStorage;
    }
}

void sendMessage2 (BRossToolsTextWindow *window, NSString *string) {
    NSLog(@"STARTING");
    NSLog(@"sendMessage sending message to log %@", string);
    
    [[CoreMidiSample1 getTextWindow] appendString:string];
    [[CoreMidiSample1 getTextWindow] appendString:@"\n"];
}
void sendMessage (NSString *string) {
    // NSLog(@"STARTING");
    // NSLog(@"sendMessage sending message to log %@", string);
    if ([CoreMidiSample1 textWindow] == nil) {
        textWindowStorage = [BRossToolsTextWindow newWindow];
        [[CoreMidiSample1 textWindow] setTitle:@"test4 -- CoreMidiSample1"];
    }
    [[CoreMidiSample1 getTextWindow] appendString:string];
    [[CoreMidiSample1 getTextWindow] appendString:@"\n"];
}
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

/**
 *  Display elapsed wall clock time.
 */
void elapsed() {
    struct timespec current;
    clock_gettime(CLOCK_MONOTONIC, &current);
    double elapsed;
    elapsed = (current.tv_sec - wallStart.tv_sec);
    elapsed += (current.tv_nsec - wallStart.tv_nsec)/1000000000.0;
    buildMessage = [[NSString alloc]  initWithFormat:@"Elapsed Wall Time: %f seconds\n", elapsed];
    sendMessage(buildMessage);
}
/**
 *    Returns a string value based on the error code.
 *    @param text string value to be returned
 *    @param code error code returned from method
 *    <p>The CF_ENUM OSStatus in CoreMIDI/MIDIServices.h lists the error codes for the Core MIDI methods.
 *       The names of the enumeration values are listed at
 *       <a href="https://developer.apple.com/documentation/coremidi/1495156-error_constants?language=objc" target="_blank">
 *       Documentation -> Core MIDI -> MIDI Services -> Error Constants</a>.  It is my assumpton the CF_ENUM enumeration
 *       declarations in different header files are combined into a single enumerations.</p>
 */
void logger(NSString* text, SInt32 code) {
    NSString * comment;
    if (code != 0) {
        if (code == -10830) {
            comment = @"kMIDIInvalidClient";
        } else if (code == -10831) {
            comment = @"kMIDIInvalidPort";
        } else if (code == -10832) {
            comment = @"kMIDIWrongEndpointType";
        } else if (code == -10833) {
            comment = @"kMIDINoConnection";
        } else if (code == -10834) {
            comment = @"kMIDIUnknownEndpoint";
        } else if (code == -10835) {
            comment = @"kMIDIUnknownPropertyType";
        } else if (code == -10836) {
            comment = @"kMIDIWrongPropertyType";
        } else {
            comment = @" ? ";
        }
        buildMessage = [[NSString alloc] initWithFormat:@"Error %d: %@ %@\n", code, text, comment ];
        sendMessage(buildMessage);
    }
}

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

/**
 *    Display information on MIDI devices.
 *
 *    @brief Displays MIDI device information.
 *
 *    The constants indicating the desired properties are listed in MidiServices.h.
 *
 *    @param device refeference to device
 */
void deviceData(MIDIDeviceRef device) {
    sendMessage(@"*****");
    // [[CoreMidiSample1 getTextWindow] appendString:@"*****"];
    OSStatus status = 0;
    CFStringRef deviceDisplayName = NULL;
    CFStringRef deviceName = NULL;
    CFStringRef deviceModel = NULL;
    CFStringRef deviceManufacturer = NULL;
    SInt32 deviceReceivesNotes = 0;
    SInt32 deviceTransmitsNotes = 0;
    SInt32 uniqueID = 0;
    SInt32 supportsGeneralMIDI = 0;
    SInt32 version = 0;
    SInt32 deviceID = 0;
    status = MIDIObjectGetStringProperty(device, kMIDIPropertyName, &deviceName);
    logger(@"device,kMIDIPropertyName", status);
    status = 0;
    buildMessage = [[NSString alloc] initWithFormat:@"Device: %@", deviceName];
    sendMessage(buildMessage);
    sendMessage(@"     Device Properties:");
    status = MIDIObjectGetStringProperty(device, kMIDIPropertyDisplayName, &deviceDisplayName);
    if (status == 0) {
        buildMessage = [[NSString alloc] initWithFormat:@"     Device Display Name: %@", deviceDisplayName];
        sendMessage(buildMessage);
    } else if (status == -10835) {
        sendMessage(@"     Device Display Name: property not supported");
    } else {
        logger(@"device,kMIDIPropertyDisplayName", status);
        sendMessage(buildMessage);
    }
    status = MIDIObjectGetIntegerProperty(device, kMIDIPropertyReceivesNotes, &deviceReceivesNotes);
    if (status == 0) {
        buildMessage = [[NSString alloc] initWithFormat:@"     Receives Notes: %d", deviceReceivesNotes];
        sendMessage(buildMessage);
    } else if (status == -10835) {
        sendMessage(@"     Receives Notes: property not supported");
    } else {
        logger(@"device,kMIDIPropertyReceivesNotes", status);
    }
    status = MIDIObjectGetIntegerProperty(device, kMIDIPropertyTransmitsNotes, &deviceTransmitsNotes);
    if (status == 0) {
        buildMessage = [[NSString alloc] initWithFormat:@"     Transmits Notes: %d", deviceTransmitsNotes];
        sendMessage(buildMessage);
    } else if (status == -10835) {
        sendMessage(@"     Transmits Notes: property not supported");
    } else {
        logger(@"device,kMIDIPropertyTransmitsNotes", status);
    }
    status = MIDIObjectGetIntegerProperty(device,kMIDIPropertyUniqueID, &uniqueID);
    logger(@"device,kMIDIPropertyUniqueID", status);
    buildMessage = [[NSString alloc] initWithFormat:@"     Unique ID:  %08x", uniqueID];
    sendMessage(buildMessage);
    SInt32 isOffline = 0;
    MIDIObjectGetIntegerProperty(device, kMIDIPropertyOffline, &isOffline);
    buildMessage = [[NSString alloc] initWithFormat:@"     isOffline: %d", isOffline];
    sendMessage(buildMessage);
    status = MIDIObjectGetIntegerProperty(device, kMIDIPropertyDeviceID, &deviceID);
    if (status == 0) {
        buildMessage = [[NSString alloc] initWithFormat:@"     Device ID: %d", deviceID];
        sendMessage(buildMessage);
    } else if (status == -10835) {
        buildMessage = [[NSString alloc] initWithFormat:@"     Device ID: property not supported"];
        sendMessage(buildMessage);
    } else {
        logger(@"device,kMIDIPropertyDeviceID", status);
    }
    status = MIDIObjectGetIntegerProperty(device, kMIDIPropertyDriverVersion, &version);
    if (status == 0) {
        buildMessage = [[NSString alloc]  initWithFormat:@"     Version: %d", version];
        sendMessage(buildMessage);
    } else if (status == -10835) {
            sendMessage(@"     Version: property not supported");
    } else {
        logger(@"device,kMIDIPropertyDriverVersion", status);
    }
    status = MIDIObjectGetStringProperty(device, kMIDIPropertyManufacturer, &deviceManufacturer);
    buildMessage = [[NSString alloc] initWithFormat:@"     Manufacturer: %@", deviceManufacturer];
    sendMessage(buildMessage);
    logger(@"device,kMIDIPropertyManufacturer", status);
    status = MIDIObjectGetStringProperty(device, kMIDIPropertyModel, &deviceModel);
    if (status == 0) {
        buildMessage = [[NSString alloc] initWithFormat:@"     Model: %@", deviceModel];
        sendMessage(buildMessage);
    } else if (status == -10835) {
        sendMessage(@"     Model: property not supported");
    } else {
        logger(@"device,kMIDIPropertyModel", status);
    }
    status = MIDIObjectGetIntegerProperty(device, kMIDIPropertySupportsGeneralMIDI, &supportsGeneralMIDI);
    if (status == 0) {
        buildMessage = [[NSString alloc]  initWithFormat:@"     Supports General MIDI: %d", supportsGeneralMIDI];
        sendMessage(buildMessage);
    } else if (status == -10835) {
        sendMessage(@"     Supports General MIDI: property not supported");
    } else {
        logger(@"device,kMIDIPropertySupportsGeneralMIDI", status);
        sendMessage(buildMessage);
    }
    objectDictionary(device);
}

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

/**
 *    Display information on MIDI entities.
 *    @brief Displays MIDI entity information.
 *    @param device object for MIDI device
 *    @param entity object for MIDI entity
 */
void entityData(MIDIDeviceRef device, MIDIEntityRef entity) {
    sendMessage(@"*****");
    OSStatus status = 0;
    CFStringRef deviceName = NULL;
    CFStringRef entityDisplayName = NULL;
    CFStringRef entityName = NULL;
    SInt32 entityReceivesNotes = 0;
    SInt32 entityTransmitsNotes = 0;
    MIDIObjectGetStringProperty(device, kMIDIPropertyName, &deviceName);
    buildMessage = [[NSString alloc] initWithFormat:@"Device: %@", deviceName];
    sendMessage(buildMessage);
    MIDIObjectGetStringProperty(entity, kMIDIPropertyName, &entityName);
    buildMessage = [[NSString alloc] initWithFormat:@"Entity: %@", entityName];
    sendMessage(buildMessage);
    status = MIDIObjectGetStringProperty(entity, kMIDIPropertyDisplayName, &entityDisplayName);
    if (status == 0) {
        buildMessage = [[NSString alloc]  initWithFormat:@"               Entity Display Name: %@", entityDisplayName];
        sendMessage(buildMessage);
    } else if (status == -10835) {
        sendMessage(@"               Entity Display Name: property not supported");
    } else {
        logger(@"entity,kMIDIPropertyDisplayName", status);
    }
    status = MIDIObjectGetIntegerProperty(entity, kMIDIPropertyReceivesNotes, &entityReceivesNotes);
    if (status == 0) {
        buildMessage = [[NSString alloc] initWithFormat:@"               Receives Notes: %d", entityReceivesNotes];
        sendMessage(buildMessage);
    } else if (status == -10835) {
        sendMessage(@"               Receives Notes: property not supported");
    } else {
        logger(@"endpoint,kMIDIPropertyReceivesNotes", status);
    }
    status = MIDIObjectGetIntegerProperty(entity, kMIDIPropertyTransmitsNotes, &entityTransmitsNotes);
    if (status == 0) {
        buildMessage =[[NSString alloc] initWithFormat:@"               Transmits Notes: %d", entityTransmitsNotes];
        sendMessage(buildMessage);
    } else if (status == -10835) {
        sendMessage(@"               Transmits Notes: property not supported");
    } else {
        logger(@"entity,kMIDIPropertyTransmitsNotes", status);
    }

        objectDictionary(entity);
}

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

/**
 *    List property information for a MIDI object using MIDIObjectGetProperties.  The
 *           properties list is contained in a CFDictionary structure
 *    @brief Displays the properties list for a MIDI object
 *    @param object MIDI object
 */
void objectDictionary(MIDIObjectRef object) {
    // https://crowd.cs.umass.edu/citizen/proxy/CFPropertyList/docs/plist/CFPropertyList.html
    BRossToolsCFDictionaryArray *tempTool = [[BRossToolsCFDictionaryArray alloc] init];
    [tempTool setDestination:[CoreMidiSample1 getTextWindow]];

    CFPropertyListRef propertyList = NULL;
    OSStatus status = 0;
    status = MIDIObjectGetProperties(object, &propertyList, TRUE);
    [tempTool showDictionaryContents:propertyList];
    if (status != 0) {
        logger(@"object MIDIObjectGetProperties", status);
    }
    // listDictionaryLevel(0, propertyList);
}

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****




//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****



//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

/**
 *  Display information on a MIDI endpoint.
 *  @brief Display MIDI endpoint information.
 *
 *  @param device MIDI device object
 *  @param entity MIDI entity object
 *  @param endpoint MIDI endpoint object
 */
void endpointData(MIDIDeviceRef device, MIDIEntityRef entity, MIDIEndpointRef endpoint) {
    OSStatus status = 0;
    CFStringRef deviceName = NULL;
    CFStringRef entityName = NULL;
    CFStringRef endpointName = NULL;
    CFStringRef endpointDisplayName = NULL;
    SInt32 endpointReceivesNotes = 0;
    SInt32 endpointTransmitsNotes = 0;
    sendMessage(@"     *****");
    status = MIDIObjectGetStringProperty(device, kMIDIPropertyName, &deviceName);
        logger(@"device,kMIDIPropertyName", status);
    status = MIDIObjectGetStringProperty(entity, kMIDIPropertyName, &entityName);
    logger(@"entity,kMIDIPropertyName", status);
    status = MIDIObjectGetStringProperty(endpoint, kMIDIPropertyName, &endpointName);
        logger(@"endpoint,kMIDIPropertyName", status);
    buildMessage = [[NSString alloc] initWithFormat:@"          Device: %@", deviceName];
    sendMessage(buildMessage);
    buildMessage = [[NSString alloc] initWithFormat:@"          Entity: %@", entityName];
    sendMessage(buildMessage);
    buildMessage = [[NSString alloc] initWithFormat:@"          Endpoint: %@", endpointName];
    sendMessage(buildMessage);
    status = MIDIObjectGetStringProperty(endpoint, kMIDIPropertyDisplayName, &endpointDisplayName);
    if (status == 0) {
        buildMessage = [[NSString alloc] initWithFormat:@"               Endpoint Display Name: %@", endpointDisplayName];
        sendMessage(buildMessage);
    } else if (status == -10835) {
        sendMessage(@"                Endpoint Display Name: property not supported");
    } else {
        logger(@"endpoint,kMIDIPropertyDisplayName", status);
    }
    status = MIDIObjectGetIntegerProperty(endpoint, kMIDIPropertyReceivesNotes, &endpointReceivesNotes);
    if (status == 0) {
        buildMessage = [[NSString alloc] initWithFormat:@"               Receives Notes: %d", endpointReceivesNotes];
        sendMessage(buildMessage);
    } else if (status == -10835) {
        sendMessage(@"               Receives Notes: property not supported");
    } else {
    logger(@"endpoint,kMIDIPropertyReceivesNotes", status);
    }
    status = MIDIObjectGetIntegerProperty(endpoint, kMIDIPropertyTransmitsNotes, &endpointTransmitsNotes);
    if (status == 0) {
        buildMessage = [[NSString alloc] initWithFormat:@"               Transmits Notes: %d", endpointTransmitsNotes];
        sendMessage(buildMessage);
    } else if (status == -10835) {
        sendMessage(@"               Transmits Notes: property not supported");
    } else {
        logger(@"endpoint,kMIDIPropertyTransmitsNotes", status);
    }
    // objectDictionary(endpoint);
}


@end


//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

@implementation BRossToolsCFDictionaryArray

BRossToolsTextWindow *textWindowB;
/**
 @brief Type id values set?
 YES if values set, NO otherwise.
 */
static Boolean valuesSet = NO;
/**
 @brief print diagnostic messages?
 Determines whether to print additional messages.  YES means to
 print messages.  NO means don't print.
 */
static Boolean debugMessages = NO;
static CFTypeID dictionaryType = 0;
static CFTypeID arrayType = 0;
static CFTypeID numberType = 0;
static CFTypeID stringType = 0;
/**
 @brief Enumerator for key-value pairs
 @param key Key for key/value pair
 @param value for key/value pair
 @param context In this instance, context is the address of an integer which stores the depth
            in the tree of key/value pairs.  It can be used for any purpose so long as it is used
            consistently  between parseDictionApplier and CFDictionaryApplyFunction and
            this function.  This function must use CFDictionaryApplierFunction as the function signature.
 */
void parseDictionaryApplier(const void *key, const void *value, void *context);
/**
 Construct a NSString spacer based on the depth into tree of key/value pairs.
 @brief build spacer based on level
 @param level depth in tree
 @returns spacer
 */
NSString *buildSpacer(int level);
/**
  @brief Set initial values.
 
    That are seme static variables that only need to be set once.  This function
    initializes the values and then changes the value of  valuesSet so that the
    initialization won't be repeated.
 */
void initValues(void);
void initValues() {
    if ( !valuesSet ) {
        dictionaryType = CFDictionaryGetTypeID();
        arrayType = CFArrayGetTypeID();
        stringType = CFStringGetTypeID();
        numberType = CFNumberGetTypeID();
        valuesSet = YES;
    }
}
    /*
    Defined in header file.
    */
- (void) showDictionaryContents:(CFTypeRef) startingNode {
    if (debugMessages) {
    [textWindowB appendString:@"*** Starting showDictionaryContents\n"];
    }
    BRossToolsCFDictionaryArray *temp = [[BRossToolsCFDictionaryArray alloc] init];
    
    [temp showDictionaryContents:startingNode atLevel:1];
}
/*
 Defined in header file.
 */
- (void) showDictionaryContents:(CFTypeRef) startingNode atLevel:(int)levelValue {
    if (debugMessages) {
    [textWindowB appendString:@"*** Starting showDictionaryContents:atLevel\n"];
    }
    int level = levelValue;
    initValues();
    NSString* spacer = buildSpacer(level);
/*
    if (level % 6 == 0) { spacer = @" "; } else
    if (level % 6 == 1) { spacer = @"    "; } else
    if (level % 6 == 2) { spacer = @"       "; } else
    if (level % 6 == 3) { spacer = @"          "; } else
    if (level % 6 == 4) { spacer = @"             "; } else
    if (level % 6 == 5) { spacer = @"                "; } else
    if (level % 6 == 6) { spacer = @"                   "; }
 */
    /*
     Determine if the top node is a dictionary node or an array node.  If
     it is neither, then there is an error.
     
     https://developer.apple.com/library/archive/documentation/CoreFoundation/Conceptual/CFDesignConcepts/Articles/tollFreeBridgedTypes.html
     */
    CFTypeRef topValue = startingNode;
    CFTypeID type = CFGetTypeID(topValue);
    if ( type == dictionaryType ) {
        /*
         If top node for this call is a dictionaryType use
         enumeration function to process nodes on this level.
         */
        if (debugMessages) {
        NSString *tempString = [[NSString alloc] initWithFormat:@"*** top node for level %d is dictionary\n", level];
        [textWindowB appendString:tempString];
        }
        CFDictionaryApplyFunction(startingNode, parseDictionaryApplier, &levelValue);
    } else if (type == arrayType ) {
        /*
         If top node for this call is array type, use itrerator to go through
         members of array.
         */
        if (debugMessages) {
        NSString *tempString = [[NSString alloc] initWithFormat:@"*** top node for level %d is array\n", level];
        [textWindowB appendString:tempString];
        }
        CFIndex size = CFArrayGetCount(topValue);
        for (int i = 0; i < size; i++) {
            CFTypeRef node = CFArrayGetValueAtIndex(topValue, i);
            CFTypeID nodeType = CFGetTypeID(node);
            NSString *working;
            if (nodeType == numberType) {
                CFNumberRef element = (CFNumberRef) node;
                SInt32 numericValue;
                CFNumberGetValue(element,kCFNumberSInt32Type, &numericValue);
                // key and numericValue are the key/value pair
                // NSLog (@"%d", result);
                working = [[NSString alloc] initWithFormat:@"%2d %@    numberType, position %d, value %d \n", level, spacer, i, numericValue];
                [textWindowB appendString:working];
            } else if (nodeType == stringType) {
                CFStringRef element = (CFStringRef) node;
                NSString *stringValue =  (__bridge NSString *)element;
                working = [[NSString alloc] initWithFormat:@"%2d %@    stringType, position %d, value \"%@\" \n",level, spacer, i, stringValue];
                [textWindowB appendString:working];
                // key and (CFStringRef)value are the key/value pair
            } else if (nodeType == dictionaryType) {
                //key is the value of the key and value is the reference to the dictionary
                CFDictionaryRef value = (CFDictionaryRef)node;
                working = [[NSString alloc]initWithFormat:@"%2d %@ dictionaryType:  position %d\n", level, spacer, i];
                [textWindowB appendString:working];
                BRossToolsCFDictionaryArray *dictionaryHandler = [[BRossToolsCFDictionaryArray alloc] init];
                [dictionaryHandler setDestination:textWindowB];
                [dictionaryHandler showDictionaryContents:value atLevel:level+1];
                // listDictionaryLevel(currentLevel+1,  values[position]);
            } else if (nodeType == arrayType) {
                CFIndex arraySize = CFArrayGetCount(node);
                working = [[NSString alloc]initWithFormat:@"%2d, %@ arrayType:  position %d, size %lu\n", level, spacer, i, arraySize];
                [textWindowB appendString:working];
                if (arraySize > 0) {
                BRossToolsCFDictionaryArray *arrayHandler = [[BRossToolsCFDictionaryArray alloc] init];
                [arrayHandler setDestination:textWindowB];
                [arrayHandler showDictionaryContents:node atLevel:level+1];
                }
            }
        }
        
    } else {
        NSLog(@"*** Unprocessable type in array");
    }
}

- (void) setDestination:(BRossToolsTextWindow *) destination {
    textWindowB = destination;
}
- (BRossToolsTextWindow *) destination {
    if (textWindowB == NULL) {
        textWindowB = [BRossToolsTextWindow newWindow];
        textWindowB.title = @"BRossToolsCFDictionaryArray";
        return textWindowB;
    } else {
        return textWindowB;
    }
    
}
NSString *buildSpacer(int currentLevel) {
    NSString *spacer;
    if (currentLevel % 6 == 0 ) { spacer = @" ";} else
    if (currentLevel % 6 == 1 ) { spacer = @"    ";} else
    if (currentLevel % 6 == 2 ) { spacer = @"       ";} else
    if (currentLevel % 6 == 3 ) { spacer = @"          ";} else
    if (currentLevel % 6 == 4 ) { spacer = @"             ";} else
    if (currentLevel % 6 == 5 ) { spacer = @"                ";}
    return spacer;
}
void parseDictionaryApplier(const void *key, const void *value, void *context) {
    int *Level = (int *) context;
    int currentLevel = *Level;

    
    // CFStringRef *keysByLevel[20];
    // CFTypeRef *valuesByLevel[20];
   

    NSString *spacer = buildSpacer(currentLevel);
    

    NSString *working;
    // working = [[NSString alloc] initWithFormat:@"Level %d  ", currentLevel];
    // [textWindowB appendString:working];
    /*
     T/he method of using the enumerator involves the following two items:
     
     CFDictionaryApplyFunction applies the enumberator.
     
     CFDictionaryApplierFunction specifies the signature for the applier function.
     */
    CFTypeID elementTypeID = CFGetTypeID(value);
    if (elementTypeID == numberType) {
        CFNumberRef element = (CFNumberRef) value;
        SInt32 numericValue;
        CFNumberGetValue(element,kCFNumberSInt32Type, &numericValue);
        // key and numericValue are the key/value pair
        // NSLog (@"%d", result);
        working = [[NSString alloc] initWithFormat:@"%2d %@ numberType, key \"%@\", value %d \n", currentLevel, spacer, key, numericValue];
        [textWindowB appendString:working];
    } else if (elementTypeID == stringType) {
        working = [[NSString alloc] initWithFormat:@"%2d %@ stringType, key \"%@\", value \"%@\" \n", currentLevel,  spacer, key, value];
        [textWindowB appendString:working];
        // key and (CFStringRef)value are the key/value pair
    } else if (elementTypeID == dictionaryType) {
        //key is the value of the key and value is the reference to the dictionary
        working = [[NSString alloc]initWithFormat:@"%2d %@ dictionaryType:  key is \"%@\"\n", currentLevel, spacer, key];
        [textWindowB appendString:working];
        BRossToolsCFDictionaryArray *dictionaryHandler = [[BRossToolsCFDictionaryArray alloc] init];
        [dictionaryHandler setDestination:textWindowB];
        [dictionaryHandler showDictionaryContents:value atLevel:currentLevel+1];
        // listDictionaryLevel(currentLevel+1,  values[position]);
    } else if (elementTypeID == arrayType) {
        CFIndex arrayCount = CFArrayGetCount(value);
        working = [[NSString alloc]initWithFormat:@"%2d %@ arrayType:  key is \"%@\", size is %lu\n", currentLevel, spacer, key, arrayCount];
        [textWindowB appendString:working];
        if (arrayCount > 0) {
        BRossToolsCFDictionaryArray *arrayHandler = [[BRossToolsCFDictionaryArray alloc] init];
        [arrayHandler setDestination:textWindowB];
        [arrayHandler showDictionaryContents:value atLevel:currentLevel+1];
        }
//key is the value of the key and value is the reference to the array
       
    }
}
@end
