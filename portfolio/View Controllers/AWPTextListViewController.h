//
//  AWPTextListViewController.h
//  portfolio
//
//  Created by admin on 7/23/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPPageViewController.h"
#import "MIHGradientView.h"

@interface AWPTextListViewController : AWPPageViewController

@property (strong, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet UILabel *titulo;
@property (weak, nonatomic) IBOutlet MIHGradientView *bgTitulo;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
