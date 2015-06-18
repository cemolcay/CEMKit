//
//  NSAttributedString+CEMKit.h
//  CEMKit
//
//  Created by Cem Olcay on 18/06/15.
//  Copyright © 2015 studionord. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^mutableAttributedString)(NSMutableAttributedString *);

@interface NSAttributedString (CEMKit)

- (instancetype)initWithText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font;
- (instancetype)initWithAttributedStrings:(mutableAttributedString)mutableAttributedStrings;

@end
