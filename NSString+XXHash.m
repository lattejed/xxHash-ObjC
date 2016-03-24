//
//  NSString+XXHash.m
//  xxHash-ObjC
//
//  Created by Matthew Smith on 3/24/16.
//  Copyright © 2016 Latte, Jed?. All rights reserved.
//

#import "NSString+XXHash.h"
#import "NSData+XXHash.h"

@implementation NSString (XXHash)

- (NSString *)xxh32 {
    return [self dataUsingEncoding:NSUTF8StringEncoding].xxh32;
}

- (NSString *)xxh64 {
    return [self dataUsingEncoding:NSUTF8StringEncoding].xxh64;
}

@end
