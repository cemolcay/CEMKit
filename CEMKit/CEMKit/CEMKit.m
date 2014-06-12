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
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] queue:[NSOperationQueue new] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
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
    CGSize maximumSize = CGSizeMake(width, 10000);
    
    CGSize labelHeighSize = [string sizeWithFont: [UIFont fontWithName:font.fontName size:font.pointSize] constrainedToSize:maximumSize lineBreakMode:NSLineBreakByWordWrapping];
    return labelHeighSize.height;
}

+ (CGRect)rectWithPadding:(CGFloat)padding parentRect:(CGRect)container {
    return CGRectMake(padding, padding, container.size.width - padding*2, container.size.height - padding*2);
}
@end


@implementation UIView (CEMKit)

#pragma mark - UIView

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
    [target setNumberOfTapsRequired:num];
    [self addGestureRecognizer:tap];
}

@end
