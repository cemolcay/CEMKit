//
//  UIColor+CEMKit.m
//  CEMKit
//
//  Created by Cem Olcay on 18/06/15.
//  Copyright © 2015 studionord. All rights reserved.
//

#import "UIColor+CEMKit.h"

@implementation UIColor (CEMKit)

+ (UIColor *)rgbColorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b {
    return [self colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
}

+ (UIColor *)rgbaColorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a {
    return [self colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a];
}

+ (UIColor *)gray:(CGFloat)g {
    return [self rgbColorWithR:g g:g b:g];
}

+ (UIColor *)gray:(CGFloat)g withAlpha:(CGFloat)a {
    return [self rgbaColorWithR:g g:g b:g a:a];
}

+ (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [self colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
