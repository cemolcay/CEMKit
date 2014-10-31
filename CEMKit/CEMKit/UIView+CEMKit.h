//
//  UIView+CEMKit.h
//  CEMKit
//
//  Created by Cem Olcay on 31/10/14.
//  Copyright (c) 2014 studionord. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CEMKit)

- (void)setShadowWithOffset:(CGSize)offset radius:(CGFloat)radius color:(UIColor *)color;
- (void)setBorderWithWidth:(CGFloat)width andColor:(UIColor *)color;
- (void)setCornerRadius:(CGFloat)radius;

- (void)drawGradientWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor;

- (void)drawCircleWithFillColor:(UIColor *)fillColor;
- (void)drawCircleWithFillColor:(UIColor *)fillColor strokeColor:(UIColor *)strokeColor strokeWidth:(CGFloat)strokeWidth;
- (void)drawCircleStrokeWithColor:(UIColor *)strokeColor andWidth:(CGFloat)strokeWidth;

- (void)drawArcFromAngle:(CGFloat)fromAngle toAngle:(CGFloat)toAngle clockwise:(BOOL)clockwise color:(UIColor *)arcColor width:(CGFloat)lineWidth lineCap:(NSString *)kCALineCap;

- (CGFloat)x;
- (CGFloat)y;
- (CGFloat)width;
- (CGFloat)height;

- (CGFloat)left;
- (CGFloat)right;
- (CGFloat)top;
- (CGFloat)bottom;

- (CGFloat)leftWithOffset:(CGFloat)offset;
- (CGFloat)rightWithOffset:(CGFloat)offset;
- (CGFloat)topWithOffset:(CGFloat)offset;
- (CGFloat)bottomWithOffset:(CGFloat)offset;


- (void)setX:(CGFloat)x;
- (void)setY:(CGFloat)y;
- (void)setX:(CGFloat)x Y:(CGFloat)y;

- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;
- (void)setWidth:(CGFloat)width height:(CGFloat)height;

- (void)setX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)width Height:(CGFloat)height;


- (void)setRotationX:(CGFloat)rotX;
- (void)setRotationY:(CGFloat)rotY;
- (void)setRotationZ:(CGFloat)rotZ;

- (void)setRotationX:(CGFloat)rotX rotationY:(CGFloat)rotY rotationZ:(CGFloat)rotZ;

- (void)setScaleX:(CGFloat)x scaleY:(CGFloat)y scaleZ:(CGFloat)z;


- (void)addTapGestureWithTapNumber:(NSInteger)num target:(id)target selector:(SEL)selector;
- (void)addSwipeGestureWithDirection:(UISwipeGestureRecognizerDirection)direction numberOfTouches:(NSInteger)touches target:(id)target selector:(SEL)selector;
- (void)addPanGestureWithTarget:(id)target selector:(SEL)selector;

@end
