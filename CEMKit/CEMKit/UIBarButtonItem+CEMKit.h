//
//  UIBarButtonItem+CEMKit.h
//  CEMKit
//
//  Created by Cem Olcay on 18/06/15.
//  Copyright © 2015 studionord. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UIBarButtonItemAction)(UIBarButtonItem *sender);

static void * UIBarButtonItemActionPropertyKey = &UIBarButtonItemActionPropertyKey;

@interface UIBarButtonItem (CEMKit)

@property (nonatomic, copy) UIBarButtonItemAction buttonAction;

- (instancetype)initWithImage:(UIImage *)image action:(UIBarButtonItemAction)action;
- (instancetype)initWithImageNamed:(NSString *)imageNamed action:(UIBarButtonItemAction)action;

- (instancetype)initWithTitle:(NSString *)title action:(UIBarButtonItemAction)action;

@end
