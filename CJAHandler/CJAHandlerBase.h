//
//  CJAHandlerBase.h
//  CJAHandler
//
//  Created by Carl Jahn on 07.01.15.
//  Copyright (c) 2015 Carl Jahn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJAHandlerBase : NSObject

@property (nonatomic, assign) Class requiredClass;

- (void)registerSourceObject:(id)sourceObject;
- (void)unregisterSourceObject;

@property (nonatomic, readonly, assign) id sourceObject;

+ (id)verifiedHandlerForHandler:(id)handler sourceObject:(id)object;


@end
