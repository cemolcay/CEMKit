//
//  NSURLConnection+CEMKIt.h
//  CEMKit
//
//  Created by Cem Olcay on 18/06/15.
//  Copyright © 2015 studionord. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^URLRequestCompletion)(NSData* __nullable data, NSError __nullable *error);
typedef void(^JSONResponseCompletion)(id __nullable object, NSError __nullable *error);

@interface NSURLConnection (CEMKIt)

+ (void)urlRequest:(NSString * __nonnull)url success:(URLRequestCompletion __nullable)completion;
+ (void)jsonRequest:(NSString * __nonnull)url json:(JSONResponseCompletion __nullable)completion;

@end
