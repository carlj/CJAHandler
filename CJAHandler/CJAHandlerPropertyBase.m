//
//  CJAHandlerPropertyBase.m
//  CJAHandler
//
//  Created by Carl Jahn on 07.01.15.
//  Copyright (c) 2015 Carl Jahn. All rights reserved.
//

#import "CJAHandlerPropertyBase.h"
#import <objc/runtime.h>

@interface CJAHandlerPropertyBase ()

@property (nonatomic, readwrite, assign) id propertyObject;

@end

@implementation CJAHandlerPropertyBase

- (void)registerPropertyObject:(id)property {
    
    self.propertyObject = property;
}

- (void)unregisterSourceObject {
    self.propertyObject = nil;
    
    [super unregisterSourceObject];
}

+ (id)verifiedHandlerForHandler:(id)handler sourceObject:(id)object {
    
    id propertyObject = [self handledObjectForHandler:handler sourceObject:object];
    if (propertyObject) {
        
        [handler registerPropertyObject:propertyObject];
        return handler;
    }
    
    return nil;
}

+ (id)handledObjectForHandler:(CJAHandlerPropertyBase *)handler sourceObject:(id)object {
    
    //https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtPropertyIntrospection.html
    unsigned int propertyCount = 0;
    objc_property_t *properties = class_copyPropertyList([object class], &propertyCount);
    
    for (int prop = 0; prop < propertyCount; prop++) {
        // for all property attributes
        unsigned int attributeCount = 0;
        objc_property_t property = properties[prop];
        objc_property_attribute_t* attributes = property_copyAttributeList(property, &attributeCount);
        
        NSString *previousClassName = nil;
        for (unsigned int attr = 0; attr < attributeCount; attr++) {
            //NSLog(@"Prop %d: name: %s, value: %s", prop, attributes[attr].name, attributes[attr].value);
            
            NSString *propertyTypeName = [NSString stringWithUTF8String:attributes[attr].name];
            NSString *propertyTypeValue = [NSString stringWithUTF8String:attributes[attr].value];
            if ([propertyTypeName isEqualToString:@"T"]) {
                
                previousClassName = [propertyTypeValue substringWithRange:NSMakeRange(2, propertyTypeValue.length - 3)];
                continue;
            }
            
            if ([propertyTypeName isEqualToString:@"V"] && [previousClassName isEqualToString:NSStringFromClass(handler.requiredPropertyClass)]) {
                
                propertyTypeValue = [propertyTypeValue substringWithRange:NSMakeRange(1, propertyTypeValue.length - 1)];
                return [object valueForKey:propertyTypeValue];
            }
        }
    }
    
    return nil;
}

@end
