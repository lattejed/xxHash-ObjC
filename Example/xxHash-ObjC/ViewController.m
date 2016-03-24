//
//  ViewController.m
//  xxHash-ObjC
//
//  Created by Matthew Smith on 3/24/16.
//  Copyright © 2016 Latte, Jed?. All rights reserved.
//

#import "ViewController.h"
#import "NSData+XXHash.h"
#import "NSString+XXHash.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString* str = @"This is a test string";
    
    NSData* data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@ -> xxh32 -> %@", str, data.xxh32);
    
    data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@ -> xxh64 -> %@", str, data.xxh64);
    
    NSLog(@"%@ -> xxh32 -> %@", str, str.xxh32);
    NSLog(@"%@ -> xxh64 -> %@", str, str.xxh64);
    
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
