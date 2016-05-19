//
//  XFDrawingFuction.m
//  路径
//
//  Created by biznest on 15/5/13.
//  Copyright (c) 2015年 biznest. All rights reserved.
//

#import "XFDrawingFuction.h"

@implementation XFDrawingFuction

/**
 *  圆弧角矩形路径
 *
 *  @param ref    绘图上下文
 *  @param x1     x
 *  @param y1     y
 *  @param width  宽
 *  @param height 高
 *  @param radius 半径
 */
void XFContextAddRoundRect(CGContextRef ref, CGFloat x1, CGFloat y1, CGFloat width, CGFloat height, CGFloat radius)
{
    CGContextMoveToPoint(ref, x1 + radius, y1);
    CGContextAddLineToPoint(ref, x1 + width - radius, y1);
    CGContextAddArcToPoint(ref, x1 + width, y1, x1 + width, y1 + radius, radius);
    CGContextAddLineToPoint(ref, x1 + width, y1 + height - radius);
    CGContextAddArcToPoint(ref, x1 + width, y1 + height, x1 + width - radius, y1 + height, radius);
    CGContextAddLineToPoint(ref, x1 + width -radius, y1 + height);
    CGContextAddArcToPoint(ref, x1, y1 + height, x1, y1 + height - radius, radius);
    CGContextAddLineToPoint(ref, x1, y1 + radius);
    CGContextAddArcToPoint(ref, x1, y1, x1 + radius, y1, radius);
}

/**
 *  n角星
 *
 *  @param ref     绘图上下文
 *  @param n       角数
 *  @param centerX 中心位置x
 *  @param centerY y
 *  @param size    大小
 */
void XFContextAddStar(CGContextRef ref, NSUInteger n, CGFloat centerX, CGFloat centerY, NSUInteger size)
{
    CGFloat dig = 4 * M_PI / n;
    CGContextMoveToPoint(ref, centerX, centerY + size);
    for (int i = 1; i <= n; i++) {
        CGFloat x = sin(i * dig);
        CGFloat y = cos(i * dig);
        CGContextAddLineToPoint(ref, centerX + x * size, centerY + y * size);
    }
//    CGContextAddLineToPoint(ref, centerX, centerY + size);
}

/**
 *  绘制花朵
 *
 *  @param ref
 *  @param n      花瓣数目
 *  @param x      花朵中心
 *  @param y
 *  @param size   花朵大小
 *  @param length 花瓣长度
 */
void XFContextAddFlower(CGContextRef ref, NSUInteger n, CGFloat dx, CGFloat dy, CGFloat size, CGFloat length)
{
    CGContextMoveToPoint(ref, dx, dy + size);
    CGFloat dig = 2 * M_PI / n;
    
    for (int i = 1; i < n + 1; i ++) {
        CGFloat ctrX = sin((i - 0.5) * dig) * length + dx;
        CGFloat ctrY = cos((i - 0.5) * dig) * length + dy;
    
        CGFloat endX = sin(i * dig) * size + dx;
        CGFloat endY = cos(i * dig) * size + dy;
        
        CGContextAddQuadCurveToPoint(ref, ctrX, ctrY, endX, endY);
    }
}

@end
