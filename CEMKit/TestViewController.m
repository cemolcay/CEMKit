//
//  TestViewController.m
//  CEMKit
//
//  Created by Cem Olcay on 11/06/14.
//  Copyright (c) 2014 studionord. All rights reserved.
//

#import "TestViewController.h"

@implementation TestViewController

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:ScreenRect];
    
    UIView *page = [[UIView alloc] initWithFrame:[CEMKit rectWithPadding:10 parentRect:ScreenRect]];
    [page addCornerRadius:10];
    [page addBorderWithWidth:1 color:[UIColor grayColor]];
    [self.view addSubview:page];
    
    UIButton *but = [CEMKit buttonWithX:10 Y:10 Width:page.frame.size.width-20 Height:60 Title:@"but" Font:nil TitleColor:[UIColor blackColor] target:self selector:@selector(buttonPress:)];
    [but addCornerRadius:10];
    [but addGradientWithStartColor:[UIColor clearColor] endColor:[UIColor redColor]];
    [page addSubview:but];
    
    [CEMKit jsonRequest:@"https://www.zet.com/api/v1/produc" json:^(id object) {
        NSLog(@"%@", object);
    } error:nil];
}

- (void)buttonPress:(id)sender {
    NSLog(@"buttonPress");
}

@end
