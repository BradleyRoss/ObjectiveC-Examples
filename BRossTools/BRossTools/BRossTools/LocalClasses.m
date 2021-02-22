//
//  LocalClasses.m
//  BRossTools
//
//  Created by Bradley Ross on 2/1/21.
//

/**
 @file  Implementation code for LocalClasses
 */
#import <Foundation/Foundation.h>
# import "BRossTools.h"
# import "LocalClasses.h"


//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

/**
  * Creates the main menu for display on the first window.
 */
@implementation mainMenu
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
            }
    
        }
}
/**
   Builds view containing main menu.
 
     @returns pointer to NSStackView object.
 https://stackoverflow.com/questions/36020540/why-is-instancetype-used
 */
+ (NSView *)menu {
    // NSStackView *stackView = [NSStackView alloc]
    
    BRossToolsButton *b1 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"This will trigger the e2 test which opens a window, colors it, and inserts a few text fields and buttons" ident:@"b1" ];
    BRossToolsButton *b2 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"run test1 new window plus fields" ident:@"b2" ];
    BRossToolsButton *b3 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"run test2 text handling window" ident:@"b3" ];

    BRossToolsButton *b4 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"run test3" ident:@"b4" ];
    
    BRossToolsButton *b5 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"run test4 - CoreMidiTest1" ident:@"b5" ];
    
    NSStackView *stackView = [NSStackView stackViewWithViews:@[b1, b2, b3, b4, b5]];
    stackView.orientation = NSUserInterfaceLayoutOrientationVertical;
    return stackView;
}
@end

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****


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

@implementation test4
+ (void) runtest {
    BRossToolsTextWindow *textWindow;
    textWindow = [BRossToolsTextWindow newWindow];
    textWindow.title=@"test4 immutable/mutable";
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
void deviceData(MIDIDeviceRef);
void elapsed(void);
/**
 Sends a NSString to a BRossToolsTextWindow
 @brief sends string to a text window
 @param window BRossTools window to be used
 @param message NSString message to be sent
 */
void sendMessage(BRossToolsTextWindow *window, NSString *message);
/**
 List data on an entity belonging to a device
 */
void entityData(MIDIDeviceRef device, MIDIEntityRef entity);
void endpointData(MIDIDeviceRef device, MIDIEntityRef entity, MIDIEndpointRef endpoint);
void objectDictionary(MIDIObjectRef object);
void listDictionaryLevel(int level, CFTypeRef dictionary);
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
void logger(NSString* text, SInt32 code);
/**
 Status value returned by some functions in the CoreMidi library
 */
OSStatus status;
NSString *buildMessage;
BRossToolsTextWindow *textWindow;

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

+ (void) runtest{
// int main(int argc, const char * argv[]) {
    BRossToolsTextWindow *textWindow;
    textWindow = [BRossToolsTextWindow newWindow];
    textWindow.title=@"test4 -- CoreMidiSample1";
        clock_gettime(CLOCK_MONOTONIC, &wallStart);
        ItemCount deviceCount = MIDIGetNumberOfDevices();
    buildMessage = [[NSString alloc] initWithFormat:@"Number of MIDI Devices: %lu", deviceCount];
        sendMessage(textWindow, @"-----");
        for (ItemCount i = 0 ; i < deviceCount ; ++i) {
            // Grab a reference to curent device
            MIDIDeviceRef device = MIDIGetDevice(i);
  
            // Is this device online? (Currently connected?)
            SInt32 isOffline = 0;
            status = MIDIObjectGetIntegerProperty(device, kMIDIPropertyOffline, &isOffline);
            if (status != 0) {
                buildMessage = [[NSString alloc]
                                initWithFormat:@"Error %d: kMIDIPropertyOffline", status];
                sendMessage(textWindow, buildMessage);
                
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
                sendMessage(textWindow, @"     *****");
                sendMessage(textWindow, @"     Sources");
                for (ItemCount k = 0 ; k < sourceCount ; ++k) {
                    // Grab a reference to a source endpoint
                    MIDIEndpointRef source = MIDIEntityGetSource(entity, k);
                    endpointData(device, entity, source);
                }
                // Iterate through this device's destination endpoints
                ItemCount destCount = MIDIEntityGetNumberOfDestinations(entity);
                sendMessage(textWindow, @"     *****");
                sendMessage(textWindow, @"     Destinations");
                for (ItemCount k = 0 ; k < destCount ; ++k) {
                    
                    // Grab a reference to a destination endpoint
                    MIDIEndpointRef dest = MIDIEntityGetDestination(entity, k);
                    endpointData(device, entity, dest);
                }
            }
            buildMessage = [[NSString alloc ] initWithFormat:@"------\n"];
            sendMessage(textWindow, buildMessage);
            }
        elapsed();
    
    
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
    sendMessage(textWindow, buildMessage);
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
        sendMessage(textWindow, buildMessage);
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
 *    <p>The constants indicating the desired properties are listed in MidiServices.h.</p>
 */
void deviceData(MIDIDeviceRef device) {
    sendMessage(textWindow, @"*****");
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
    sendMessage(textWindow, buildMessage);
    sendMessage(textWindow,@"     Device Properties:");
    status = MIDIObjectGetStringProperty(device, kMIDIPropertyDisplayName, &deviceDisplayName);
    if (status == 0) {
        NSLog(@"     Device Display Name: %@", deviceDisplayName);
        sendMessage(textWindow, buildMessage);
    } else if (status == -10835) {
        sendMessage(textWindow,@"     Device Display Name: property not supported");
    } else {
        logger(@"device,kMIDIPropertyDisplayName", status);
        sendMessage(textWindow, buildMessage);
    }
    status = MIDIObjectGetIntegerProperty(device, kMIDIPropertyReceivesNotes, &deviceReceivesNotes);
    if (status == 0) {
        NSLog(@"     Receives Notes: %d", deviceReceivesNotes);
    } else if (status == -10835) {
        NSLog(@"     Receives Notes: property not supported");
    } else {
        logger(@"device,kMIDIPropertyReceivesNotes", status);
    }
    status = MIDIObjectGetIntegerProperty(device, kMIDIPropertyTransmitsNotes, &deviceTransmitsNotes);
    if (status == 0) {
        NSLog(@"     Transmits Notes: %d", deviceTransmitsNotes);
    } else if (status == -10835) {
        sendMessage(textWindow, @"     Transmits Notes: property not supported");
    } else {
        logger(@"device,kMIDIPropertyTransmitsNotes", status);
    }
    status = MIDIObjectGetIntegerProperty(device,kMIDIPropertyUniqueID, &uniqueID);
    logger(@"device,kMIDIPropertyUniqueID", status);
    NSLog(@"     Unique ID:  %08x", uniqueID);
    SInt32 isOffline = 0;
    MIDIObjectGetIntegerProperty(device, kMIDIPropertyOffline, &isOffline);
    NSLog(@"     isOffline: %d", isOffline);
    status = MIDIObjectGetIntegerProperty(device, kMIDIPropertyDeviceID, &deviceID);
    if (status == 0) {
        NSLog(@"     Device ID: %d", deviceID);
        sendMessage(textWindow, buildMessage);
    } else if (status == -10835) {
        buildMessage = [[NSString alloc] initWithFormat:@"     Device ID: property not supported"];
        sendMessage(textWindow, buildMessage);
    } else {
        logger(@"device,kMIDIPropertyDeviceID", status);
    }
    status = MIDIObjectGetIntegerProperty(device, kMIDIPropertyDriverVersion, &version);
    if (status == 0) {
            NSLog(@"     Version: %d", version);
    } else if (status == -10835) {
            sendMessage(textWindow, @"     Version: property not supported");
    } else {
        logger(@"device,kMIDIPropertyDriverVersion", status);
    }
    status = MIDIObjectGetStringProperty(device, kMIDIPropertyManufacturer, &deviceManufacturer);
    buildMessage = [[NSString alloc] initWithFormat:@"     Manufacturer: %@", deviceManufacturer];
    sendMessage(textWindow, buildMessage);
    logger(@"device,kMIDIPropertyManufacturer", status);
    status = MIDIObjectGetStringProperty(device, kMIDIPropertyModel, &deviceModel);
    if (status == 0) {
        NSLog(@"     Model: %@", deviceModel);
    } else if (status == -10835) {
        sendMessage(textWindow, @"     Model: property not supported");
    } else {
        logger(@"device,kMIDIPropertyModel", status);
    }
    status = MIDIObjectGetIntegerProperty(device, kMIDIPropertySupportsGeneralMIDI, &supportsGeneralMIDI);
    if (status == 0) {
        NSLog(@"     Supports General MIDI: %d", supportsGeneralMIDI);
    } else if (status == -10835) {
        sendMessage(textWindow,@"     Supports General MIDI: property not supported");
    } else {
        logger(@"device,kMIDIPropertySupportsGeneralMIDI", status);
        sendMessage(textWindow, buildMessage);
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
 *    @param device object for MIDI device
 *    @param entity object for MIDI entity
 */
void entityData(MIDIDeviceRef device, MIDIEntityRef entity) {
    sendMessage(textWindow, @"*****");
    OSStatus status = 0;
    CFStringRef deviceName = NULL;
    CFStringRef entityDisplayName = NULL;
    CFStringRef entityName = NULL;
    SInt32 entityReceivesNotes = 0;
    SInt32 entityTransmitsNotes = 0;
    MIDIObjectGetStringProperty(device, kMIDIPropertyName, &deviceName);
    NSLog(@"Device: %@", deviceName);
    MIDIObjectGetStringProperty(entity, kMIDIPropertyName, &entityName);
    NSLog(@"Entity: %@", entityName);
    status = MIDIObjectGetStringProperty(entity, kMIDIPropertyDisplayName, &entityDisplayName);
    if (status == 0) {
        NSLog(@"               Entity Display Name: %@", entityDisplayName);
    } else if (status == -10835) {
        NSLog(@"               Entity Display Name: property not supported");
    } else {
        logger(@"entity,kMIDIPropertyDisplayName", status);
    }
    status = MIDIObjectGetIntegerProperty(entity, kMIDIPropertyReceivesNotes, &entityReceivesNotes);
    if (status == 0) {
        NSLog(@"               Receives Notes: %d", entityReceivesNotes);
    } else if (status == -10835) {
        sendMessage(textWindow, @"               Receives Notes: property not supported");
    } else {
        logger(@"endpoint,kMIDIPropertyReceivesNotes", status);
    }
    status = MIDIObjectGetIntegerProperty(entity, kMIDIPropertyTransmitsNotes, &entityTransmitsNotes);
    if (status == 0) {
        NSLog(@"               Transmits Notes: %d", entityTransmitsNotes);
    } else if (status == -10835) {
        sendMessage(textWindow, @"               Transmits Notes: property not supported");
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
 *    List property information for a MIDI object.
 *
 *    @param object MIDI object
 */
void objectDictionary(MIDIObjectRef object) {
    // https://crowd.cs.umass.edu/citizen/proxy/CFPropertyList/docs/plist/CFPropertyList.html
    CFPropertyListRef propertyList = NULL;
    OSStatus status = 0;
    status = MIDIObjectGetProperties(object, &propertyList, TRUE);
    if (status != 0) {
        logger(@"object MIDIObjectGetProperties", status);
    }
    listDictionaryLevel(0, propertyList);
}

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

/**
 *   Displays the property list associated with a MIDIObject (Older Version).
 *
 *   @param object MIDIObject whose property list is to be displayed.
 */
void objectDictionary2(MIDIObjectRef object) {
    // https://crowd.cs.umass.edu/citizen/proxy/CFPropertyList/docs/plist/CFPropertyList.html
    CFPropertyListRef propertyList = NULL;
    OSStatus status = 0;
    status = MIDIObjectGetProperties(object, &propertyList, TRUE);
    if (status != 0) {
        logger(@"object MIDIObjectGetProperties", status);
    }
    listDictionaryLevel(0, propertyList);
    // CFStringRef * comment = NULL;
    CFTypeID  typeCode = CFGetTypeID(propertyList);
    NSLog(@"Type of property list: %@", CFCopyTypeIDDescription(typeCode));
    // CFComparisonResult result;
    // https://developer.apple.com/documentation/corefoundation/1516741-cfdictionarygetcount?language=objc
    if (CFStringCompare(CFCopyTypeIDDescription(typeCode), CFSTR("CFDictionary"), 0) == kCFCompareEqualTo) {
    CFIndex count = CFDictionaryGetCount(propertyList);
        NSLog(@"There are %ld entries", count);
        CFStringRef keys[count];
        CFTypeRef values[count];
         CFDictionaryGetKeysAndValues(propertyList, (const void *) &keys, (const void *) &values);
        // CFDictionaryGetKeysAndValues(propertyList, (const void **) keys, (const void **) values);
        int i;
        for (i=0; i < count; i++) {
            NSLog(@"     %@  %@", keys[i], CFCopyTypeIDDescription(CFGetTypeID(values[i])));
        }
    }
}

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

/**
 *   Display contents of a CFArray or CFDictionry object.
 *
 *   @param level This is the depth within the tree structure.  The value for the
 *                initial call should be zero.
 *   @param dictionary The CFArray or CFDictionary object to be listed
 *
 *   <p>The method is called recursively to process the entire tree structure.</p>
 *
 *   https://developer.apple.com/documentation/corefoundation/cfarray?language=objc
 *   https://developer.apple.com/documentation/corefoundation/cfdictionary?language=objc
 */
    void listDictionaryLevel(int level, CFTypeRef dictionary) {
        CFTypeID dictionaryType = CFDictionaryGetTypeID();
        CFTypeID arrayType = CFArrayGetTypeID();
        CFTypeID stringType = CFStringGetTypeID();
        CFTypeID numberType = CFNumberGetTypeID();
        int currentLevel = level;
        CFTypeID typeID = CFGetTypeID(dictionary);
        if (typeID == dictionaryType) {
            CFIndex count = CFDictionaryGetCount(dictionary);
            CFStringRef keys[count];
            CFTypeRef values[count];
            /*  The line with ^ and & was the original line but xCode doesn't like it.  */
            //CFDictionaryGetKeysAndValues(dictionary, (const void *) &keys, (const void *) &values);
            // CFDictionaryGetKeysAndValues(dictionary, (const void **) &keys, (const void **) values);
            int position = 0;
            for (position = 0; position < count; position++) {
                CFTypeRef element = values[position];
                CFTypeID elementTypeID = CFGetTypeID(element);
                if (elementTypeID == numberType) {
                    CFNumberRef element = (CFNumberRef) values[position];
                    SInt32 numericValue;
                    CFNumberGetValue(element,kCFNumberSInt32Type, &numericValue);
                    // NSLog (@"%d", result);
                    NSLog(@"%3d %3d number %@  %d", level, position, keys[position], numericValue);
                } else if (elementTypeID == stringType) {
                    NSLog(@"%3d %3d string %@  %@", level, position, keys[position], (CFStringRef) values[position]);
                    sendMessage(textWindow, buildMessage);
                } else if (elementTypeID == dictionaryType) {
                    NSLog(@"%3d %3d dictionary %@", level, position, keys[position]);
                    sendMessage(textWindow, buildMessage);
                    listDictionaryLevel(currentLevel+1,  values[position]);
                } else if (elementTypeID == arrayType) {
                    NSLog(@"%3d %3d array %@", level, position, keys[position]);
                    sendMessage(textWindow, buildMessage);
                    listDictionaryLevel(currentLevel+1,  values[position]);
                }
            }
        } else if (typeID == arrayType) {
            CFIndex count = CFArrayGetCount(dictionary);
            int position;
            for (position = 0; position < count; position++) {
                CFTypeRef element = CFArrayGetValueAtIndex(dictionary, position);
                CFTypeID elementTypeID = CFGetTypeID(element);
                if (elementTypeID == numberType) {
                    SInt32 numericValue;
                    CFNumberGetValue(element,kCFNumberSInt32Type, &numericValue);
                    buildMessage = [[NSString alloc]
                            initWithFormat:@"%3d %3d number   %d", level, position, numericValue];
                    sendMessage(textWindow, buildMessage);
                } else if (elementTypeID == stringType) {
                    buildMessage = [[NSString alloc]
                            initWithFormat:@"%3d %3d string %@  ", level, position, (CFStringRef) element];
                    sendMessage(textWindow, buildMessage);
                } else if (elementTypeID == dictionaryType) {
                    buildMessage = [[NSString alloc]
                            initWithFormat:@"%3d %3d dictionary ", level, position];
                    sendMessage(textWindow, buildMessage);
                    listDictionaryLevel(currentLevel+1,  element);
                } else if (elementTypeID == arrayType) {
                    buildMessage = [[NSString alloc]
                        initWithFormat:@"%3d %3d array ", level, position];
                    sendMessage(textWindow, buildMessage);
                    listDictionaryLevel(currentLevel+1,  element);
                }
            }
        } else {
            buildMessage = [[NSString alloc] initWithFormat:@"%@ not valid for parameter of listDictionaryLevel",CFCopyTypeIDDescription(typeID)];
            sendMessage(textWindow, buildMessage);
        }
    }

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

/**
 *  Display information on a MIDI endpoint.
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
    NSLog(@"     *****");
    status = MIDIObjectGetStringProperty(device, kMIDIPropertyName, &deviceName);
        logger(@"device,kMIDIPropertyName", status);
    status = MIDIObjectGetStringProperty(entity, kMIDIPropertyName, &entityName);
    logger(@"entity,kMIDIPropertyName", status);
    status = MIDIObjectGetStringProperty(endpoint, kMIDIPropertyName, &endpointName);
        logger(@"endpoint,kMIDIPropertyName", status);
    NSLog(@"          Device: %@", deviceName);
    NSLog(@"          Entity: %@", entityName);
    NSLog(@"          Endpoint: %@", endpointName);
    status = MIDIObjectGetStringProperty(endpoint, kMIDIPropertyDisplayName, &endpointDisplayName);
    if (status == 0) {
         NSLog(@"               Endpoint Display Name: %@", endpointDisplayName);
    } else if (status == -10835) {
        NSLog(@"                Endpoint Display Name: property not supported");
    } else {
        logger(@"endpoint,kMIDIPropertyDisplayName", status);
    }
    status = MIDIObjectGetIntegerProperty(endpoint, kMIDIPropertyReceivesNotes, &endpointReceivesNotes);
    if (status == 0) {
        NSLog(@"               Receives Notes: %d", endpointReceivesNotes);
    } else if (status == -10835) {
        NSLog(@"               Receives Notes: property not supported");
    } else {
    logger(@"endpoint,kMIDIPropertyReceivesNotes", status);
    }
    status = MIDIObjectGetIntegerProperty(endpoint, kMIDIPropertyTransmitsNotes, &endpointTransmitsNotes);
    if (status == 0) {
        NSLog(@"               Transmits Notes: %d", endpointTransmitsNotes);
    } else if (status == -10835) {
        NSLog(@"               Transmits Notes: property not supported");
    } else {
        logger(@"endpoint,kMIDIPropertyTransmitsNotes", status);
    }
    objectDictionary(endpoint);
}


@end
