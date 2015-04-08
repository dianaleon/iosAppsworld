//
//  AWPContactNotFullPageViewController.m
//  portfolio
//
//  Created by diana leon on 2/2/15.
//  Copyright (c) 2015 Guillermo Chiacchio. All rights reserved.
//

#import "AWPContactNotFullPageViewController.h"
#import "AWPContactPage.h"
#import "UIColor+ColorWithHex.h"
#import "AWPPage.h"
#import "AWPContactObject.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

#import "AWPMenuViewController.h"
#import "RZTelprompt.h"
#import "CGLMailHelper.h"
//#import "AWPMapViewController.h"

#import "AWPLocation.h"

#define METERS_PER_MILE 1609.344

@interface AWPContactNotFullPageViewController ()
@property (nonatomic, assign) AWPMenu* menu;
@property (nonatomic, assign) AWPTheme* theme;
@property (nonatomic, assign) AWPContactPage* page;
@end

@implementation AWPContactNotFullPageViewController

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
    //datos del menu
    AWPPortfolioManager* pfMan = [AWPPortfolioManager sharedManager];
    self.menu = pfMan.portfolio.menu;
    self.theme = pfMan.portfolio.theme;
    
    AWPContactPage* cPage = (AWPContactPage*)self.page;
    
    //se rellena el titulo y subtitulo de la app
      //FUENTES
   
    
    //    AWPContactObject* cObj = [cPage.objects objectAtIndex:0];
    
    //NSString* home_img = pfMan.portfolio.theme.homeImage;
    //[self.bgImage setImageWithURL:[NSURL URLWithString:home_img]];
    
    self.bgImage.backgroundColor = [UIColor colorWithHexString: cPage.type.background.bgStartColor andAlpha:1 ];
    
    //    AWPTextPage* plPage = (AWPTextPage*)self.page;
    
    self.titulo.text = cPage.title;
    
    //gradiente
    self.bgTitulo.startPoint = CGPointMake(0.0, 0.0);
    self.bgTitulo.endPoint = CGPointMake(1.0, 1.0);
    self.bgTitulo.startColor =[UIColor colorWithHexString: self.theme.titleBarBackground.bgStartColor andAlpha:1 ];
    self.bgTitulo.endColor =[UIColor colorWithHexString: self.theme.titleBarBackground.bgEndColor  andAlpha:1];
    
    //[self applyShadowToView:self.bgTitulo];
    
    
    
}
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    AWPContactPage* cPage = (AWPContactPage*)self.page;
    return cPage.objects.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AWPContactObject* tObj = [self.page.objects objectAtIndex:indexPath.row];
    
    
    
    NSString* cellIdentifier = @"ContactCollectionCell";
    
    
    UITapGestureRecognizer *tapGesture=nil;
    NSString* subtype = [tObj.subtype lowercaseString];
    if ([subtype isEqualToString:@"telefono"]) {
        tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(telTouched:)];
    } else if ([subtype isEqualToString:@"email"]) {
        tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(emailTouched:)];
    } else if ([subtype isEqualToString:@"web"]) {
        tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(webTouched:)];
    } else if ([subtype isEqualToString:@"map"]) {
        cellIdentifier=@"ContactMapImageCollectionCell";
        //        tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mapTouched:)];
    } else if ([subtype isEqualToString:@"map_img"]) {
        cellIdentifier=@"ContactMapImageCollectionCell";
        tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(webTouched:)];
    }
    
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if ([subtype isEqualToString:@"map_img"]) {
        UIImageView* image = (UIImageView*) [cell viewWithTag:3];
        [image setImageWithURL:[NSURL URLWithString:tObj.content_img]];
    }
    
    if ([subtype isEqualToString:@"map"]) {
        
        MKMapView *mapView = (MKMapView*) [cell viewWithTag:4];
        mapView.delegate = self;
        AWPMapObject* mapObject = (AWPMapObject*)tObj.subObject;
        // 1
        CLLocationCoordinate2D zoomLocation;
        zoomLocation.latitude = mapObject.coordenadas_map.latitude;
        zoomLocation.longitude= mapObject.coordenadas_map.longitude;
        
        // 2
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, mapObject.zoom*METERS_PER_MILE, mapObject.zoom*METERS_PER_MILE);
        
        @try {
            // 3
            [mapView setRegion:viewRegion animated:YES];
            [self plotPinInMap:mapView withMapObject:mapObject];
        }
        @catch (NSException *exception) {
            UIImageView* image = (UIImageView*) [cell viewWithTag:3];
            [image setImageWithURL:[NSURL URLWithString:tObj.content_img]];
        }
        
        MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
        
        request.source = [MKMapItem mapItemForCurrentLocation];
        
        AWPLocation *destination = mapView.annotations[0];
        
        request.destination = destination.mapItem;
        request.requestsAlternateRoutes = YES;
        MKDirections *directions =
        [[MKDirections alloc] initWithRequest:request];
        
        [directions calculateDirectionsWithCompletionHandler:
         ^(MKDirectionsResponse *response, NSError *error) {
             if (error) {
                 // Handle Error
             } else {
                 [self showRouteInMap:mapView withResponse:response];
             }
         }];
        
        //        NSDictionary *options = @{
        //                                  MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving
        //                                  };
        //
        //        [destination.mapItem openInMapsWithLaunchOptions:options];
        
    }
    
    
    //gradiente
   // MIHGradientView *grad = (MIHGradientView*)[cell viewWithTag:1];
   // grad.startPoint = CGPointMake(0.0, 0.0);
   // grad.endPoint = CGPointMake(1.0, 1.0);
   // grad.startColor =[UIColor colorWithHexString: tObj.background.bgStartColor andAlpha:1 ];
//    grad.endColor =[UIColor colorWithHexString: tObj.background.bgEndColor  andAlpha:1];
    
    //    grad.backgroundColor = [UIColor clearColor];
    UILabel *titulo = (UILabel*)[cell viewWithTag:2];
    titulo.text = tObj.content;
    titulo.textColor = [UIColor colorWithHexString: tObj.textColor andAlpha:1 ];
    //    [titulo setFont:[UIFont fontWithName:@"CopperplateGothicStd-33BC" size:18]];
    
    
    //if (tapGesture) {
      //  [grad addGestureRecognizer:tapGesture];
    //}
    
   // [grad superview].tag = indexPath.item;
    
    return cell;
    
    
}

- (void)plotPinInMap:(MKMapView *)mapView withMapObject:(AWPMapObject*)mapObject {
    for (id<MKAnnotation> annotation in mapView.annotations) {
        [mapView removeAnnotation:annotation];
    }
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = mapObject.coordenadas_pin.latitude;
    coordinate.longitude = mapObject.coordenadas_pin.longitude;
    AWPLocation *annotation = [[AWPLocation alloc] initWithName:mapObject.nombre_pin address:mapObject.direccion coordinate:coordinate];
    [mapView addAnnotation:annotation];
}

-(void)showRouteInMap:(MKMapView *)mapView withResponse:(MKDirectionsResponse *)response
{
    for (MKRoute *route in response.routes)
    {
        [mapView
         addOverlay:route.polyline level:MKOverlayLevelAboveRoads];
    }
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id < MKOverlay >)overlay
{
    MKPolylineRenderer *renderer =
    [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    renderer.strokeColor = [UIColor blueColor];
    renderer.lineWidth = 5.0;
    return renderer;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    AWPContactPage* cPage = (AWPContactPage*)self.page;
    AWPContactObject* tObj = [cPage.objects objectAtIndex:indexPath.row];
    NSString* subtype = [tObj.subtype lowercaseString];
    if ([subtype isEqualToString:@"map_img"] || [subtype isEqualToString:@"map"]) {
        return CGSizeMake(280.0, 371.0);
    }
    else
        return ((UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout).itemSize;
}


- (void)telTouched:(UITapGestureRecognizer*)sender
{
    MIHGradientView *grad = (MIHGradientView*)sender.view;
    UILabel *telLabel = (UILabel*)[grad viewWithTag:2];
    NSString* telNumber = [telLabel.text stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    [RZTelprompt callWithString:telNumber];
}

- (void)emailTouched:(UITapGestureRecognizer*)sender
{
    MIHGradientView *grad = (MIHGradientView*)sender.view;
    UILabel *emailLabel = (UILabel*)[grad viewWithTag:2];
    
    UIViewController *mailVC = [CGLMailHelper mailViewControllerWithRecipients:@[emailLabel.text]
                                                                       subject:@""
                                                                       message:@""
                                                                        isHTML:NO
                                                                includeAppInfo:NO
                                                                    completion:^(NSString *result, NSError *error) {
                                                                        if (error) {
                                                                            NSLog(@"Error: %@", [error localizedDescription]);
                                                                        } else {
                                                                            NSLog(@"Result: %@",result);
                                                                        }
                                                                    }];
    
    [self presentViewController:mailVC animated:YES completion:nil];
}

//- (void)mapTouched:(UITapGestureRecognizer*)sender
//{
//    MIHGradientView *grad = (MIHGradientView*)sender.view;
//    int index = [grad superview].tag;
//
//    AWPMapViewController *pageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"map_page"];
//    AWPContactObject* tObj = [self.page.objects objectAtIndex:index];
//
//    pageVC.mapObject = (AWPMapObject*)tObj.subObject;
//    [self presentViewController:pageVC animated:YES completion:nil];
//}



- (void)webTouched:(UITapGestureRecognizer*)sender
{
    MIHGradientView *grad = (MIHGradientView*)sender.view;
    UILabel *webLabel = (UILabel*)[grad viewWithTag:2];
    NSString* webStringURL = [webLabel.text stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    
    
    NSURL * url = [NSURL URLWithString:webStringURL];
    if (![[url scheme] length])
    {
        url = [NSURL URLWithString:[@"http://" stringByAppendingString:webStringURL]];
    }
    [[UIApplication sharedApplication] openURL:url];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
