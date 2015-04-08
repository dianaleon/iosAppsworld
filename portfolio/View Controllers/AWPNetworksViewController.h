//
//  AWPNetworksViewController.h
//  portfolio
//
//  Created by diana leon on 4/1/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPPageViewController.h"
@interface AWPNetworksViewController : AWPPageViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIScrollView *bgScroll;

@property (strong, nonatomic) IBOutlet UIView *bgPage;
@property (weak, nonatomic) IBOutlet MIHGradientView *bgTitulo;
@property (weak, nonatomic) IBOutlet UILabel *titulo;
@end
