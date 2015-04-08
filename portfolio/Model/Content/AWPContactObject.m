//
//  AWPContactObject.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 4/3/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPContactObject.h"
#import "AWPMapObject.h"

@implementation AWPContactObject

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super initWithDictionary:dictionary]) {
        _type = object_type_contact;
        NSString* tipo = [[dictionary objectForKey:@"tipo"] lowercaseString];
        _subtype =tipo;
        
        if (tipo && [[tipo lowercaseString] isEqualToString:@"map"]) {
            _subObject = [[AWPMapObject alloc] initWithDictionary:dictionary];
        }
        
    }
    
    return self;
}

@end
