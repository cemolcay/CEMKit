//
//  CEMKit.h
//  CEMKit
//
//  Created by Cem Olcay on 11/06/14.
//  Copyright (c) 2014 studionord. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#define APPDELEGATE                     ((AppDelegate*)[[UIApplication sharedApplication] delegate])
#define DEGREES_TO_RADIANS(x)           (M_PI * x / 180.0)

#define ScreenWidth                     [UIScreen mainScreen].bounds.size.width
#define ScreenHeight                    [UIScreen mainScreen].bounds.size.height
#define ScreenRect                      [UIScreen mainScreen].bounds

#define NavBarHeight                    90/2
#define StatusBarHeight                 40/2

#define RGBCOLOR(r,g,b)                 [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBACOLOR(r,g,b,a)              [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

typedef void(^URLRequestSuccessCallback)(NSData* data);
typedef void(^URLRequestErrorCallback)(NSError* error);
typedef void(^JSONResponse)(id object);

@interface CEMKit : NSObject

+ (UIButton *)buttonWithX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)w Height:(CGFloat)h Title:(NSString *)title Font:(UIFont *)font TitleColor:(UIColor *)titleColor Image:(UIImage *)image target:(id)target selector:(SEL)selector;
+ (UIButton *)buttonWithX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)w Height:(CGFloat)h Title:(NSString *)title Font:(UIFont *)font TitleColor:(UIColor *)titleColor  target:(id)target selector:(SEL)selector;
+ (UIButton *)buttonWithX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)w Height:(CGFloat)h Image:(UIImage *)image target:(id)target selector:(SEL)selector;

+ (UILabel *)labelWithX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)w Height:(CGFloat)h Text:(NSString *)text TextColor:(UIColor *)textColor Font:(UIFont *)font Alignment:(NSTextAlignment)alignment NumberOfLines:(NSInteger)num;
+ (UILabel *)labelWithX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)w Font:(UIFont *)font Text:(NSString *)text TextColor:(UIColor *)textColor Alignment:(NSTextAlignment)alignment;

+ (UIImageView *)imageViewWithX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)w Height:(CGFloat)h Image:(UIImage *)image;
+ (UIImageView *)imageViewWithX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)w Height:(CGFloat)h Image:(UIImage *)image ContentMode:(UIViewContentMode)mode;
+ (UIImageView *)imageViewWithX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)w Height:(CGFloat)h Url:(NSString *)url;
+ (UIImageView *)imageViewWithX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)w Height:(CGFloat)h Url:(NSString *)url Placeholder:(UIImage *)placeholder;

+ (UIActivityIndicatorView *)activityIndicatorWithCenter:(CGPoint)center style:(UIActivityIndicatorViewStyle)style startAnimating:(BOOL)animating;

+ (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message;
+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message andCancelButtonTitle:(NSString *)but;

+ (void)urlRequest:(NSString *)url success:(URLRequestSuccessCallback)success error:(URLRequestErrorCallback)error;
+ (void)jsonRequest:(NSString *)url json:(JSONResponse)json error:(URLRequestErrorCallback)error;

+ (UIColor *)randomColor;
+ (CGFloat)labelHeightForString:(NSString*)string labelWidth:(float)width andFont:(UIFont*)font;
+ (CGRect)rectWithPadding:(CGFloat)padding parentRect:(CGRect)container;

@end

@interface UIView (CEMKit)

- (void)addShadowWithOffset:(CGSize)offset radius:(CGFloat)radius color:(UIColor *)color;
- (void)addBorderWithWidth:(CGFloat)width color:(UIColor *)color;
- (void)addCornerRadius:(CGFloat)radius;
- (void)addGradientWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor;
- (void)addTapGestureWithTapNumber:(NSInteger)num target:(id)target selector:(SEL)selector;

- (void)setX:(CGFloat)x;
- (void)setY:(CGFloat)y;
- (void)setX:(CGFloat)x Y:(CGFloat)y;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;
- (void)setWidth:(CGFloat)width height:(CGFloat)height;
- (void)setX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)width Height:(CGFloat)height;

@end
