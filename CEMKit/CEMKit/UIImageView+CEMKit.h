//
//  UIImageView+CEMKit.h
//  CEMKit
//
//  Created by Cem Olcay on 18/06/15.
//  Copyright © 2015 studionord. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImageView (CEMKit)

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image;
- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image contentMode:(UIViewContentMode)contentMode;

- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName;
- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName contentMode:(UIViewContentMode)contentMode;

- (instancetype)initWithFrame:(CGRect)frame imageUrl:(NSString *)url;
- (instancetype)initWithFrame:(CGRect)frame imageUrl:(NSString *)url contentMode:(UIViewContentMode)contentMode;

- (instancetype)initWithFrame:(CGRect)frame imageUrl:(NSString *)url placeholderImage:(UIImage *)placeholderImage;
- (instancetype)initWithFrame:(CGRect)frame imageUrl:(NSString *)url placeholderImage:(UIImage *)placeholderImage contentMode:(UIViewContentMode)contentMode;

- (instancetype)initWithFrame:(CGRect)frame imageUrl:(NSString *)url placeholderImageNamed:(UIImage *)placeholderImageNamed;
- (instancetype)initWithFrame:(CGRect)frame imageUrl:(NSString *)url placeholderImageNamed:(UIImage *)placeholderImageNamed contentMode:(UIViewContentMode)contentMode;

@end
