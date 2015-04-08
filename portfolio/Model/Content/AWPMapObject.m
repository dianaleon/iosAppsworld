//
//  AWPContactMapObject.m
//  portfolio
//
//  Created by admin on 9/18/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPMapObject.h"

@implementation AWPMapObject

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super initWithDictionary:dictionary]) {
        _nombre_pin = [self.internalData objectForKey:@"nombre_pin"];
        _coordenadas_pin = [[AWPCoordinate2D alloc] initWithCoordinateString:[self.internalData objectForKey:@"coordenadas_pin"]];
        _coordenadas_map = [[AWPCoordinate2D alloc] initWithCoordinateString:[self.internalData objectForKey:@"coordenadas_map"]];
        _direccion= [self.internalData objectForKey:@"direccion"];
        _zoom = [[self.internalData objectForKey:@"zoom"] floatValue];
        
    }
    
    return self;
}

@end
