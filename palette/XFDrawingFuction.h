//
//  XFDrawingFuction.h
//  路径
//
//  Created by biznest on 15/5/13.
//  Copyright (c) 2015年 biznest. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XFDrawingFuction : NSObject

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
void XFContextAddRoundRect(CGContextRef ref, CGFloat x1, CGFloat y1, CGFloat width, CGFloat height, CGFloat radius);

/**
 *  n角星
 *
 *  @param ref     绘图上下文
 *  @param n       角数
 *  @param centerX 中心位置x
 *  @param centerY y
 *  @param size    大小
 */
void XFContextAddStar(CGContextRef ref, NSUInteger n, CGFloat centerX, CGFloat centerY, NSUInteger size);

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
void XFContextAddFlower(CGContextRef ref, NSUInteger n, CGFloat x, CGFloat y, CGFloat size, CGFloat length);

@end
