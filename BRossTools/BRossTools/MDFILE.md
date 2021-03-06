## BRossTools

This is a test of code to exercise the Xcode system.  One of my goals was to avoid the use of Interface Builder except for attaching items in the menu bar to various programs.  The GitHub documentation for BRossTools is located at  [https://bradleyross.github.io/ObjectiveC-Examples/BRossTools](This is a test of code to exercise the Xcode system.  One of my goals was to avoid the use of Interface Builder except for attaching items in the menu bar to various programs.  The GitHub documentation for BRossTools is located at  
[https://bradleyross.github.io/ObjectiveC-Examples/Documentation/BRossTools](https://bradleyross.github.io/ObjectiveC-Examples/Documentation/BRossTools)




####Files

* BRossTools.h and BRossTools.m contain a set of Objective-C classes that are under development that will be used as a library to assist programmers.
* LocalClasses.h and BRossTools.m contain Objective-C classes that are being used to understand the technologies used in the development of MacOS applications.
* The file AppDelegate.m has been modified to create a menu upon opening the application that can be used to call the other components contained in the application. 
* The files MIKMIDIsamples.h and MIKMIDIsamples.m contain examples for using MIKMIDI from Andrew Marsden

####  Mapping to main menu


#### Apple Documentation

The following is a list of documentation from Apple that can be used to create, modify, and understand this code.

* [Documentation - Apple Technologies](https://developer.apple.com/documentation/technologies) - This appears to represent the current API's.

* [Documentation Archive](https://developer.apple.com/library/archive/navigation/)
 

* [Programming With Objective-C](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html#//apple_ref/doc/uid/TP40011210-CH1-SW1)

* [Document-Based App Programming Guide](https://developer.apple.com/library/archive/documentation/DataManagement/Conceptual/DocBasedAppProgrammingGuideForOSX/Introduction/Introduction.html#//apple_ref/doc/uid/TP40011179)

*  [Concurrency Programming Guide](https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40008091)

*  [Migrating away from threads](https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/ThreadMigration/ThreadMigration.html#//apple_ref/doc/uid/TP40008091-CH105-SW1)


*  [Thread Programming Guide](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Multithreading/Introduction/Introduction.html#//apple_ref/doc/uid/10000057)

* [Text System User Interface Layer Programming Guide](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/TextUILayer/Tasks/TextInScrollView.html)

* [Cocoa Core Competencies](https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/Introduction.html#//apple_ref/doc/uid/TP40008195-CH68-DontLinkElementID_2) - Some parts may require updating in order to represent current best practices.

* [String Programming Guide](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Strings/Articles/formatSpecifiers.html)

* [Auto Layout Guide](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/index.html#//apple_ref/doc/uid/TP40010853)

*  [Blocks Programming Topics](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Blocks/Articles/00_Introduction.html#//apple_ref/doc/uid/TP40007502-CH1-SW1)

#### Apple Objective-C Classes

The following list provides links the Apple documentation that describe some of the various classes used in the program..

* [Audio Toolbox](https://developer.apple.com/documentation/audiotoolbox/music_player?language=objc) I need more information on this.

* [AVAudioEngine](https://developer.apple.com/documentation/avfaudio/avaudioengine?language=objc)
(AVFAudio -> Audio Engine -> AVAudioEngine)</a>  The methods for this class include a number of
methods having the format connectMIDI... and disconnectMIDI...

* [AVAudioSequencer](https://developer.apple.com/documentation/avfaudio/avaudiosequencer?language=objc) 
(AVFAudio -> Audio Engine -> AVAudioSequencer)

* [AVAudioUnitMIDIInstrument](https://developer.apple.com/documentation/avfaudio/avaudiounitmidiinstrument?language=objc) 
(AVFAudio -> Audio Engine -> AVAudioUnitMIDIInstrument)</a>  It appears that  sendProgramChange:onChannel sends a program   (instrument change) while sendProgramChange:bankMSB:bankLSB:onChannel changes both program and sound bank.  This would imply a need to change the instrument choice whenever you change the sound bank.

* [AVAudioUnitSampler](https://developer.apple.com/documentation/avfaudio/avaudiounitsampler?language=objc) 
(AVFAudio -> Audio Engine -> AVAudioUnitSampler)

* [NSBundle](https://developer.apple.com/documentation/foundation/nsbundle) 
(Foundation -> Resources -> NSBundle)

* [NSError](//developer.apple.com/documentation/foundation/nserror?language=objc) 
(Foundation -> Errors and Exceptions -> NSError) [(EEZY Tutorials)](https://eezytutorials.com/ios/nserror-by-example.php#.YLPzRC1h1pQ) [(Error Handling  Programming Guide: Using and Creating Error Objects)](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ErrorHandlingCocoa/CreateCustomizeNSError/CreateCustomizeNSError.html)


* [NSException](https://developer.apple.com/documentation/foundation/nsexception?language=objc) 
(Foundation -> Errors and Exceptions -> NSException)</a></li>

* [NSThread](https://developer.apple.com/documentation/foundation/nsthread?language=objc)
(Foundation -> Processes and Threads -> NSThread)

* [NSTimer](https://developer.apple.com/documentation/foundation/nstimer?language=objc)
 (Foundation -> TaskManagement -> NSTimer)</a></li>




#### MIDI programming using CoreMIDI

* [Core MIDI](https://developer.apple.com/documentation/coremidi?language=objc)

* [Core MIDI -- MIDI Services] (https://developer.apple.com/documentation/coremidi/midi_services?language=objc)

* ["Reading from external controllers with CoreMIDI", Yet Another Learn Cocoa With Me Blog, 21- August-2011](http://comelearncocoawithme.blogspot.com/2011/08/reading-from-external-controllers-with.html) -- The contents of this blog entry have been implemented in the class BRossToolsMIDIListenForInput2.

* Andrew Madsen has developed an Objective-C library named mikmidi.  There is a [GitHub repository](https://github.com/mixedinkey-opensource/MIKMIDI).  He also has [blog](https://blog.andrewmadsen.com/2014/05/19/mikmidi-a-new.html) and [tumblr](https://armadsen.tumblr.com/post/86220316345/mikmidi-a-new-objective-c-midi-library) entries for the package.  Documentation can be found on [CocoaDocs.org](http://cocoadocs.org/docsets/MIKMIDI/1.6.1/)  


    * MIKMIDI uses the following packages
         * LibXML2
         * Audio Unit
         * Audio Toolbox
         * AppKit
         * CoreData
         * CoreMIDI
         * Cocoa
         * Foundation     

####  Audio Toolbox

* [Audio Toolbox -> Music Player](https://developer.apple.com/documentation/audiotoolbox/music_player?language=objc)
* [AVFAudio -> Audio Engine -> AVAudioSequencer](https://developer.apple.com/documentation/avfaudio/avaudiosequencer?language=objc)
* [GitHub project - AudioKit/MIDISequencer](https://github.com/AudioKit/MIDISequencer)
* [AVFAudio -> Audio Engine -> AVFAudioUnitMIDIInstrument](https://developer.apple.com/documentation/avfaudio/avaudiounitmidiinstrument?language=objc)
* [Audio Toolbox -> Audio Unit v3 Plug-In -> AUAudioUnit](https://developer.apple.com/documentation/audiotoolbox/auaudiounit?language=objc)

####  MIDI documentation

* [Details about MIDI 2.0&trade;, MIDI-CI, Profiles and Property Exchange", MIDI ](https://www.midi.org/midi-articles/details-about-midi-2-0-midi-ci-profiles-and-property-exchange) -- Although this article describes the MIDI 2.0 standard, the full set of specifications has not yet been released to the general public, but only to corporate members of the Association.

* "Official MIDI Specifications", MIDI&trade; Association, [https://www.midi.org/specifications/midi1-specifications](https://www.midi.org/specifications/midi1-specifications)  -- You will need to join the MIDI&trade; Association before you can download the files.  However, there is a free membership level. 

* ["Discover MIDI", imitone](https://imitone.com/discover-midi/) -- This appears to be the best laid-out guide to MIDI that I have seen to this date.  The amount of information on programming is limited, but should help to explain the Apple documentation for CoreMidi.

* "MIDI Tutorial For Programmers", Carnegie Mellon University [https://www.cs.cmu.edu/~music/cmsip/readings/MIDI%20tutorial%20for%20programmers.html](https://www.cs.cmu.edu/~music/cmsip/readings/MIDI%20tutorial%20for%20programmers.html) -- Warning: Files with URL's like this have a habit of vanishing without warning.

*  ["Working With MIDI", Audiobus](https://developer.audiob.us/doc/_working-_with-_m_i_d_i.html)

* https://stackoverflow.com/questions/8795749/coremidi-logging-received-midi-messages-to-an-nstextfield

*  [GitHub project AVFoundationMIDIPlay](https://github.com/genedelisa/AVFoundationMIDIPlay)

#### Electronic Music
The following are some sources of files for electronic music.

* [Musical Artifacts DLS](https://musical-artifacts.com/artifacts?formats=dls)
* [Musical Artifacts SF2](https://musical-artifacts.com/artifacts?formats=sf2)

