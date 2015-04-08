//
//  AWPViewController.h
//  portfolio
//
//  Created by Guillermo Chiacchio on 2/6/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AWPPageViewController.h"
#import "MIHGradientView.h"
@interface AWPMenuGridIconViewController : AWPPageViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>


@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet MIHGradientView *bgTitle;
@property (weak, nonatomic) IBOutlet UILabel *tituloAplicacion;

@end
