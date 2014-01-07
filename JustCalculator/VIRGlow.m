//
//  VIRGlow.m
//  Calculator
//
//  Created by Administrator on 13.12.13.
//  Copyright (c) 2013 Administrator. All rights reserved.
//

#import "VIRGlow.h"

@implementation VIRGlow

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
	
    CGFloat r = (CGFloat)(arc4random() % 256) / 255;
    CGFloat g = (CGFloat)(arc4random() % 256) / 255;
    CGFloat b = (CGFloat)(arc4random() % 256) / 255;
    
    UIColor *insideColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0f];
	UIColor *outlineColor = [UIColor colorWithRed:r green:g blue:b alpha:0.8f];
	UIColor *blurColor = [UIColor colorWithRed:r green:g blue:b alpha:0.7f];
    
	CGContextSetStrokeColorWithColor(ctx, outlineColor.CGColor);
	CGContextSetFillColorWithColor(ctx, insideColor.CGColor);
	CGContextSetLineWidth(ctx, self.font.pointSize / 30.0);
	CGContextSetShadowWithColor(ctx, CGSizeMake(0, 0), self.font.pointSize / 7.0, blurColor.CGColor);
	CGContextSetTextDrawingMode(ctx, kCGTextFillStroke);
	
    NSMutableParagraphStyle *textStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    
    textStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    textStyle.alignment = NSTextAlignmentRight;
        
    [self.text drawInRect:self.bounds withAttributes:@{NSFontAttributeName:self.font, NSParagraphStyleAttributeName: textStyle}];
}


@end
