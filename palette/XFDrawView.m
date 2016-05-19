//
//  XFDrawView.m
//  涂鸦板
//
//  Created by biznest on 15/5/13.
//  Copyright (c) 2015年 biznest. All rights reserved.
//

#import "XFDrawView.h"
#import "XFDrawingFuction.h"

@interface XFDrawView ()
{
    CGPoint firstTouch, prevTouch, lastTouch;
    CGContextRef ref;
    UIImage *image;
}
@end

@implementation XFDrawView
//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        self.color = [UIColor redColor];
//        UIGraphicsBeginImageContext(frame.size);
//        ref = UIGraphicsGetCurrentContext();
//    }
//    return self;
//}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.color = [UIColor redColor];
        self.shape = XFLineShape;
        self.frame = [UIScreen mainScreen].bounds;
        UIGraphicsBeginImageContext(self.frame.size);
        ref = UIGraphicsGetCurrentContext();
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    firstTouch = [touch locationInView:self];
    if (self.shape == XFPenShape) {
        prevTouch = firstTouch;
    }
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    lastTouch = [touch locationInView:self];
    if (self.shape == XFPenShape) {
        [self drawWithRef:ref];
        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    lastTouch = [touch locationInView:self];
    [self drawWithRef:ref];
    image = UIGraphicsGetImageFromCurrentImageContext();
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [image drawAtPoint:CGPointZero];
    [self drawWithRef:ctx];
}

- (CGRect)curRect
{
    return CGRectMake(firstTouch.x, firstTouch.y, lastTouch.x - firstTouch.x, lastTouch.y - firstTouch.y);
}

- (void)drawWithRef:(CGContextRef)ctx
{
    CGContextSetStrokeColorWithColor(ctx, self.color.CGColor);
    CGContextSetFillColorWithColor(ctx, self.color.CGColor);
    CGContextSetLineWidth(ctx, 2.0f);
    CGContextSetShouldAntialias(ctx, YES);
    
    switch (self.shape) {
            
            
        case XFLineShape:       //线
        {
            CGContextMoveToPoint(ctx, firstTouch.x, firstTouch.y);
            CGContextAddLineToPoint(ctx, lastTouch.x, lastTouch.y);
            CGContextStrokePath(ctx);
        }
            break;
        case XFRectShape:       //矩形
        {
            CGContextFillRect(ctx, [self curRect]);
        }
            break;
        case XFEllipseShape:    //椭圆
        {
            CGContextFillEllipseInRect(ctx, [self curRect]);
        }
            break;
        case XFRoundRectShape:  //圆角矩形
        {
            CGFloat leftX = firstTouch.x<lastTouch.x?firstTouch.x:lastTouch.x;
            CGFloat leftY = firstTouch.y<lastTouch.y?firstTouch.y:lastTouch.y;
            XFContextAddRoundRect(ctx, leftX, leftY, fabs(lastTouch.x-firstTouch.x), fabs(lastTouch.y-firstTouch.y), 16);
            CGContextFillPath(ctx);
        }
            break;
        case XFPenShape:        //铅笔
        {
            CGContextMoveToPoint(ctx, prevTouch.x, prevTouch.y);
            CGContextAddLineToPoint(ctx, lastTouch.x, lastTouch.y);
            CGContextStrokePath(ctx);
            prevTouch = lastTouch;
        }
            break;
        default:
            break;
    }
    
}

@end
