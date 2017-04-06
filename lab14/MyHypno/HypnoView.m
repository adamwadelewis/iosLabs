//
//  HypnoView.m
//  MyHypno
//
//  Created by Adam Lewis on 7/3/13.
//  Copyright (c) 2013 Athens State University. All rights reserved.
//

#import "HypnoView.h"

@implementation HypnoView

@synthesize circleColor;

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setBackgroundColor: [UIColor clearColor]];
        [self setCircleColor:[UIColor lightGrayColor]];
        colors = [[NSMutableArray alloc] init];
        for (int i = 0; i <= 9; i++)
        {
            [colors addObject:
             [[UIColor alloc] initWithRed: (i / 10.0)
                    green: 0.6
                     blue: 0.6
                    alpha: 0.6]];
        }
    }
    return self;
}

- (UIColor *) getNewColor
{
    int indx = rand() % 10;
    return [colors objectAtIndex: indx];
}

- (void) drawRect: (CGRect) dirtyRect
{
    // Get the current context and bound
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    // Find the center of the bounds rect.  This will require some maths
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    // Make the radius of the circle as nearly as big as the view
    float maxRadius = hypot(bounds.size.width,bounds.size.height) / 2.0;
    // Draw concentric circles from the outside in
    [[self circleColor] setStroke];
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20)
    {
        // Add a path to the context
        CGContextAddArc( ctx, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        // Perform drawing instruction; removes path
        CGContextStrokePath( ctx);
    }
    CGContextSaveGState(ctx);
    NSString *text = @"You are getting sleepy";
    // Get a font to draw it in
    UIFont *font = [UIFont boldSystemFontOfSize: 28];
    CGRect textRect;
    // Figure out the size of this string in this font
    textRect.size = [text sizeWithFont: font];
    // Now write the string into the center of the view
    textRect.origin.x = center.x - textRect.size.width / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    // Set the fill color to the current context to black
    [[UIColor blackColor] setFill];
    CGSize offset = CGSizeMake(4, 3);
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    CGContextSetShadowWithColor(ctx, offset, 2.0, color);
    
    // Now draw the string
    [text drawInRect:textRect withFont:font];
    CGContextRestoreGState(ctx);
    [[UIColor blueColor] setStroke];
    CGContextMoveToPoint(ctx, center.x, center.y-100);
    CGContextAddLineToPoint(ctx, center.x, center.y+100);
    CGContextStrokePath(ctx);
    
    CGContextMoveToPoint(ctx, center.x-100, center.y);
    CGContextAddLineToPoint(ctx, center.x+100, center.y);
    CGContextStrokePath(ctx);
}

- (BOOL) canBecomeFirstResponder
{
    return YES;
}

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake) {
        NSLog(@"Device began shaking");
        [self setCircleColor: [self getNewColor]];
    }
}

- (void) setCircleColor: (UIColor *)clr
{
    circleColor = clr;
    [self setNeedsDisplay];
}
@end
