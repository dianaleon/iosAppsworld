//
//  AWPImageTextTitleViewController.h
//  portfolio
//
//  Created by diana leon on 11/13/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

 

#import "AWPPageViewController.h"
#import "MIHGradientView.h"

@interface AWPImageTextTitleViewController : AWPPageViewController

@property (strong, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet UIImageView *imagen;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet MIHGradientView *bgTitulo;
@property (weak, nonatomic) IBOutlet UILabel *titulo;
@property (weak, nonatomic) IBOutlet UIView *bgTexto;
@property (weak, nonatomic) IBOutlet UILabel *texto;
@property (weak, nonatomic) IBOutlet UILabel *contentTitle;
@end