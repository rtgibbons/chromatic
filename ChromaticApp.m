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
		[colorPanel setHidesOnDeactivate:NO];
		[colorPanel makeKeyAndOrderFront:self];	
		
		[colorPanel setTarget:self];
		[colorPanel setAction:@selector(chromatic)];
	}
	return self;
}

- (void)awakeFromNib {
	[colorPanel makeKeyAndOrderFront:self];
	[colorPanel setAccessoryView:colorAccessoryView];
	[self chromatic];
}

- (void)chromatic{
	NSColor *color = [self correctedColor];
	
	[hexColor setStringValue:[self calculateHex:color]];
	[rgbColor setStringValue:[self calculateRgb:color]];
	[hslColor setStringValue:[self calculateHsl:color]];
}

- (NSString *) calculateHex:(NSColor *)color {
	return [NSString stringWithFormat:@"%02X%02X%02X",
		   (unsigned int)(255*[color redComponent]),
		   (unsigned int)(255*[color greenComponent]),
		   (unsigned int)(255*[color blueComponent])];
}

- (NSString *) calculateRgb:(NSColor *)color {
	NSString *r; NSString *g; NSString *b;
	
	r = [NSString stringWithFormat:@"%d", (unsigned int)(255*[color redComponent])];
	g = [NSString stringWithFormat:@"%d", (unsigned int)(255*[color greenComponent])];
	b = [NSString stringWithFormat:@"%d", (unsigned int)(255*[color blueComponent])];
	
	return [NSString stringWithFormat:@"%@, %@, %@", r, g, b];
}

- (NSString *) calculateHsl:(NSColor *)color {
	NSString *h; NSString *s; NSString *l;
	
	CGFloat hi = 0.0; CGFloat li = 0.0; CGFloat si = 0.0;
	//Gathered formula below from http://ariya.blogspot.com/2008/07/converting-between-hsl-and-hsv.html
	hi = [color hueComponent];
	li = (2 - [color saturationComponent]) * [color brightnessComponent];
	si = [color saturationComponent] * [color brightnessComponent];
	si = (li == 0) ? 0 : (si /= (li <= 1) ? (li) : 2 - (li));
	li /= 2;
	
	//NSLog(@"hsl float: %f %f %f", (360*hi), (100*si), (100*li));
	//NSLog(@"hsl values: %d %d %d", (unsigned int)(hi*360+0.5), (unsigned int)(si*100+0.5), (unsigned int)(li*100+0.5));
	h = [NSString stringWithFormat:@"%d", (unsigned int)(hi*360+0.5)];
	s = [NSString stringWithFormat:@"%d", (unsigned int)(si*100+0.5)];
	l = [NSString stringWithFormat:@"%d", (unsigned int)(li*100+0.5)];
	
	return [NSString stringWithFormat:@"%@, %@%%, %@%%", h, s, l];
}

- (NSString *)calculateCmyk:(NSColor *)color {
	return @"<unknown";
}

- (NSString *)calculatePantone:(NSColor *)color {
	return @"<unknown>";
}

- (NSColor *)correctedColor {
	BOOL shouldGenerateDevice = TRUE;
	return [[colorPanel color] colorUsingColorSpaceName:(shouldGenerateDevice ? NSDeviceRGBColorSpace : NSCalibratedRGBColorSpace)];
}

- (BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *) theApplication {
    return YES;
}

@end
