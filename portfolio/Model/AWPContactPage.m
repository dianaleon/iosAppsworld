//
//  AWPContactPage.m
//  portfolio
//
//  Created by Guillermo Chiacchio on 4/3/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPContactPage.h"

@implementation AWPContactPage

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super initWithDictionary:dictionary]) {
        
        NSArray * data = [dictionary objectForKey:@"data"];
        for (NSDictionary* content in data) {
            AWPContactObject* contact = [[AWPContactObject alloc] initWithDictionary:content];
            NSString* tipo = [[content objectForKey:@"tipo"] lowercaseString];
            
            if ([contact.subtype isEqualToString:@"direccion"]){
                [_objects addObject:contact];
            } else if ([contact.subtype isEqualToString:@"telefono"]){
                [_objects addObject:contact];
            } else if ([contact.subtype isEqualToString:@"email"]){
                [_objects addObject:contact];
            } else if ([contact.subtype isEqualToString:@"web"]){
                [_objects addObject:contact];
            } else if ([contact.subtype isEqualToString:@"map"]){
                [_objects addObject:contact];
            }
            
        }
    }
    return self;
}


@end
