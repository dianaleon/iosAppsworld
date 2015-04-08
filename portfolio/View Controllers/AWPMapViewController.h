//
//  AWPMapViewController.h
//  portfolio
//
//  Created by diana leon on 9/17/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "AWPPageViewController.h"
#import <MapKit/MapKit.h>
#import "AWPMapObject.h"

@interface AWPMapViewController : AWPPageViewController <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic) AWPMapObject* mapObject;

@end
