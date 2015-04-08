//
//  AWPAccordionTextListViewController.h
//  portfolio
//
//  Created by admin on 7/24/14.
//  Copyright (c) 2014 Guillermo Chiacchio. All rights reserved.
//

#import "AWPPageViewController.h"
#import "MIHGradientView.h"

@interface AWPAccordionTextListContainerViewController : AWPPageViewController
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet MIHGradientView *bgTitulo;
@property (weak, nonatomic) IBOutlet UILabel *titulo;

@end
