//
//  CJAHandlerBase.m
//  CJAHandler
//
//  Created by Carl Jahn on 07.01.15.
//  Copyright (c) 2015 Carl Jahn. All rights reserved.
//

#import "CJAHandlerBase.h"

@interface CJAHandlerBase ()

@property (nonatomic, readwrite, assign) id sourceObject;

@end

@implementation CJAHandlerBase

- (void)registerSourceObject:(id)sourceObject {
    
    self.sourceObject = sourceObject;
}

- (void)unregisterSourceObject {
    
    self.sourceObject = nil;
}

+ (id)verifiedHandlerForHandler:(id)handler sourceObject:(id)object {
    
    CJAHandlerBase *baseHandler = (CJAHandlerBase *)handler;
    if ([baseHandler.requiredClass isSubclassOfClass:[object class]]) {
        
        return baseHandler;
    }
    
    return nil;
}

@end
