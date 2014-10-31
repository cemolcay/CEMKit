//
//  UIView+CEMKit.m
//  CEMKit
//
//  Created by Cem Olcay on 31/10/14.
//  Copyright (c) 2014 studionord. All rights reserved.
//

#import "UIView+CEMKit.h"

@implementation UIView (CEMKit)


#pragma mark Layer Extensions

- (void)setShadowWithOffset:(CGSize)offset radius:(CGFloat)radius color:(UIColor *)color {
    [self.layer setShadowColor:color.CGColor];
    [self.layer setShadowRadius:radius];
    [self.layer setShadowOffset:offset];
    
    [self.layer setMasksToBounds:YES];
}

- (void)setBorderWithWidth:(CGFloat)width andColor:(UIColor *)color {
    [self.layer setBorderColor:color.CGColor];
    [self.layer setBorderWidth:width];
    
    [self.layer setMasksToBounds:YES];
}

- (void)setCornerRadius:(CGFloat)radius {
    [self.layer setCornerRadius:radius];
    [self.layer setMasksToBounds:YES];
}


- (void)drawGradientWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor {
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    gradient.colors = @[(id)startColor.CGColor, (id)endColor.CGColor];
    [self.layer insertSublayer:gradient atIndex:0];
    
    [self.layer setMasksToBounds:YES];
}


- (void)drawCircleWithFillColor:(UIColor *)fillColor {
    CGFloat radius = self.frame.size.width/2;
    
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    [circleLayer setPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2*radius, 2*radius) cornerRadius:radius] CGPath]];
    [circleLayer setFillColor:[fillColor CGColor]];
    
    [self.layer addSublayer:circleLayer];
}

- (void)drawCircleWithFillColor:(UIColor *)fillColor strokeColor:(UIColor *)strokeColor strokeWidth:(CGFloat)strokeWidth {
    CGFloat radius = self.frame.size.width/2;
    
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    [circleLayer setPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2*radius, 2*radius) cornerRadius:radius] CGPath]];
    [circleLayer setFillColor:[fillColor CGColor]];
    [circleLayer setStrokeColor:[strokeColor CGColor]];
    [circleLayer setLineWidth:strokeWidth];
    
    [self.layer addSublayer:circleLayer];

}

- (void)drawCircleStrokeWithColor:(UIColor *)strokeColor andWidth:(CGFloat)strokeWidth {
    CGFloat radius = self.frame.size.width/2;
    
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    [circleLayer setPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2*radius, 2*radius) cornerRadius:radius] CGPath]];
    [circleLayer setFillColor:[[UIColor clearColor] CGColor]];
    [circleLayer setStrokeColor:[strokeColor CGColor]];
    [circleLayer setLineWidth:strokeWidth];
    
    [self.layer addSublayer:circleLayer];
}


- (void)drawArcFromAngle:(CGFloat)fromAngle toAngle:(CGFloat)toAngle clockwise:(BOOL)clockwise color:(UIColor *)arcColor width:(CGFloat)lineWidth lineCap:(NSString *)kCALineCap {
    CAShapeLayer *arcLayer = [CAShapeLayer layer];
    
    UIBezierPath *arcPath = [UIBezierPath bezierPath];
    [arcPath addArcWithCenter:CGPointMake([self width]/2, [self height]/2) radius:[self width]/2 startAngle:DEGREES_TO_RADIANS(fromAngle) endAngle:DEGREES_TO_RADIANS(toAngle) clockwise:clockwise];
    
    [arcLayer setPath:[arcPath CGPath]];
    [arcLayer setStrokeColor:[arcColor CGColor]];
    [arcLayer setFillColor:[[UIColor clearColor] CGColor]];
    [arcLayer setLineWidth:lineWidth];
    [arcLayer setLineCap:kCALineCap];
    
    [self.layer addSublayer:arcLayer];
}



#pragma mark Transform Extensions

- (void)setRotationX:(CGFloat)rotX {
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 1.0 / -1000.0;
    transform = CATransform3DRotate(transform, DEGREES_TO_RADIANS(rotX), 1.0f, 0.0f, 0.0f);

    self.layer.transform = transform;
}

- (void)setRotationY:(CGFloat)rotY {
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 1.0 / -1000.0;
    transform = CATransform3DRotate(transform, DEGREES_TO_RADIANS(rotY), 0.0f, 1.0f, 0.0f);
    
    self.layer.transform = transform;
}

- (void)setRotationZ:(CGFloat)rotZ {
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 1.0 / -1000.0;
    transform = CATransform3DRotate(transform, DEGREES_TO_RADIANS(rotZ), 0.0f, 0.0f, 1.0f);
    
    self.layer.transform = transform;
}


- (void)setRotationX:(CGFloat)rotX rotationY:(CGFloat)rotY rotationZ:(CGFloat)rotZ {
    CATransform3D transform = CATransform3DIdentity;

    transform.m34 = 1.0 / -1000.0;
    transform = CATransform3DRotate(transform, DEGREES_TO_RADIANS(rotX), 1.0f, 0.0f, 0.0f);
    transform = CATransform3DRotate(transform, DEGREES_TO_RADIANS(rotY), 0.0f, 1.0f, 0.0f);
    transform = CATransform3DRotate(transform, DEGREES_TO_RADIANS(rotZ), 0.0f, 0.0f, 1.0f);

    self.layer.transform = transform;
}


- (void)setScaleX:(CGFloat)x scaleY:(CGFloat)y scaleZ:(CGFloat)z {
    CATransform3D transform = CATransform3DIdentity;
    
    transform.m34 = 1.0 / -1000.0;
    transform = CATransform3DScale(transform, x, y, z);
    
    self.layer.transform = transform;
}



#pragma mark Rect Extensions

- (CGFloat)x {
    return self.frame.origin.x;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (CGFloat)height {
    return self.frame.size.height;
}


- (CGFloat)left {
    return [self x];
}

- (CGFloat)right {
    return [self x] + [self width];
}

- (CGFloat)top {
    return [self y];
}

- (CGFloat)bottom {
    return [self y] + [self height];
}


- (CGFloat)leftWithOffset:(CGFloat)offset {
    return [self left] - offset;
}

- (CGFloat)rightWithOffset:(CGFloat)offset {
    return [self right] + offset;
}

- (CGFloat)topWithOffset:(CGFloat)offset {
    return [self top] - offset;
}

- (CGFloat)bottomWithOffset:(CGFloat)offset {
    return [self bottom] + offset;
}


- (void)setX:(CGFloat)x {
    [self setFrame:CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height)];
}

- (void)setY:(CGFloat)y {
    [self setFrame:CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height)];
}

- (void)setX:(CGFloat)x Y:(CGFloat)y {
    [self setFrame:CGRectMake(x, y, self.frame.size.width, self.frame.size.height)];
}

- (void)setWidth:(CGFloat)width {
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height)];
}

- (void)setHeight:(CGFloat)height {
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height)];
}

- (void)setWidth:(CGFloat)width height:(CGFloat)height {
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, width, height)];
}


- (void)setX:(CGFloat)x Width:(CGFloat)width Height:(CGFloat)height {
    [self setFrame:CGRectMake(x, self.frame.origin.y, width, height)];
}

- (void)setY:(CGFloat)y Width:(CGFloat)width Height:(CGFloat)height {
    [self setFrame:CGRectMake(self.frame.origin.x, y, width, height)];
}

- (void)setX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)width {
    [self setFrame:CGRectMake(x, y, width, self.frame.size.height)];
}

- (void)setX:(CGFloat)x Y:(CGFloat)y Height:(CGFloat)height {
    [self setFrame:CGRectMake(x, y, self.frame.size.width, height)];
}

- (void)setX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)width Height:(CGFloat)height {
    [self setFrame:CGRectMake(x, y, width, height)];
}



#pragma mark Gesture Extensions

- (void)addTapGestureWithTapNumber:(NSInteger)num target:(id)target selector:(SEL)selector {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:selector];
    [tap setNumberOfTapsRequired:num];
    [self addGestureRecognizer:tap];
    
    [self setUserInteractionEnabled:YES];
}

- (void)addSwipeGestureWithDirection:(UISwipeGestureRecognizerDirection)direction numberOfTouches:(NSInteger)touches target:(id)target selector:(SEL)selector {
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:target action:selector];
    [swipe setDirection:direction];
    [swipe setNumberOfTouchesRequired:touches];
    
    [self setUserInteractionEnabled:YES];
    [self addGestureRecognizer:swipe];
}

- (void)addPanGestureWithTarget:(id)target selector:(SEL)selector {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:selector];
    
    [self setUserInteractionEnabled:YES];
    [self addGestureRecognizer:pan];
}

@end
