//
//  AWPMapViewController.m
//  portfolio
//
//  Created by diana leon on 9/17/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPMapViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "AWPImagePage.h"
#import "AWPNetworkObject.h"
#import "AWPLocation.h"

#define METERS_PER_MILE 1609.344

@interface AWPMapViewController ()
@end

@implementation AWPMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    
}

- (void)viewWillAppear:(BOOL)animated {
    // 1
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = self.mapObject.coordenadas_map.latitude;
    zoomLocation.longitude= self.mapObject.coordenadas_map.longitude;
    
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, self.mapObject.zoom*METERS_PER_MILE, self.mapObject.zoom*METERS_PER_MILE);
    
    @try {
        // 3
        [_mapView setRegion:viewRegion animated:YES];
        [self plotPin];
    }
    @catch (NSException *exception) {
        [self backTouched:nil];
    }
  
}

- (void)plotPin {
    for (id<MKAnnotation> annotation in _mapView.annotations) {
        [_mapView removeAnnotation:annotation];
    }
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = self.mapObject.coordenadas_pin.latitude;
    coordinate.longitude = self.mapObject.coordenadas_pin.longitude;
    AWPLocation *annotation = [[AWPLocation alloc] initWithName:self.mapObject.nombre_pin address:self.mapObject.direccion coordinate:coordinate];
    [_mapView addAnnotation:annotation];
}

- (IBAction)backTouched:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{}];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
