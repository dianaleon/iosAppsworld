//
//  AWPOneImageTextListViewController.h
//  portfolio
//
//  Created by diana leon on 11/14/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//


#import "AWPPageViewController.h"
#import "MIHGradientView.h"

@interface AWPOneImageTextListViewController : AWPPageViewController

@property (strong, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet UILabel *titulo;
@property (weak, nonatomic) IBOutlet MIHGradientView *bgTitulo;

@property (weak, nonatomic) IBOutlet UIImageView *imagen;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end