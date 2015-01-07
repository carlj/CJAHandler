//
//  CJAExamplePropertyHandler.m
//  CJAHandler
//
//  Created by Carl Jahn on 07.01.15.
//  Copyright (c) 2015 Carl Jahn. All rights reserved.
//

#import "CJAExamplePropertyHandler.h"
#import <UIKit/UIKit.h>

@implementation CJAExamplePropertyHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.requiredPropertyClass = [UIButton class];
    }
    return self;
}

- (void)registerPropertyObject:(id)property {
    [super registerPropertyObject:property];
    
    [property addTarget:self action:@selector(testAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)unregisterSourceObject {
    
    [self.propertyObject removeTarget:self action:@selector(testAction:) forControlEvents:UIControlEventTouchUpInside];
    [super unregisterSourceObject];
}

- (void)testAction:(id)sender {
    
    NSLog(@"%s", __FUNCTION__);
}

@end
