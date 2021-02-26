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
            if ([message isEqualToString:@"b6"]) {
                [CoreMidiSample1 runtest2];
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
    
    BRossToolsButton *b6 = [BRossToolsButton initUsingObjectIdent:self selector:@selector(bleep:) caption:@"run test4b - CoreMidiDemo2" ident:@"b6" ];
    
    NSStackView *stackView = [NSStackView stackViewWithViews:@[b1, b2, b3, b4, b5, b6]];
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

void deviceData(MIDIDeviceRef deviceId);
void elapsed(void);
/**
 Sends a NSString to a BRossToolsTextWindow
 @brief sends string to a text window
 @param window BRossTools window to be used
 @param message NSString message to be sent
 */
void sendMessage2(BRossToolsTextWindow *window, NSString *message);
void sendMessage(NSString *message);
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
static BRossToolsTextWindow *textWindowStorage = nil;

//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
/**
 First program for getting data on MIDI components.
 
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
    [[self textWindow] setTitle:@"test4 -- CoreMidiSample1"];
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
 This is the second example of obtaining information on MIDI components.
 
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
            buildMessage = [[NSString alloc] initWithFormat:@"CLOCKS_PER_SEC: %d", CLOCKS_PER_SEC];
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




//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****
//  *****  *****  *****  *****  *****

/**
 *   Display contents of a CFArray or CFDictionary object.
 *
 *   @param level This is the depth within the tree structure.  The value for the
 *                initial call should be zero.
 *   @param dictionary The CFArray or CFDictionary object to be listed
 *
 *   <p>The method is called recursively to process the entire tree structure.</p>
 *
 *   https://developer.apple.com/documentation/corefoundation/cfarray?language=objc
 *   https://developer.apple.com/documentation/corefoundation/cfdictionary?language=objc
 *
 *    Since this can   be callled recursively, there is a problem with recursion erasing data.  So there needs to be a version
 *          that has data that can be associated with the level of recursion.
 *
 *          Called by objectDictionary
 *
 */
    void listDictionaryLevel(int level, CFTypeRef dictionary) {
        buildMessage = [[NSString alloc]initWithFormat:@"listDictionaryLevel level %d", level];
        sendMessage(buildMessage);
        CFTypeID dictionaryType = CFDictionaryGetTypeID();
        CFTypeID arrayType = CFArrayGetTypeID();
        CFTypeID stringType = CFStringGetTypeID();
        CFTypeID numberType = CFNumberGetTypeID();
        int currentLevel = level;
        CFStringRef *keysByLevel[20];
        CFTypeRef *valuesByLevel[20];
        CFTypeID typeID = CFGetTypeID(dictionary);
        /*
         https://stackoverflow.com/questions/2283466/how-to-enumerate-cfproperylist-cfdictionary-keys

         CFDictionaryRef dict = CFDictionaryCreate(...)
         size size = CFDictionaryGetCount(dict);
         CFTypeRef *keysTypeRef = (CFTypeRef *) malloc( size * sizeof(CFTypeRef) );
         CFDictionaryGetKeysAndValues(dict, (const void **) keysTypeRef, NULL);
         const void **keys = (const void **) keysTypeRef;
         */
        NSString *spacer;
        if (currentLevel % 5 == 0 ) { spacer = @" ";} else
        if (currentLevel % 5 == 1 ) { spacer = @"    ";} else
        if (currentLevel % 5 == 2 ) { spacer = @"       ";} else
        if (currentLevel % 5 == 3 ) { spacer = @"          ";} else
        if (currentLevel % 5 == 4 ) { spacer = @"             ";} else
        if (currentLevel % 5 == 5 ) { spacer = @"                ";}
        if (typeID == dictionaryType) {
            CFIndex count = CFDictionaryGetCount(dictionary);
            CFStringRef *keysTypeRef = (CFStringRef *) malloc(count*sizeof(CFStringRef*) );
                if (keysTypeRef == NULL) { NSLog(@"keysTypeRef not allocated"); }
                keysByLevel[currentLevel] = keysTypeRef;
            CFTypeRef *valuesTypeRef = (CFTypeRef *) malloc (count*sizeof(CFTypeRef*));
                if (valuesTypeRef == NULL) { NSLog(@"valuesTypeRef not allocated");}
                valuesByLevel[currentLevel] = valuesTypeRef;
            CFDictionaryGetKeysAndValues(dictionary, (const void **)keysTypeRef, (const void **)valuesTypeRef);
            const void **keys  = (const void **) keysTypeRef;
            const void **values = (const void **) valuesTypeRef;
            /*
             * The line calling the CFDictionaryGetKeys and Values is shown below.  This was
             * rejected by the current version of Xcode, possibly because Xcode is now
             * applying additional type checking, and the original line was a hack with
             * implied casts.
             *
             * CFDictionaryGetKeysAndValues(dictionary, (const void *) &keys, (const void *) &values);
             */
            int position = 0;
            for (position = 0; position < count; position++) {
                CFTypeRef element = values[position];
                CFTypeID elementTypeID = CFGetTypeID(element);
                if (elementTypeID == numberType) {
                    CFNumberRef element = (CFNumberRef) values[position];
                    SInt32 numericValue;
                    CFNumberGetValue(element,kCFNumberSInt32Type, &numericValue);
                    // NSLog (@"%d", result);
                    buildMessage = [[NSString alloc] initWithFormat:@"%@%3d %3d number %@  %d", spacer, level, position, keys[position], numericValue];
                    sendMessage(buildMessage);
                } else if (elementTypeID == stringType) {
                    NSString *buildMessage = [[NSString alloc]
                            initWithFormat:@"%@%3d %3d string %@  %@", spacer, level, position, keys[position], (CFStringRef) values[position]];
                    sendMessage(buildMessage);
                } else if (elementTypeID == dictionaryType) {
                    NSString *buildMessage = [[NSString alloc]
                        initWithFormat:@"%@%3d %3d dictionary %@", spacer, level, position, keys[position]];
                    sendMessage(buildMessage);
                    listDictionaryLevel(currentLevel+1,  values[position]);
                } else if (elementTypeID == arrayType) {
                    NSString *buildMessage = [[NSString  alloc] initWithFormat:@"%@%3d %3d array %@", spacer, level, position, keys[position] ];
                    sendMessage(buildMessage);
                    listDictionaryLevel(currentLevel+1,  values[position]);
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
                            initWithFormat:@"%@%3d %3d number   %d", spacer, level, position, numericValue];
                    sendMessage(buildMessage);
                } else if (elementTypeID == stringType) {
                    buildMessage = [[NSString alloc]
                            initWithFormat:@"%@%3d %3d string %@  ", spacer, level, position, (CFStringRef) element];
                    sendMessage(buildMessage);
                } else if (elementTypeID == dictionaryType) {
                    buildMessage = [[NSString alloc]
                            initWithFormat:@"%@%3d %3d dictionary ", spacer, level, position];
                    sendMessage(buildMessage);
                    listDictionaryLevel(currentLevel+1,  element);
                } else if (elementTypeID == arrayType) {
                    buildMessage = [[NSString alloc]
                        initWithFormat:@"%@%3d %3d array ", spacer, level, position];
                    sendMessage(buildMessage);
                    listDictionaryLevel(currentLevel+1,  element);
                }
            }
        } else {
            buildMessage = [[NSString alloc] initWithFormat:@"%@%@ not valid for parameter of listDictionaryLevel",spacer, CFCopyTypeIDDescription(typeID)];
            sendMessage(buildMessage);
        }
       
        
    }

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
    objectDictionary(endpoint);
}


@end
