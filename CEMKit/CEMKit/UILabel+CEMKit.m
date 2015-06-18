//
//  UILabel+CEMKit.m
//  CEMKit
//
//  Created by Cem Olcay on 18/06/15.
//  Copyright © 2015 studionord. All rights reserved.
//

#import "UILabel+CEMKit.h"

@implementation UILabel (CEMKit)

#pragma mark - Init with attributed text

- (instancetype)initWithX:(CGFloat)x
                        y:(CGFloat)y
           attributedText:(NSAttributedString *)attributedText
            textAlignment:(NSTextAlignment)textAlignment {
    
    if ((self = [super init])) {
        
        [self setNumberOfLines:0];
        [self setAttributedText:attributedText];
        [self setTextAlignment:textAlignment];
        
        [self setPosition:CGPointMake(x, y)];
        [self fitSize];
    }
    
    return self;
}


- (instancetype)initWithX:(CGFloat)x
                        y:(CGFloat)y
                    width:(CGFloat)width
           attributedText:(NSAttributedString *)attributedText
            textAlignment:(NSTextAlignment)textAlignment {
    
    if ((self = [super init])) {
        
        [self setNumberOfLines:0];
        [self setAttributedText:attributedText];
        [self setTextAlignment:textAlignment];
        
        [self setPosition:CGPointMake(x, y)];
        [self setWidth:width];
        [self fitHeight];
    }
    
    return self;
}

- (instancetype)initWithX:(CGFloat)x
                        y:(CGFloat)y
                   height:(CGFloat)height
           attributedText:(NSAttributedString *)attributedText
            textAlignment:(NSTextAlignment)textAlignment {

    if ((self = [super init])) {
        
        [self setNumberOfLines:0];
        [self setAttributedText:attributedText];
        [self setTextAlignment:textAlignment];
        
        [self setPosition:CGPointMake(x, y)];
        [self setHeight:height];
        [self fitWidth];
    }
    
    return self;
}

#pragma mark Init with text, text color, font

- (instancetype)initWithX:(CGFloat)x
                        y:(CGFloat)y
                     text:(NSString *)text
                textColor:(UIColor *)textColor
                     font:(UIFont *)font
            textAlignment:(NSTextAlignment)textAlignment {

    if ((self = [super init])) {
        
        [self setNumberOfLines:0];
        [self setText:text];
        [self setTextColor:textColor];
        [self setFont:font];
        [self setTextAlignment:textAlignment];
        
        [self setPosition:CGPointMake(x, y)];
        [self fitSize];
    }
    
    return self;
}

- (instancetype)initWithX:(CGFloat)x
                        y:(CGFloat)y
                    width:(CGFloat)width
                     text:(NSString *)text
                textColor:(UIColor *)textColor
                     font:(UIFont *)font
            textAlignment:(NSTextAlignment)textAlignment {

    if ((self = [super init])) {
        
        [self setNumberOfLines:0];
        [self setText:text];
        [self setTextColor:textColor];
        [self setFont:font];
        [self setTextAlignment:textAlignment];
        
        [self setPosition:CGPointMake(x, y)];
        [self setWidth:width];
        [self fitHeight];
    }
    
    return self;
}

- (instancetype)initWithX:(CGFloat)x
                        y:(CGFloat)y
                   height:(CGFloat)height
                     text:(NSString *)text
                textColor:(UIColor *)textColor
                     font:(UIFont *)font
            textAlignment:(NSTextAlignment)textAlignment {
    
    if ((self = [super init])) {
        
        [self setNumberOfLines:0];
        [self setText:text];
        [self setTextColor:textColor];
        [self setFont:font];
        [self setTextAlignment:textAlignment];
        
        [self setPosition:CGPointMake(x, y)];
        [self setHeight:height];
        [self fitWidth];
    }
    
    return self;
}


#pragma mark - Size Helpers

- (void)fitSize {
    [self setSize:[self sizeThatFits:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)]];
}

- (void)fitHeight {
    [self setHeight:[self sizeThatFits:CGSizeMake(self.width, CGFLOAT_MAX)].height];
}

- (void)fitWidth {
    [self setWidth:[self sizeThatFits:CGSizeMake(CGFLOAT_MAX, self.height)].width];
}

@end
