//
//  UIImageView+CEMKit.m
//  CEMKit
//
//  Created by Cem Olcay on 18/06/15.
//  Copyright © 2015 studionord. All rights reserved.
//

#import "UIImageView+CEMKit.h"

@implementation UIImageView (CEMKit)

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image {
    
    if ((self = [super initWithFrame:frame])) {
        [self setImage:image];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image contentMode:(UIViewContentMode)contentMode {
    
    if ((self = [super initWithFrame:frame])) {
        [self setImage:image];
        [self setContentMode:contentMode];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName {

    if ((self = [super initWithFrame:frame])) {
        [self setImage:[UIImage imageNamed:imageName]];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName contentMode:(UIViewContentMode)contentMode {

    if ((self = [super initWithFrame:frame])) {
        [self setImage:[UIImage imageNamed:imageName]];
        [self setContentMode:contentMode];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame imageUrl:(NSString *)url {
    
    if ((self = [super initWithFrame:frame])) {
        
        __weak typeof(self) weakSelf = self;
        [NSURLConnection urlRequest:url success:^(NSData * __nullable data, NSError * __nullable error) {
            if (error == nil) {
                [weakSelf setImage:[UIImage imageWithData:data]];
            }
        }];
        
    }
    
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame imageUrl:(NSString *)url contentMode:(UIViewContentMode)contentMode {

    if ((self = [super initWithFrame:frame])) {
        
        [self setContentMode:contentMode];
        
        __weak typeof(self) weakSelf = self;
        [NSURLConnection urlRequest:url success:^(NSData * __nullable data, NSError * __nullable error) {
            if (error == nil) {
                [weakSelf setImage:[UIImage imageWithData:data]];
            }
        }];
        
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame imageUrl:(NSString *)url placeholderImage:(UIImage *)placeholderImage {
    
    if ((self = [super initWithFrame:frame])) {
        
        [self setImage:placeholderImage];
        
        __weak typeof(self) weakSelf = self;
        [NSURLConnection urlRequest:url success:^(NSData * __nullable data, NSError * __nullable error) {
            if (error == nil) {
                [weakSelf setImage:[UIImage imageWithData:data]];
            }
        }];
        
    }
    
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame imageUrl:(NSString *)url placeholderImage:(UIImage *)placeholderImage contentMode:(UIViewContentMode)contentMode {

    if ((self = [super initWithFrame:frame])) {
        
        [self setImage:placeholderImage];
        [self setContentMode:contentMode];
        
        __weak typeof(self) weakSelf = self;
        [NSURLConnection urlRequest:url success:^(NSData * __nullable data, NSError * __nullable error) {
            if (error == nil) {
                [weakSelf setImage:[UIImage imageWithData:data]];
            }
        }];
        
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame imageUrl:(NSString *)url placeholderImageNamed:(NSString *)placeholderImageNamed {
    
    if ((self = [super initWithFrame:frame])) {
        
        [self setImage:[UIImage imageNamed:placeholderImageNamed]];
        
        __weak typeof(self) weakSelf = self;
        [NSURLConnection urlRequest:url success:^(NSData * __nullable data, NSError * __nullable error) {
            if (error == nil) {
                [weakSelf setImage:[UIImage imageWithData:data]];
            }
        }];
        
    }
    
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame imageUrl:(NSString *)url placeholderImageNamed:(NSString *)placeholderImageNamed contentMode:(UIViewContentMode)contentMode {

    
    if ((self = [super initWithFrame:frame])) {
        
        [self setImage:[UIImage imageNamed:placeholderImageNamed]];
        [self setContentMode:contentMode];
        
        __weak typeof(self) weakSelf = self;
        [NSURLConnection urlRequest:url success:^(NSData * __nullable data, NSError * __nullable error) {
            if (error == nil) {
                [weakSelf setImage:[UIImage imageWithData:data]];
            }
        }];
        
    }
    
    return self;
}

@end
