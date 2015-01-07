//
//  CJAHandlerManager.m
//  CJAHandler
//
//  Created by Carl Jahn on 07.01.15.
//  Copyright (c) 2015 Carl Jahn. All rights reserved.
//

#import "CJAHandlerManager.h"
#import "CJAHandlerBase.h"

@interface CJAHandlerManager ()

@property (nonatomic, strong) NSArray *handlers;

@end

@implementation CJAHandlerManager

- (void)dealloc {
    
    [self unregisterSourceObject];
}

- (id)initWithHandlers:(NSArray *)handlers {
    
    self = [super init];
    if (self) {
        self.handlers = handlers;
    }
    
    return self;
}

- (void)unregisterSourceObject {
    
    for (CJAHandlerBase *handler in self.handlers) {
        
        [handler unregisterSourceObject];
    }
}

- (void)registerSourceObjects:(NSArray *)sourceObjects {
    
    NSMutableArray *newHandlers = [NSMutableArray array];
    for (id sourceObj in sourceObjects) {
        
        for (CJAHandlerBase *handler in self.handlers) {
            
            CJAHandlerBase *assignedHandler = [[handler class] verifiedHandlerForHandler:handler sourceObject:sourceObj];
            if (assignedHandler) {
                
                [handler registerSourceObject:sourceObj];
                [newHandlers addObject:handler];
            }
            
        }
    }
    
    self.handlers = newHandlers;
}

@end
