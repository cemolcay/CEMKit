//
//  UIScrollView+CEMKit.m
//  CEMKit
//
//  Created by Cem Olcay on 18/06/15.
//  Copyright © 2015 studionord. All rights reserved.
//

#import "UIScrollView+CEMKit.h"

@implementation UIScrollView (CEMKit)

- (CGFloat)contentHeight {
    return self.contentSize.height;
}

- (void)setContentHeight:(CGFloat)contentHeight {
    [self setContentSize:CGSizeMake(self.contentSize.width, contentHeight)];
}


- (CGFloat)contentWidth {
    return self.contentSize.width;
}

- (void)setContentWidth:(CGFloat)contentWidth {
    [self setContentSize:CGSizeMake(contentWidth, self.contentSize.height)];
}


- (CGFloat)contentX {
    return self.contentOffset.x;
}

- (void)setContentX:(CGFloat)contentX {
    [self setContentOffset:CGPointMake(contentX, self.contentOffset.y)];
}


- (CGFloat)contentY {
    return self.contentOffset.y;
}

- (void)setContentY:(CGFloat)contentY {
    [self setContentOffset:CGPointMake(self.contentOffset.x, contentY)];
}

@end
