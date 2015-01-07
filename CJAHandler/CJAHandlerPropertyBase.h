//
//  CJAHandlerPropertyBase.h
//  CJAHandler
//
//  Created by Carl Jahn on 07.01.15.
//  Copyright (c) 2015 Carl Jahn. All rights reserved.
//

#import "CJAHandlerBase.h"

@interface CJAHandlerPropertyBase : CJAHandlerBase

@property (nonatomic, assign) Class requiredPropertyClass;

- (void)registerPropertyObject:(id)property;

@property (nonatomic, readonly, assign) id propertyObject;

@end
