//
//  UILabel+CEMKit.h
//  CEMKit
//
//  Created by Cem Olcay on 18/06/15.
//  Copyright © 2015 studionord. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UILabel (CEMKit)

#pragma mark - Init with attributed text

- (instancetype)initWithX:(CGFloat)x
                        y:(CGFloat)y
           attributedText:(NSAttributedString *)attributedText
            textAlignment:(NSTextAlignment)textAlignment;

- (instancetype)initWithX:(CGFloat)x
                        y:(CGFloat)y
                    width:(CGFloat)width
           attributedText:(NSAttributedString *)attributedText
            textAlignment:(NSTextAlignment)textAlignment;

- (instancetype)initWithX:(CGFloat)x
                        y:(CGFloat)y
                   height:(CGFloat)height
           attributedText:(NSAttributedString *)attributedText
            textAlignment:(NSTextAlignment)textAlignment;


#pragma mark Init with text, text color, font

- (instancetype)initWithX:(CGFloat)x
                        y:(CGFloat)y
                     text:(NSString *)text
                textColor:(UIColor *)textColor
                     font:(UIFont *)font
            textAlignment:(NSTextAlignment)textAlignment;

- (instancetype)initWithX:(CGFloat)x
                        y:(CGFloat)y
                    width:(CGFloat)width
                     text:(NSString *)text
                textColor:(UIColor *)textColor
                     font:(UIFont *)font
            textAlignment:(NSTextAlignment)textAlignment;

- (instancetype)initWithX:(CGFloat)x
                        y:(CGFloat)y
                   height:(CGFloat)height
                     text:(NSString *)text
                textColor:(UIColor *)textColor
                     font:(UIFont *)font
            textAlignment:(NSTextAlignment)textAlignment;


#pragma mark - Size Helpers

- (void)fitSize;
- (void)fitHeight;
- (void)fitWidth;

@end
