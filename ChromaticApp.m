//
//  ChromaticApp.m
//  Chromatic
//
//  Created by Ryan Gibbons on 2/13/11.
//  Copyright 2011 Warren Douglas. All rights reserved.
//

#import "ChromaticApp.h"

@implementation ChromaticApp



- (id)init {
	if (self = [super init]) {
		colorPanel = [NSColorPanel sharedColorPanel];
		
		
		[colorPanel setTitle:@"Chromatic"];
		[colorPanel setShowsAlpha:YES];
		[colorPanel makeKeyAndOrderFront:self];
		
		[colorPanel setTarget:self];
		[colorPanel setAction:@selector(chromatic)];
	}
	return self;
}

- (void)chromatic {
	//Start Doing Stuff
}


@end
