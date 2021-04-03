#  BlockStudy

I am trying to understand how to use the MIDINotifyBlock and MIDIReceiveBlock block structures
(also known as closures) for use with the CoreMIDI framework in macOS.  As I understand it, there are three locations associated with the Objective-C blocks.

* The location where the block is declared.
* The place where the block is defined.
* The place where the block is called.

The block is a cross between a variable and a function.

## References

* [Blocks Programming Topics](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Blocks/Articles/00_Introduction.html)
* [Programming with Objective-C, Working With Blocks](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/WorkingwithBlocks/WorkingwithBlocks.html)
* [CoreMIDI Technology](https://developer.apple.com/documentation/coremidi?language=objc)
* [Dispatch Queue](https://developer.apple.com/documentation/dispatch/dispatchqueue)
* [Using Grand Central Dispatch](https://apple.github.io/swift-corelibs-libdispatch/tutorial/)
* [Dispatch Main Queue Doesn't Work With Modal Windows on macOS X)](https://www.thecave.com/2015/08/10/dispatch-async-to-main-queue-doesnt-work-with-modal-window-on-mac-os-x/)
* [Understanding Objective-C Blocks, Envato tuts+](https://code.tutsplus.com/tutorials/understanding-objective-c-blocks--mobile-14319)