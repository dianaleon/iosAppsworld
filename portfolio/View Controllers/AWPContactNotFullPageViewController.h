//
//  AWPContactNotFullPageViewController.m
//  portfolio
//
//  Created by diana leon on 2/2/15.
//  Copyright (c) 2015 Guillermo Chiacchio. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AWPPageViewController.h"
#import "MIHGradientView.h"
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "AWPMapObject.h"


@interface AWPContactNotFullPageViewController : AWPPageViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MKMapViewDelegate>


@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@property (strong, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet MIHGradientView *bgTitulo;
@property (weak, nonatomic) IBOutlet UILabel *titulo;
@end
