//
//  NSAttributedString+CEMKit.m
//  CEMKit
//
//  Created by Cem Olcay on 18/06/15.
//  Copyright © 2015 studionord. All rights reserved.
//

#import "NSAttributedString+CEMKit.h"

@implementation NSAttributedString (CEMKit)

- (instancetype)initWithText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font {
    
    return [self initWithString:text attributes:@{NSFontAttributeName: font, NSForegroundColorAttributeName: textColor}];
}

- (instancetype)initWithAttributedStrings:(mutableAttributedString)mutableAttributedStrings {
    
    NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
    mutableAttributedStrings(mut);
    return [self initWithAttributedString:[mut mutableCopy]];
}

@end
