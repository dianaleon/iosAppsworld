//
//  AWPContactMapObject.h
//  portfolio
//
//  Created by admin on 9/18/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPContactObject.h"
#import "AWPCoordinate2D.h"

@interface AWPMapObject : AWPBaseModel

@property (nonatomic, readonly) NSString* nombre_pin;
@property (nonatomic, readonly) AWPCoordinate2D* coordenadas_pin;
@property (nonatomic, readonly) AWPCoordinate2D* coordenadas_map;
@property (nonatomic, readonly) float zoom;
@property (nonatomic, readonly) NSString* direccion;

@end
