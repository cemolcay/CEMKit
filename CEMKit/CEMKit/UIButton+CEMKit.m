//
//  UIButton+CEMKit.m
//  CEMKit
//
//  Created by Cem Olcay on 18/06/15.
//  Copyright © 2015 studionord. All rights reserved.
//

#import "UIButton+CEMKit.h"
#import <objc/objc-runtime.h>

@implementation UIButton (CEMKit)

#pragma mark - Init With Block

- (instancetype)initWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                         font:(UIFont *)font
              backgroundColor:(UIColor *)backgroundColor
                       action:(UIButtonAction)action {
    
    if ((self = [super initWithFrame:frame])) {
        
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        [self.titleLabel setFont:font];
        [self setBackgroundColor:backgroundColor];
        [self setAction:action];
        
        [self addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                         font:(UIFont *)font
                        image:(UIImage *)image
              backgroundColor:(UIColor *)backgroundColor
                       action:(UIButtonAction)action {
    
    if ((self = [super initWithFrame:frame])) {
        
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        [self.titleLabel setFont:font];
        [self setBackgroundImage:image forState:UIControlStateNormal];
        [self setBackgroundColor:backgroundColor];
        [self setAction:action];
        
        [self addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
              backgroundImage:(UIImage *)image
                       action:(UIButtonAction)action {
    
    if ((self = [super initWithFrame:frame])) {
        
        [self setImage:image forState:UIControlStateNormal];
        [self setAction:action];
        
        [self addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
              backgroundColor:(UIColor *)backgroundColor
              backgroundImage:(UIImage *)image
                       action:(UIButtonAction)action {
    
    if ((self = [super initWithFrame:frame])) {
        
        [self setBackgroundImage:image forState:UIControlStateNormal];
        [self setBackgroundColor:backgroundColor];
        [self setAction:action];
        
        [self addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}

#pragma mark - Init With Action-Target


- (instancetype)initWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                         font:(UIFont *)font
              backgroundColor:(UIColor *)backgroundColor
                       target:(id)target
                     selector:(SEL)selector {
    
    if ((self = [super initWithFrame:frame])) {
        
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        [self.titleLabel setFont:font];
        [self setBackgroundColor:backgroundColor];
        
        [self addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                         font:(UIFont *)font
                        image:(UIImage *)image
              backgroundColor:(UIColor *)backgroundColor
                       target:(id)target
                     selector:(SEL)selector {
    
    if ((self = [super initWithFrame:frame])) {
        
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        [self.titleLabel setFont:font];
        [self setBackgroundImage:image forState:UIControlStateNormal];
        [self setBackgroundColor:backgroundColor];
        
        [self addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
              backgroundImage:(UIImage *)image
                       target:(id)target
                     selector:(SEL)selector {
    
    if ((self = [super initWithFrame:frame])) {
        
        [self setImage:image forState:UIControlStateNormal];
        [self addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
              backgroundColor:(UIColor *)backgroundColor
              backgroundImage:(UIImage *)image
                       target:(id)target
                     selector:(SEL)selector {
    
    if ((self = [super initWithFrame:frame])) {
        
        [self setBackgroundImage:image forState:UIControlStateNormal];
        [self setBackgroundColor:backgroundColor];
        [self addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}




#pragma mark - Property

- (UIButtonAction)action {
    return objc_getAssociatedObject(self, UIButtonActionPropertyKey);
}

- (void)setAction:(UIButtonAction)action {
    objc_setAssociatedObject(self, UIButtonActionPropertyKey, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


#pragma mark - Action

- (void)buttonPressed:(UIButton *)sender {
    if (self.action != nil) {
        self.action(sender);
    }
}

@end
