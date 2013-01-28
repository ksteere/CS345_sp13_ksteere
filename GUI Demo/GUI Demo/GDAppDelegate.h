//
//  GDAppDelegate.h
//  GUI Demo
//
//  Created by Guest User on 1/23/13.
//  Copyright (c) 2013 Guest User. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface GDAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *theTextField;
- (IBAction)do_Hello:(id)sender;
- (IBAction)do_Goodbye:(id)sender;

@end
