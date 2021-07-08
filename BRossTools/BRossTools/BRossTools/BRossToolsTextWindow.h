//
//  BRossToolsTextWindow.h
//  BRossTools
//
//  Created by Bradley Ross on 7/8/21.
//

#ifndef BRossToolsTextWindow_h
#define BRossToolsTextWindow_h
#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AVFAudio/AVFAudio.h>
/**
 * @brief Creates a scrolling window for handling text.
 *
 * For information on how to include links to fields, methods, classes, etc,
 *  see <a href="https://www.doxygen.nl/manual/autolink.html" target="_blank">
 *  click here</a>.
 *
 *  For information on autoscrolling,
 *  <a href="https://pinkstone.co.uk/how-to-keep-a-uitextview-scrolled-to-the-bottom/" target="_blank">
 *  click here</a>
  */
@interface BRossToolsTextWindow:NSTextView {
    
    /**
     @brief pointer to the object for the instance.
     */
    BRossToolsTextWindow *pointer;
    /**
       @brief Instance variable containing the storage object for the window.
     */
    NSTextStorage *stringContents;
    /**
    @brief Instance variable containing scroll view for the text window.
    @see getNSScrollView

    For Apple documentation on NSScrollView, <a href="https://developer.apple.com/documentation/appkit/nsscrollview?language=objc" target="_blank">
     click here</a>.
     */
    NSScrollView *scrollview;
    /**
       @brief   Instance variable pointing to NSTextView object for window.a
       @see getNSTextView
     */
    NSTextView *theTextView;
    
    /**
    @brief Instance variable pointing to NSViewController for window.
    @see getNSViewController
     */
    NSViewController *viewController;
    /**
   @brief  Window layer containing NSText object.
     */
    NSWindow *newPanel;
    /**
    @brief  Window actually visible to user.
     */
    NSWindow *displayPanel;
    /**
     @brief Use autoscrolling?
     */
    BOOL autoscroll;
}
/**
      Allocates a new text window and then calls initTextWindow to finish the initialization..
    @returns identifier for text window
 */
+(instancetype) newWindow;
- (void)initTextWindow;
- (NSString *) getTitle;
- (void) setTitle:(NSString *)title;
/**
      Append an NSString object to the panel/window created by the class.
 
      @param string     character string to be appended to window
 */
- (void)appendString:(NSString *)string;
/**
       Append a formatted string to the display window where the first parameter is the
              format to be used and the following fields are the items to be formatted.
 
        @param format --  format string folllowed by items to be formatted.  The resulting
                                formatted string is suffixed to the text window.
 */
- (void)appendFormat:(NSString *)format, ...;
/**
 @brief Obtain NSViewController object
 @see #viewController
 @return NSViewController object
 */
- (NSViewController *) getNSViewController;
/**
 @brief Obtain NSTextStorage object
 @see #stringContents
 @return NSTextStorage object
 */
- (NSTextStorage *) getNSTextStorage;
/**
 @brief Obtain NSScrollView object
 @see #scrollview
 @return NSscrollView instance
 */
- (NSScrollView *) getNSScrollView;
/**
 @brief Obtain NSTextView object
 @see #theTextView
 @return NSTextView object
 */
- (NSTextView *) getNSTextView;
-(BOOL) getAutoscroll;
-(void) setAutoscroll:(BOOL) value;
@end

//  *****  *****  *****  *****
//  *****  *****  *****  *****
#endif /* BRossToolsTextWindow_h */
