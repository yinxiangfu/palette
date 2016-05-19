//
//  XFDrawView.h
//  涂鸦板
//
//  Created by biznest on 15/5/13.
//  Copyright (c) 2015年 biznest. All rights reserved.
//

#import <UIKit/UIKit.h>

//形状类型
typedef NS_ENUM( NSInteger, XFShapeType) {
    XFLineShape = 0,    //线
    XFRectShape,        //矩形
    XFEllipseShape,     //椭圆
    XFRoundRectShape,   //圆角矩形
    XFPenShape          //铅笔
};

@interface XFDrawView : UIView

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) XFShapeType shape;

@end
