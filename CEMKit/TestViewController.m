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
    
    UIView *circleFill = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
    [circleFill drawCircleWithColor:[CEMKit randomColor]];
    [self.view addSubview:circleFill];
    
    UIView *circleStroke = [[UIView alloc] initWithFrame:CGRectMake(10, 70, 50, 50)];
    [circleStroke drawCircleStrokeWithColor:[CEMKit randomColor] width:2];
    [self.view addSubview:circleStroke];
    
    UIView *circleFillStroke = [[UIView alloc] initWithFrame:CGRectMake(10, 130, 50, 50)];
    [circleFillStroke drawCircleWithColor:[CEMKit randomColor] strokeColor:[CEMKit randomColor] width:5];
    [self.view addSubview:circleFillStroke];
}

- (void)buttonPress:(id)sender {
    NSLog(@"buttonPress");
}

@end
