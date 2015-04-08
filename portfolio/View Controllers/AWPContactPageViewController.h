//
//  AWPContactPageViewController.h
//  portfolio
//
//  Created by diana leon on 4/7/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPPageViewController.h"
#import "MIHGradientView.h"
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "AWPMapObject.h"


@interface AWPContactPageViewController : AWPPageViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MKMapViewDelegate>


@property (weak, nonatomic) IBOutlet UILabel *tituloApp;
@property (weak, nonatomic) IBOutlet UILabel *subtituloApp;
@property (weak, nonatomic) IBOutlet MIHGradientView *bgHeader;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@property (strong, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet MIHGradientView *bgTitulo;
@property (weak, nonatomic) IBOutlet UILabel *titulo;
@end
