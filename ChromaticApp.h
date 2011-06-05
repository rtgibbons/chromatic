//
//  ChromaticApp.h
//  Chromatic
//
//  Created by Ryan Gibbons on 2/13/11.
//  Copyright 2011 Warren Douglas. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface ChromaticApp : NSObject <NSWindowDelegate> {
	NSColorPanel *colorPanel;
	
	IBOutlet NSView *colorAccessoryView;
	IBOutlet NSTextField *hexColor;
	IBOutlet NSTextField *rgbColor;
	IBOutlet NSTextField *hslColor;
	IBOutlet NSTextField *cmykColor;
	IBOutlet NSTextField *pantoneColor;
}

- (void)chromatic;
- (NSColor *)correctedColor;
- (NSString *)calculateHex:(NSColor *)color;
- (NSString *)calculateRgb:(NSColor *)color;
- (NSString *)calculateHsl:(NSColor *)color;
- (NSString *)calculateCmyk:(NSColor *)color;
- (NSString *)calculatePantone:(NSColor *)color;

- (IBAction)copyButton:(id)sender;

@end
