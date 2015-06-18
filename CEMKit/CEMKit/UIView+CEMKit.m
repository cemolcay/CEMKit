//
//  UIView+CEMKit.m
//  CEMKit
//
//  Created by Cem Olcay on 31/10/14.
//  Copyright (c) 2014 studionord. All rights reserved.
//

#import "UIView+CEMKit.h"

@implementation UIView (CEMKit)

#pragma mark - Init

- (instancetype)initWithX:(CGFloat)x y:(CGFloat)y w:(CGFloat)w h:(CGFloat)h {
    return [self initWithFrame:CGRectMake(x, y, w, h)];
}


#pragma mark - Frame

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}


- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y {
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}


- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}


- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}


- (CGFloat)left {
    return [self x];
}

- (void)setLeft:(CGFloat)left {
    CGRect rect = self.frame;
    rect.origin.x = left;
    self.frame = rect;
}


- (CGFloat)right {
    return [self x] + [self width];
}

- (void)setRight:(CGFloat)right {
    CGRect rect = self.frame;
    rect.origin.x = right - [self width];
    self.frame = rect;
}


- (CGFloat)top {
    return [self y];
}

- (void)setTop:(CGFloat)top {
    CGRect rect = self.frame;
    rect.origin.y = top;
    self.frame = rect;
}


- (CGFloat)bottom {
    return [self y] + [self height];
}

- (void)setBottom:(CGFloat)bottom {
    CGRect rect = self.frame;
    rect.origin.y = bottom - [self height];
    self.frame = rect;
}


- (CGPoint)position {
    return self.frame.origin;
}

- (void)setPosition:(CGPoint)position {
    CGRect rect = self.frame;
    rect.origin = position;
    self.frame = rect;
}


- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect rect = self.frame;
    rect.size = size;
    self.frame = rect;
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


- (void)centerInSuperview {
    
    if (self.superview == nil) {
        return;
    }
    
    [self setCenter:CGPointMake(self.superview.width/2, self.superview.height/2)];
}


#pragma mark - Layer

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


#pragma mark - Transform

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


#pragma mark - Gesture

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


#pragma mark - Animations

+ (void)springWithDuration:(NSTimeInterval)duration animations:(void(^)(void))animations completion:(void(^)(BOOL))completion {
    [self animateWithDuration:duration delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:kNilOptions animations:animations completion:completion];
}

+ (void)springWithDuration:(NSTimeInterval)duration damping:(CGFloat)damping velocity:(CGFloat)velocity animations:(void (^)(void))animations completion:(void(^)(BOOL))completion {
    [self animateWithDuration:duration delay:0 usingSpringWithDamping:damping initialSpringVelocity:velocity options:kNilOptions animations:animations completion:completion];
}


- (void)fadeIn {
    [self fadeInWithDuration:0.3];
}

- (void)fadeOut {
    [self fadeOutWithDuration:0.3];
}


- (void)fadeInWithDuration:(NSTimeInterval)duration {
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:duration animations:^{
        [weakSelf setAlpha:1];
    }];
}

- (void)fadeOutWithDuration:(NSTimeInterval)duration {
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:duration animations:^{
        [weakSelf setAlpha:0];
    }];
}


@end
