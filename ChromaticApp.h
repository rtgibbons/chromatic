//
//  ChromaticApp.h
//  Chromatic
//
//  Created by Ryan Gibbons on 2/13/11.
//  Copyright 2011 Warren Douglas. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface ChromaticApp : NSObject {
	NSColorPanel *colorPanel;
	
	IBOutlet NSView *colorAccessoryView;
	IBOutlet NSTextField *hexColor;
	IBOutlet NSTextField *rgbColor;
	IBOutlet NSTextField *hslColor;
	IBOutlet NSTextField *cmykColor;
	IBOutlet NSTextField *pantoneColor;
}

- (void)chromatic;

@end
