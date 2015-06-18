//
//  UIButton+CEMKit.h
//  CEMKit
//
//  Created by Cem Olcay on 18/06/15.
//  Copyright © 2015 studionord. All rights reserved.
//

#import <UIKit/UIKit.h>

static void * UIButtonActionPropertyKey = &UIButtonActionPropertyKey;

typedef void(^UIButtonAction)(UIButton *sender);

@interface UIButton (CEMKit)

@property (nonatomic, copy) UIButtonAction action;

#pragma mark - Init With Block

- (instancetype)initWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                         font:(UIFont *)font
              backgroundColor:(UIColor *)backgroundColor
                       action:(UIButtonAction)action;

- (instancetype)initWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                         font:(UIFont *)font
                        image:(UIImage *)image
              backgroundColor:(UIColor *)backgroundColor
                       action:(UIButtonAction)action;

- (instancetype)initWithFrame:(CGRect)frame
              backgroundImage:(UIImage *)image
                       action:(UIButtonAction)action;

- (instancetype)initWithFrame:(CGRect)frame
              backgroundColor:(UIColor *)backgroundColor
              backgroundImage:(UIImage *)image
                       action:(UIButtonAction)action;


#pragma mark - Init With Action-Target

- (instancetype)initWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                         font:(UIFont *)font
              backgroundColor:(UIColor *)backgroundColor
                       target:(id)target
                     selector:(SEL)selector;

- (instancetype)initWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                         font:(UIFont *)font
                        image:(UIImage *)image
              backgroundColor:(UIColor *)backgroundColor
                       target:(id)target
                     selector:(SEL)selector;

- (instancetype)initWithFrame:(CGRect)frame
              backgroundImage:(UIImage *)image
                       target:(id)target
                     selector:(SEL)selector;

- (instancetype)initWithFrame:(CGRect)frame
              backgroundColor:(UIColor *)backgroundColor
              backgroundImage:(UIImage *)image
                       target:(id)target
                     selector:(SEL)selector;

@end
