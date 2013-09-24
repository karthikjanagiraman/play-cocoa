//
//  PLAChannelsWindowController.m
//  Play Cocoa
//
//  Created by Jon Maddox on 9/24/13.
//  Copyright (c) 2013 GitHub, Inc. All rights reserved.
//

#import "PLAChannelsWindowController.h"
#import "PLAController.h"

@interface PLAChannelsWindowController ()

@property (retain) NSArray *channels;
@property (nonatomic, retain) IBOutlet NSTableView *tableView;

- (void)updateChannels;

@end

@implementation PLAChannelsWindowController

- (id)init
{
	self = [super initWithWindowNibName:@"PLAChannelsWindowController"];
	if (self == nil)
		return nil;
	  
	return self;
}

- (void)windowDidLoad
{
  [super windowDidLoad];
	[self.window setOpaque:NO];
	self.window.backgroundColor = [NSColor greenColor];
	[self.window setLevel:NSFloatingWindowLevel];
  
  [self updateChannels];
}

- (void)updateChannels
{
  [[PLAController sharedController] updateChannelsWithCompletionBlock:^{
    self.channels = [[PLAController sharedController] channels];
  }];
}

@end