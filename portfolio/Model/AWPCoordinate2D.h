//
//  AWPCoordinate2D.h
//  portfolio
//
//  Created by admin on 9/18/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface AWPCoordinate2D : NSObject
@property (nonatomic, readonly) NSString* coordinate;
@property (nonatomic, readonly) CLLocationDegrees latitude;
@property (nonatomic, readonly) CLLocationDegrees longitude;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate2D;

-(instancetype)initWithCoordinateString:(NSString*)coordinate;


@end
