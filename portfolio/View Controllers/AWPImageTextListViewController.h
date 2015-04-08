//
//  AWPImageTextListViewController.h
//  portfolio
//
//  Created by diana leon on 11/7/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//
 



#import "AWPPageViewController.h"

@interface AWPImageTextListViewController : AWPPageViewController

@property (strong, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet UILabel *titulo;
@property (weak, nonatomic) IBOutlet MIHGradientView *bgTitulo;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end