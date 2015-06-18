//
//  UIBarButtonItem+CEMKit.m
//  CEMKit
//
//  Created by Cem Olcay on 18/06/15.
//  Copyright © 2015 studionord. All rights reserved.
//

#import "UIBarButtonItem+CEMKit.h"
#import <objc/objc-runtime.h>

@implementation UIBarButtonItem (CEMKit)

#pragma mark - Init

- (instancetype)initWithImage:(UIImage *)image action:(UIBarButtonItemAction)action {
    
    if ((self = [self initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(buttonPressed:)])) {
        self.buttonAction = action;
    }
    
    return self;
}

- (instancetype)initWithImageNamed:(NSString *)imageNamed action:(UIBarButtonItemAction)action {

    if ((self = [self initWithImage:[UIImage imageNamed:imageNamed] style:UIBarButtonItemStylePlain target:self action:@selector(buttonPressed:)])) {
        self.buttonAction = action;
    }
    
    return self;
}

- (instancetype)initWithTitle:(NSString *)title action:(UIBarButtonItemAction)action {

    if ((self = [self initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(buttonPressed:)])) {
        self.buttonAction = action;
    }
    
    return self;
}


#pragma mark - Properties

- (UIBarButtonItemAction)buttonAction {
    return objc_getAssociatedObject(self, UIBarButtonItemActionPropertyKey);
}

- (void)setButtonAction:(UIBarButtonItemAction)buttonAction {
    objc_setAssociatedObject(self, UIBarButtonItemActionPropertyKey, buttonAction, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


#pragma mark - Action

- (void)buttonPressed:(UIBarButtonItem *)sender {

    if (self.buttonAction != nil) {
        self.buttonAction(sender);
    }
}

@end
