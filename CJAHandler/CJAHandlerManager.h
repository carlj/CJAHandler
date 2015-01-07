//
//  CJAHandlerManager.h
//  CJAHandler
//
//  Created by Carl Jahn on 07.01.15.
//  Copyright (c) 2015 Carl Jahn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJAHandlerManager : NSObject

- (id)initWithHandlers:(NSArray *)handlers;

- (void)registerSourceObjects:(NSArray *)sourceObjects;
- (void)unregisterSourceObject;

@end
