//
//  NSData+XXHash.m
//  xxHash-ObjC
//
//  Created by Matthew Smith on 3/24/16.
//  Copyright © 2016 Latte, Jed?. All rights reserved.
//

#import "NSData+XXHash.h"
#import "xxhash.h"

@implementation NSData (XXHash)

- (NSString *)xxh32 {
    
    static XXH32_state_t* state = NULL;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        state = XXH32_createState();
    });
    XXH_errorcode ec = XXH32_reset(state, 0x5bd1e995);
    if (ec != XXH_OK) {
        @throw NSGenericException;
    }
    ec = XXH32_update (state, [self bytes], [self length]);
    if (ec != XXH_OK) {
        @throw NSGenericException;
    }
    unsigned int val = XXH32_digest(state);
    return [NSString stringWithFormat:@"%x", val];
}

- (NSString *)xxh64 {
    
    static XXH64_state_t* state = NULL;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        state = XXH64_createState();
    });
    XXH_errorcode ec = XXH64_reset(state, 0x5bd1e995);
    if (ec != XXH_OK) {
        @throw NSGenericException;
    }
    ec = XXH64_update (state, [self bytes], [self length]);
    if (ec != XXH_OK) {
        @throw NSGenericException;
    }
    unsigned long long val = XXH64_digest(state);
    return [NSString stringWithFormat:@"%llx", val];
}

@end
