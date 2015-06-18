//
//  NSURLConnection+CEMKIt.m
//  CEMKit
//
//  Created by Cem Olcay on 18/06/15.
//  Copyright © 2015 studionord. All rights reserved.
//

#import "NSURLConnection+CEMKIt.h"

@implementation NSURLConnection (CEMKIt)

+ (void)urlRequest:(NSString *)url success:(URLRequestCompletion)completion {
    
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest
                                              requestWithURL:[NSURL URLWithString:url]]
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse * __nullable response, NSData * __nullable data, NSError * __nullable connectionError) {
                               if (completion != nil) {
                                   completion(data, connectionError);
                               }
                           }];
}

+ (void)jsonRequest:(NSString *)url json:(JSONResponseCompletion)completion {
    
    [self urlRequest:url success:^(NSData *data, NSError *error) {
        
        if (error != nil) {
            completion(nil, error);
        }
        
        NSError *jsonError;
        id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
        
        completion (jsonObject, jsonError);
    }];
}

@end
