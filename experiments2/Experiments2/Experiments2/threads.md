The MIDIReceiveBlock passes the MIDIEventLists by address.  What assurance is there that the
structure indicated by the pointer will remain unchanged until the program finishes reading the 
event list using the MIDIReceiveBlock.  Can there be multiple copies of the 
MIDIReceiveBlock running at one time.
