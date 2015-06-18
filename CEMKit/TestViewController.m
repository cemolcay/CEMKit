//
//  TestViewController.m
//  CEMKit
//
//  Created by Cem Olcay on 11/06/14.
//  Copyright (c) 2014 studionord. All rights reserved.
//

#import "TestViewController.h"

@implementation TestViewController

- (void)viewDidLoad {
    
    UILabel *lbl = [[UILabel alloc] initWithX:20
                                            y:30
                                        width:self.view.width - 40
                               attributedText:[[NSAttributedString alloc] initWithText:@"loprekoak jka nan jadjk kjnqwnqwjk njq sajnjadn akjnd jkadjkansjkdn ajskn "
                                                                             textColor:[UIColor gray:51]
                                                                                  font:[UIFont systemFontOfSize:25]]
                                textAlignment:NSTextAlignmentLeft];
    [self.view addSubview:lbl];
    
    UILabel *otr = [[UILabel alloc] initWithX:20
                                            y:[lbl bottomWithOffset:10]
                                        width:self.view.width - 40
                               attributedText:[[NSAttributedString alloc] initWithAttributedStrings:^(NSMutableAttributedString *atts) {
                                    [atts appendAttributedString:[[NSAttributedString alloc] initWithText:@"asdsa" textColor:[UIColor redColor] font:[UIFont systemFontOfSize:15]]];
                                    [atts appendAttributedString:[[NSAttributedString alloc] initWithText:@"\nasndj jknakjnndj q" textColor:[UIColor blueColor] font:[UIFont systemFontOfSize:20]]];
                                }]
                                textAlignment:NSTextAlignmentLeft];
    [self.view addSubview:otr];
}

@end
