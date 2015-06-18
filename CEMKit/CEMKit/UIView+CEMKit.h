//
//  UIView+CEMKit.h
//  CEMKit
//
//  Created by Cem Olcay on 31/10/14.
//  Copyright (c) 2014 studionord. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIView (CEMKit)

#pragma mark - Init

- (instancetype)initWithX:(CGFloat)x y:(CGFloat)y w:(CGFloat)w h:(CGFloat)h;


#pragma mark - Frame

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;

@property (nonatomic, assign) CGPoint position;
@property (nonatomic, assign) CGSize size;


- (CGFloat)leftWithOffset:(CGFloat)offset;
- (CGFloat)rightWithOffset:(CGFloat)offset;
- (CGFloat)topWithOffset:(CGFloat)offset;
- (CGFloat)bottomWithOffset:(CGFloat)offset;

- (void)centerInSuperview;

#pragma mark - Layer

- (void)setShadowWithOffset:(CGSize)offset radius:(CGFloat)radius color:(UIColor *)color;
- (void)setBorderWithWidth:(CGFloat)width andColor:(UIColor *)color;
- (void)setCornerRadius:(CGFloat)radius;

- (void)drawGradientWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor;

- (void)drawCircleWithFillColor:(UIColor *)fillColor;
- (void)drawCircleWithFillColor:(UIColor *)fillColor strokeColor:(UIColor *)strokeColor strokeWidth:(CGFloat)strokeWidth;
- (void)drawCircleStrokeWithColor:(UIColor *)strokeColor andWidth:(CGFloat)strokeWidth;

- (void)drawArcFromAngle:(CGFloat)fromAngle toAngle:(CGFloat)toAngle clockwise:(BOOL)clockwise color:(UIColor *)arcColor width:(CGFloat)lineWidth lineCap:(NSString *)kCALineCap;


#pragma mark - Transform

- (void)setRotationX:(CGFloat)rotX;
- (void)setRotationY:(CGFloat)rotY;
- (void)setRotationZ:(CGFloat)rotZ;

- (void)setRotationX:(CGFloat)rotX rotationY:(CGFloat)rotY rotationZ:(CGFloat)rotZ;

- (void)setScaleX:(CGFloat)x scaleY:(CGFloat)y scaleZ:(CGFloat)z;


#pragma mark - Gestures

- (void)addTapGestureWithTapNumber:(NSInteger)num target:(id)target selector:(SEL)selector;
- (void)addSwipeGestureWithDirection:(UISwipeGestureRecognizerDirection)direction numberOfTouches:(NSInteger)touches target:(id)target selector:(SEL)selector;
- (void)addPanGestureWithTarget:(id)target selector:(SEL)selector;


#pragma mark - Animation

+ (void)springWithDuration:(NSTimeInterval)duration animations:(void(^)(void))animations completion:(void(^)(BOOL))completion;
+ (void)springWithDuration:(NSTimeInterval)duration damping:(CGFloat)damping velocity:(CGFloat)velocity animations:(void (^)(void))animations completion:(void(^)(BOOL))completion;

- (void)fadeIn;
- (void)fadeOut;

- (void)fadeInWithDuration:(NSTimeInterval)duration;
- (void)fadeOutWithDuration:(NSTimeInterval)duration;

@end
