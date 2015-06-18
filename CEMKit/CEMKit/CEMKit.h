//
//  CEMKit.h
//  CEMKit
//
//  Created by Cem Olcay on 11/06/14.
//  Copyright (c) 2014 studionord. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define DEGREES_TO_RADIANS(angle)       ((angle) / 180.0 * M_PI)

#define ScreenWidth                     [UIScreen mainScreen].bounds.size.width
#define ScreenHeight                    [UIScreen mainScreen].bounds.size.height

#define NavBarHeight                    90/2
#define StatusBarHeight                 40/2

#define RGBCOLOR(r,g,b)                 [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBACOLOR(r,g,b,a)              [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#import "AppDelegate.h"
#import "UIView+CEMKit.h"
#import "UILabel+CEMKit.h"
#import "UIColor+CEMKit.h"
#import "NSURLConnection+CEMKIt.h"
#import "UIImageView+CEMKit.h"
#import "UIButton+CEMKit.h"
#import "NSAttributedString+CEMKit.h"
