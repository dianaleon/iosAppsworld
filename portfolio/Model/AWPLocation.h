//
//  AWPLocation.h
//  portfolio
//
//  Created by admin on 9/19/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface AWPLocation : NSObject <MKAnnotation>

- (id)initWithName:(NSString*)name address:(NSString*)address coordinate:(CLLocationCoordinate2D)coordinate;
- (MKMapItem*)mapItem;

@end
