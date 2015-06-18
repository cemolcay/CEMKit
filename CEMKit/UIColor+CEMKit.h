//
//  UIColor+CEMKit.h
//  CEMKit
//
//  Created by Cem Olcay on 18/06/15.
//  Copyright © 2015 studionord. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIColor(CEMKit)

+ (UIColor *)rgbColorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b;
+ (UIColor *)rgbaColorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a;

+ (UIColor *)gray:(CGFloat)g;
+ (UIColor *)gray:(CGFloat)g withAlpha:(CGFloat)a;

+ (UIColor *)randomColor;

@end
