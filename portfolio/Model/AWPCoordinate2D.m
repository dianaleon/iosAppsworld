//
//  AWPCoordinate2D.m
//  portfolio
//
//  Created by admin on 9/18/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPCoordinate2D.h"

@implementation AWPCoordinate2D


- (instancetype)initWithCoordinateString:(NSString *)coordinate {
    if (self = [super init]) {
        _coordinate = coordinate;
    }
    return self;
}

- (CLLocationDegrees)latitude
{
    NSMutableArray *latLon = [NSMutableArray arrayWithArray: [self.coordinate componentsSeparatedByString:@";"]];
    NSString* latStr = @"0";
    if (latLon.count>0) {
        latStr = [latLon objectAtIndex:0];
    }
    return [latStr doubleValue];
    
}


- (CLLocationDegrees)longitude
{
    NSMutableArray *latLon = [NSMutableArray arrayWithArray: [self.coordinate componentsSeparatedByString:@";"]];
    NSString* lonStr = @"0";
    if (latLon.count>1) {
        lonStr = [latLon objectAtIndex:1];
    }
    return [lonStr doubleValue];
    
}

-(CLLocationCoordinate2D) coordinate2D
{
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = self.latitude;
    coordinate.longitude = self.longitude;
    return coordinate;
}

@end
