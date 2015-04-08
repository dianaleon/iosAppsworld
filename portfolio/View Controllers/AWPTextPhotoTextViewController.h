//
//  AWP.h
//  portfolio
//
//  Created by diana leon on 11/12/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//




#import "AWPPageViewController.h"
#import "MIHGradientView.h"

@interface AWPTextPhotoTextViewController : AWPPageViewController

@property (weak, nonatomic) IBOutlet MIHGradientView *bgBody;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet MIHGradientView *bgTitulo;
@property (weak, nonatomic) IBOutlet UILabel *titulo;

@end