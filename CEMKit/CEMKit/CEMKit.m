//
//  CEMKit.m
//  CEMKit
//
//  Created by Cem Olcay on 11/06/14.
//  Copyright (c) 2014 studionord. All rights reserved.
//

#import "CEMKit.h"

@implementation CEMKit

#pragma mark -
#pragma mark UIButton

+ (UIButton *)buttonWithX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)w Height:(CGFloat)h Title:(NSString *)title Font:(UIFont *)font TitleColor:(UIColor *)titleColor Image:(UIImage *)image target:(id)target selector:(SEL)selector {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(x, y, w, h)];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    
    if (font)
        [button.titleLabel setFont:font];
    
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)buttonWithX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)w Height:(CGFloat)h Title:(NSString *)title Font:(UIFont *)font TitleColor:(UIColor *)titleColor target:(id)target selector:(SEL)selector {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(x, y, w, h)];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    
    if (font)
        [button.titleLabel setFont:font];
    
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)buttonWithX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)w Height:(CGFloat)h Image:(UIImage *)image target:(id)target selector:(SEL)selector {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(x, y, w, h)];
    [button setImage:image forState:UIControlStateNormal];
    
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}

#pragma mark UILabel
+ (UILabel *)labelWithX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)w Height:(CGFloat)h Text:(NSString *)text TextColor:(UIColor *)textColor Font:(UIFont *)font Alignment:(NSTextAlignment)alignment NumberOfLines:(NSInteger)num {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
    [label setText:text];
    [label setTextColor:textColor];
    [label setTextAlignment:alignment];
    [label setNumberOfLines:num];
    
    if (font)
        [label setFont:font];
    
    return label;
}

+ (UILabel *)labelWithX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)w Font:(UIFont *)font Text:(NSString *)text TextColor:(UIColor *)textColor Alignment:(NSTextAlignment)alignment {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, [self labelHeightForString:text labelWidth:w andFont:font])];
    [label setText:text];
    [label setTextColor:textColor];
    [label setTextAlignment:alignment];
    [label setNumberOfLines:0];
    
    if (font)
        [label setFont:font];
    
    return label;
}

#pragma mark UIImageView
+ (UIImageView *)imageViewWithX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)w Height:(CGFloat)h Image:(UIImage *)image {
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    [img setImage:image];
    
    return img;
}

+ (UIImageView *)imageViewWithX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)w Height:(CGFloat)h Image:(UIImage *)image ContentMode:(UIViewContentMode)mode {
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    [img setImage:image];
    [img setContentMode:mode];
    
    return img;
}

+ (UIImageView *)imageViewWithX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)w Height:(CGFloat)h Url:(NSString *)url {
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    
    [self urlRequest:url success:^(NSData *data) {
        [img setImage:[UIImage imageWithData:data]];
    } error:nil];
    
    return img;
}

+ (UIImageView *)imageViewWithX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)w Height:(CGFloat)h Url:(NSString *)url Placeholder:(UIImage *)placeholder {
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    [img setImage:placeholder];
    
    [self urlRequest:url success:^(NSData *data) {
        [img setImage:[UIImage imageWithData:data]];
    } error:nil];
    
    return img;
}

#pragma mark UITextField
+ (UITextField *)textFieldWithX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)w Height:(CGFloat)h Background:(UIColor *)bg Placeholder:(NSString *)placeholder Font:(UIFont *)font TextColor:(UIColor *)textColor {
    UITextField *text = [[UITextField alloc] initWithFrame:CGRectMake(x, y, w, h)];
    [text setBackgroundColor:bg];
    [text setFont:font];
    [text setPlaceholder:placeholder];
    [text setTextColor:textColor];
    return text;
}

#pragma mark UIActivityIndicatorView
+ (UIActivityIndicatorView *)activityIndicatorWithCenter:(CGPoint)center style:(UIActivityIndicatorViewStyle)style startAnimating:(BOOL)animating {
    UIActivityIndicatorView *act = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:style];
    [act setCenter:center];
    [act setHidesWhenStopped:YES];
    
    if (animating)
        [act startAnimating];

    return act;
}

#pragma mark UIAlertView
+ (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message andCancelButtonTitle:(NSString *)but {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:but otherButtonTitles:nil];
    [alert show];
}

#pragma mark - URLRequest
+ (void)urlRequest:(NSString *)url success:(URLRequestSuccessCallback)success error:(URLRequestErrorCallback)error {
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError) {
            if (error)
            error (connectionError);
        } else {
            success (data);
        }
    }];
}

+ (void)jsonRequest:(NSString *)url json:(JSONResponse)json error:(URLRequestErrorCallback)error {
    [self urlRequest:url success:^(NSData *data) {
        NSError *jsonError;
        id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
        
        if (jsonError) {
            if (error) {
                error (jsonError);
            }
        }
        else {
            json (jsonObject);
        }
            
    } error:^(NSError *connectionError) {
        if (error)
            error (connectionError);
    }];
}

#pragma mark - Utils
+ (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

+ (CGFloat)labelHeightForString:(NSString*)string labelWidth:(float)width andFont:(UIFont*)font {
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName: font}];
    CGRect rect = [attributedText boundingRectWithSize:(CGSize){width, CGFLOAT_MAX} options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    return rect.size.height;
}

+ (CGRect)rectWithPadding:(CGFloat)padding parentRect:(CGRect)container {
    return CGRectMake(padding, padding, container.size.width - padding*2, container.size.height - padding*2);
}

@end


#pragma mark - UIView

@implementation UIView (CEMKit)

- (void)addShadowWithOffset:(CGSize)offset radius:(CGFloat)radius color:(UIColor *)color {
    [self.layer setShadowColor:color.CGColor];
    [self.layer setShadowRadius:radius];
    [self.layer setShadowOffset:offset];
    
    [self.layer setMasksToBounds:YES];
}

- (void)addBorderWithWidth:(CGFloat)width color:(UIColor *)color {
    [self.layer setBorderColor:color.CGColor];
    [self.layer setBorderWidth:width];
    
    [self.layer setMasksToBounds:YES];
}

- (void)addCornerRadius:(CGFloat)radius {
    [self.layer setCornerRadius:radius];
    [self.layer setMasksToBounds:YES];
}

- (void)addGradientWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor {
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    gradient.colors = @[(id)startColor.CGColor, (id)endColor.CGColor];
    [self.layer insertSublayer:gradient atIndex:0];
    
    [self.layer setMasksToBounds:YES];
}

- (void)addTapGestureWithTapNumber:(NSInteger)num target:(id)target selector:(SEL)selector {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:selector];
    [tap setNumberOfTapsRequired:num];
    [self addGestureRecognizer:tap];
    
    [self setUserInteractionEnabled:YES];
}


- (void)drawCircleWithColor:(UIColor *)circleColor {
    CGFloat radius = self.frame.size.width/2;
    
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    [circleLayer setPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2*radius, 2*radius) cornerRadius:radius] CGPath]];
    [circleLayer setFillColor:[circleColor CGColor]];
    [self.layer addSublayer:circleLayer];
}

- (void)drawCircleStrokeWithColor:(UIColor *)strokeColor width:(CGFloat)width {
    CGFloat radius = self.frame.size.width/2;
    
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    [circleLayer setPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2*radius, 2*radius) cornerRadius:radius] CGPath]];
    [circleLayer setFillColor:[[UIColor clearColor] CGColor]];
    [circleLayer setStrokeColor:[strokeColor CGColor]];
    [circleLayer setLineWidth:width];
    [circleLayer setLineCap:kCALineCapRound];
    [self.layer addSublayer:circleLayer];
}

- (void)drawCircleWithColor:(UIColor *)circleColor strokeColor:(UIColor *)strokeColor width:(CGFloat)width {
    CGFloat radius = self.frame.size.width/2;
    
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    [circleLayer setPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2*radius, 2*radius) cornerRadius:radius] CGPath]];
    [circleLayer setFillColor:[circleColor CGColor]];
    [circleLayer setStrokeColor:[strokeColor CGColor]];
    [circleLayer setLineWidth:width];
    [circleLayer setLineCap:kCALineCapRound];
    [self.layer addSublayer:circleLayer];
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

@end
